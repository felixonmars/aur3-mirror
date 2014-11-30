#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <ncurses.h>
#include <unistd.h>

#define ROWS 30
#define COLS 120
#define STARTING_SIZE 3

/* eigenvectors associated to snake movements */
#define RIGHT 10
#define LEFT -10
#define UP -1
#define DOWN 1

/* chars to be printed */
#define SNAKE_CHAR "O"
#define FRUIT_CHAR "*"

typedef struct list {
    int direction;
    struct list *next;
    struct list *previous;
} snake;

/* Program state struct */
struct state {
    int rowtot;
    int coltot;
    int points;
    int lose;
    snake *s;
    WINDOW *field;
    WINDOW *score;
};

struct point {
    int x;
    int y;
};

static int screen_init(void);
static void screen_end(void);
static snake *reclist(int i, snake *previous);
static void freelist(snake *s);
static void fruit_gen(void);
static void grid_init(void);
static void change_directions(void);
static void eat_fruit();
static void snake_move(void);
static snake *snake_grow();
static int main_cycle(void);
static int size(snake *s);
static void colored_print(WINDOW *win, int x, int y, char *c, int color);

static struct state ps;
static struct point snake_head, snake_tail;

int main(void)
{
    ps.lose = 0;
    ps.points = 0;
    srand(time(NULL));
    if (screen_init())
        return 1;
    grid_init();
    while (!ps.lose) {
        if (!main_cycle())
            break;
    }
    freelist(ps.s);
    screen_end();
    return 0;
}

static int screen_init(void)
{
    initscr();
    start_color();
    init_pair(1, COLOR_RED, COLOR_BLACK);
    init_pair(2, COLOR_GREEN, COLOR_BLACK);
    init_pair(3, COLOR_YELLOW, COLOR_BLACK);
    init_pair(4, COLOR_CYAN, COLOR_BLACK);
    raw();
    noecho();
    getmaxyx(stdscr, ps.rowtot, ps.coltot);
    /* check terminal size */
    if ((ps.rowtot < ROWS + 6) || (ps.coltot < COLS + 2)) {
        clear();
        endwin();
        printf("This screen has %d rows and %d columns. Enlarge it.\n", ps.rowtot, ps.coltot);
        printf("You need at least %d rows and %d columns.\n", ROWS + 6, COLS + 2);
        return 1;
    }
    /* print grid centered */
    ps.field = subwin(stdscr, ROWS + 2, COLS + 2, (ps.rowtot - 6 - ROWS) / 2, (ps.coltot - COLS - 2) / 2);
    ps.score = subwin(stdscr, 2 + 2, ps.coltot, ps.rowtot - 4, 0);
    keypad(ps.field, TRUE);
    wtimeout(ps.field, 30);
    wattron(ps.field, COLOR_PAIR(4));
    wattron(ps.score, COLOR_PAIR(3));
    wborder(ps.field, '|', '|', '-', '-', '+', '+', '+', '+');
    wborder(ps.score, '|', '|', '-', '-', '+', '+', '+', '+');
    wattroff(ps.field, COLOR_PAIR);
    mvwprintw(ps.score, 2, 1, "F2 anytime to *rage* quit. Arrow keys to move.");
    mvwprintw(ps.score, 1, 1, "Points: %d", ps.points);
    wattron(ps.field, A_BOLD);
    wattron(ps.score, A_BOLD);
    colored_print(ps.field, -1, -1, "Snake", 4);
    mvwprintw(ps.score, 0, 0, "Score");
    wrefresh(ps.score);
    return 0;
}

static void screen_end(void)
{
    char exitmsg[] = "Leaving...bye! See you later :)";
    wclear(ps.field);
    wclear(ps.score);
    delwin(ps.field);
    delwin(ps.score);
    attron(COLOR_PAIR(rand()%4 + 1));
    attron(A_BOLD);
    if (ps.lose)
        mvprintw(ps.rowtot / 2, (ps.coltot - strlen("You scored %d points!")) / 2, "You scored %d points!", ps.points);
    else
        mvprintw(ps.rowtot / 2, (ps.coltot - strlen(exitmsg)) / 2, "%s", exitmsg);
    refresh();
    sleep(1);
    attroff(COLOR_PAIR);
    attroff(A_BOLD);
    endwin();
}

static snake *reclist(int i, snake *previous)
{
    snake *s = malloc(sizeof(snake));
    if ((s) && (i != STARTING_SIZE)) {
        switch (i) {
        case 0:
            snake_head.x = ROWS/2;
            snake_head.y = COLS/2;
            break;
        case STARTING_SIZE - 1:
            snake_tail.x = ROWS/2;
            snake_tail.y = COLS/2 - i;
            break;
        default:
            break;
        }
        s->direction = RIGHT;
        colored_print(ps.field, snake_head.x, snake_head.y - i, SNAKE_CHAR, 2);
        s->previous = previous;
        s->next = reclist(i + 1, s);
    } else {
        s = NULL;
    }
    return s;
}

static void freelist(snake *s)
{
    if (s->next)
        freelist(s->next);
    free(s);
}

static void fruit_gen(void)
{
    int dim = (ROWS * COLS) - size(ps.s);
    int fixed_grid[dim];
    int i, k;
    int j = 0;
    if (dim == 0) {
        ps.lose = 1;
        return;
    }
    for (i = 0; i < ROWS; i++) {
        for (k = 0; k < COLS; k++) {
            if ((mvwinch(ps.field, i + 1, k + 1) & A_CHARTEXT) != *SNAKE_CHAR) {
                fixed_grid[j] = (i * COLS) + k;
                j++;
            }
        }
    }
    j = rand() % dim;
    i = fixed_grid[j] / COLS;
    k = fixed_grid[j] - (i * COLS);
    colored_print(ps.field, i, k, FRUIT_CHAR, 1);
}

static void grid_init(void)
{
    snake *temp = NULL;
    ps.s = reclist(0, NULL);
    for (temp = ps.s; temp->next; temp = temp->next);
    /* Circular list: first elem has a ptr to last elem */
    ps.s->previous = temp;
    fruit_gen();
}

static void snake_move(void)
{
    int eat = 0;
    char c;
    snake_head.x = ((snake_head.x + ps.s->direction % 10) + ROWS) % ROWS;
    snake_head.y = ((snake_head.y + ps.s->direction / 10) + COLS) % COLS;
    c = (mvwinch(ps.field, snake_head.x + 1, snake_head.y + 1) & A_CHARTEXT);
    if (c == *SNAKE_CHAR) {
            ps.lose = 1;
            return;
    } else {
        if (c == *FRUIT_CHAR)
            eat = 1;
    }
    colored_print(ps.field, snake_head.x, snake_head.y, SNAKE_CHAR, 2);
    if (!eat) {
        mvwprintw(ps.field, snake_tail.x + 1,  snake_tail.y + 1, " ");
        snake_tail.x = ((snake_tail.x + ps.s->previous->direction % 10) + ROWS) % ROWS;
        snake_tail.y = ((snake_tail.y + ps.s->previous->direction / 10) + COLS) % COLS;
    } else {
        eat_fruit();
        mvwprintw(ps.score, 1, strlen("Points: ") + 1, "%d", ps.points);
        wrefresh(ps.score);
    }
}

static void change_directions(void)
{
    snake *temp = NULL;
    temp = ps.s->previous;
    while (temp != ps.s) {
        temp->direction = temp->previous->direction;
        temp = temp->previous;
    }
}

static int main_cycle(void)
{
    wmove(ps.field, snake_head.x + 1, snake_head.y + 1);
    wrefresh(ps.field);
    change_directions();
    switch (wgetch(ps.field)) {
        case KEY_LEFT:
            if (ps.s->direction != RIGHT)
                ps.s->direction = LEFT;
            break;
        case KEY_RIGHT:
            if (ps.s->direction != LEFT)
                ps.s->direction = RIGHT;
            break;
        case KEY_UP:
            if (ps.s->direction != DOWN)
                ps.s->direction = UP;
            break;
        case KEY_DOWN:
            if (ps.s->direction != UP)
                ps.s->direction = DOWN;
            break;
        case KEY_F(2): /* f2 to exit */
            return 0;
    }
    snake_move();
    return 1;
}

static void eat_fruit(void)
{
    ps.points = ps.points + 7;
    ps.s = snake_grow();
    fruit_gen();
}

static snake *snake_grow(void)
{
    snake *temp = NULL;
    temp = ps.s->previous;
    temp->next = malloc(sizeof(snake));
    if (temp->next) {
        temp->next->previous = temp;
        temp->next->direction = temp->direction;
        temp->next->next = NULL;
        ps.s->previous = temp->next;
    } else {
        temp->next = NULL;
    }
    return ps.s;
}

static int size(snake *s)
{
    snake *temp = NULL;
    int i = 0;
    for (temp = s; temp->next; temp = temp->next)
        i++;
    return i;
}

static void colored_print(WINDOW *win, int x, int y, char *c, int color)
{
    wattron(win, COLOR_PAIR(color));
    mvwprintw(win, x + 1, y + 1, c);
    wattroff(win, COLOR_PAIR);
}