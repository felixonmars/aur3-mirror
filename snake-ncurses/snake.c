#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <ncurses.h>
#include <unistd.h>
#include <sys/types.h>
#include <pwd.h>

#define ROWS 30
#define COLS 120
#define STARTING_SIZE 3
#define MAX_SCORE_LENGTH 10

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

/* Coordinates of snake's head and tail */
struct point {
    int x;
    int y;
};

/* Program state struct */
#pragma pack(push, 1)
struct state {
    int points;
    int size;
    struct point snake_head;
    struct point snake_tail;
    struct point fruit_coord;
};
#pragma pack(pop)

static int starting_questions(int argc, char *argv[], int **initial_directions, int *resume);
static int check_term_size(int rowtot, int coltot);
static void screen_init(int rowtot, int coltot);
static void screen_end(int rowtot, int coltot, int lose, int store);
static snake *reclist(int i, snake *previous, int directions[], int x, int y);
static void freelist(snake *s);
static void fruit_gen(void);
static void grid_init(int initial_directions[], int resume);
static void change_directions(void);
static void eat_fruit(void);
static void snake_move(int *lose);
static snake *snake_grow(void);
static void main_cycle(int *lose, int *store);
static void colored_print(WINDOW *win, int x, int y, char *c, int color);
static int *resume_func(int *initial_directions, int *resume);
static int *init_func(int *initial_directions);
static void store_and_exit(void);
static void store_score(void);
static void print_score_list(void);

static struct state ps;
static WINDOW *field, *score;
static snake *s;

int main(int argc, char *argv[])
{
    int rowtot, coltot, lose = 0, resume = 0, store = 0;
    int *initial_directions = NULL;
    if (starting_questions(argc, argv, &initial_directions, &resume) == 1)
        return 0;
    srand(time(NULL));
    initscr();
    getmaxyx(stdscr, rowtot, coltot);
    if (check_term_size(rowtot, coltot) == 1)
        return 1;
    screen_init(rowtot, coltot);
    grid_init(initial_directions, resume);
    free(initial_directions);
    while ((!lose) && (!store))
        main_cycle(&lose, &store);
    screen_end(rowtot, coltot, lose, store);
    freelist(s);
    return 0;
}

static int starting_questions(int argc, char *argv[], int **initial_directions, int *resume)
{
    if ((argc == 1) ||
        (((strcmp(argv[1],"--new")) != 0) && ((strcmp(argv[1],"-n")) != 0) && ((strcmp(argv[1],"--resume")) != 0)
        && ((strcmp(argv[1],"-r")) != 0) && ((strcmp(argv[1],"--scores")) != 0) && ((strcmp(argv[1],"-s")) != 0))) {
        printf("Helper message.\nStart this program with:\n\t'--new' or '-n' if you want to play a new game;\n\t'--resume' or '-r' to resume your last saved game;\n\t'--scores' or '-s' to view your top scores.\n");
        return 1;
    }
    if (((strcmp(argv[1],"--new")) == 0) || ((strcmp(argv[1],"-n")) == 0))
        *initial_directions = init_func(*initial_directions);
    else {
        if (((strcmp(argv[1],"--resume")) == 0) || ((strcmp(argv[1],"-r")) == 0)) {
            *resume = 1;
            *initial_directions = resume_func(*initial_directions, resume);
        } else {
            print_score_list();
            return 1;
        }
    }
    return 0;
}

static int check_term_size(int rowtot, int coltot)
{
    if ((rowtot < ROWS + 6) || (coltot < COLS + 2)) {
        clear();
        endwin();
        printf("This screen has %d rows and %d columns. Enlarge it.\n", rowtot, coltot);
        printf("You need at least %d rows and %d columns.\n", ROWS + 6, COLS + 2);
        return 1;
    }
    return 0;
}

static void screen_init(int rowtot, int coltot)
{
    start_color();
    init_pair(1, COLOR_RED, COLOR_BLACK);
    init_pair(2, COLOR_GREEN, COLOR_BLACK);
    init_pair(3, COLOR_YELLOW, COLOR_BLACK);
    init_pair(4, COLOR_CYAN, COLOR_BLACK);
    raw();
    noecho();
    /* print sub windows centered */
    field = subwin(stdscr, ROWS + 2, COLS + 2, (rowtot - 6 - ROWS) / 2, (coltot - COLS - 2) / 2);
    score = subwin(stdscr, 2 + 2, coltot, rowtot - 4, 0);
    keypad(field, TRUE);
    wtimeout(field, 30);
    wattron(field, COLOR_PAIR(4));
    wattron(score, COLOR_PAIR(3));
    wborder(field, '|', '|', '-', '-', '+', '+', '+', '+');
    wborder(score, '|', '|', '-', '-', '+', '+', '+', '+');
    wattroff(field, COLOR_PAIR);
    mvwprintw(score, 2, 1, "q anytime to *rage* quit. Arrow keys to move. s to save current game and leave.");
    mvwprintw(score, 1, 1, "Points: ");
    if (ps.points > 0)
        wattron(score, A_BOLD);
    mvwprintw(score, 1, strlen("Points: ") + 1, "%d", ps.points);
    wattron(field, A_BOLD);
    wattron(score, A_BOLD);
    colored_print(field, -1, -1, "Snake", 4);
    mvwprintw(score, 0, 0, "Score");
    wrefresh(score);
}

static void screen_end(int rowtot, int coltot, int lose, int store)
{
    char exitmsg[] = "Leaving...bye! See you later :)";
    wclear(field);
    wclear(score);
    delwin(field);
    delwin(score);
    attron(COLOR_PAIR(rand()%4 + 1));
    attron(A_BOLD);
    if (lose) {
        store_score();
        mvprintw(rowtot / 2, (coltot - strlen("You scored %d points!")) / 2, "You scored %d points!", ps.points);
    } else {
        if (store)
            store_and_exit();
        mvprintw(rowtot / 2, (coltot - strlen(exitmsg)) / 2, "%s", exitmsg);
    }
    refresh();
    sleep(1);
    attroff(COLOR_PAIR);
    attroff(A_BOLD);
    endwin();
}

static snake *reclist(int i, snake *previous, int directions[], int x, int y)
{
    snake *s = malloc(sizeof(snake));
    if ((s) && (i != ps.size)) {
        s->direction = directions[i];
        s->previous = previous;
        if (i != 0) {
            x = ((x - (s->direction % 10)) + ROWS) % ROWS;
            y = ((y - (s->direction / 10)) + COLS) % COLS;
        }
        colored_print(field, x, y, SNAKE_CHAR, 2);
        s->next = reclist(i + 1, s, directions, x, y);
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
    int dim = (ROWS * COLS) - ps.size;
    int fixed_grid[dim];
    int i, k;
    int j = 0;
    if (dim == 0)
        return;
    for (i = 0; i < ROWS; i++) {
        for (k = 0; k < COLS; k++) {
            if ((mvwinch(field, i + 1, k + 1) & A_CHARTEXT) != *SNAKE_CHAR) {
                fixed_grid[j] = (i * COLS) + k;
                j++;
            }
        }
    }
    j = rand() % dim;
    ps.fruit_coord.x = fixed_grid[j] / COLS;
    ps.fruit_coord.y = fixed_grid[j] - (ps.fruit_coord.x * COLS);
    colored_print(field, ps.fruit_coord.x, ps.fruit_coord.y, FRUIT_CHAR, 1);
}

static void grid_init(int initial_directions[], int resume)
{
    snake *temp = NULL;
    s = reclist(0, NULL, initial_directions, ps.snake_head.x, ps.snake_head.y);
    for (temp = s; temp->next; temp = temp->next);
    /* Circular list: first elem has a ptr to last elem */
    s->previous = temp;
    if (!resume)
        fruit_gen();
    else
        colored_print(field, ps.fruit_coord.x, ps.fruit_coord.y, FRUIT_CHAR, 1);
}

static void snake_move(int *lose)
{
    ps.snake_head.x = ((ps.snake_head.x + s->direction % 10) + ROWS) % ROWS;
    ps.snake_head.y = ((ps.snake_head.y + s->direction / 10) + COLS) % COLS;
    if ((mvwinch(field, ps.snake_head.x + 1, ps.snake_head.y + 1) & A_CHARTEXT) == *FRUIT_CHAR) {
        eat_fruit();
        mvwprintw(score, 1, strlen("Points: ") + 1, "%d", ps.points);
        wrefresh(score);
    } else {
        mvwprintw(field, ps.snake_tail.x + 1,  ps.snake_tail.y + 1, " ");
        ps.snake_tail.x = ((ps.snake_tail.x + s->previous->direction % 10) + ROWS) % ROWS;
        ps.snake_tail.y = ((ps.snake_tail.y + s->previous->direction / 10) + COLS) % COLS;
        if ((mvwinch(field, ps.snake_head.x + 1, ps.snake_head.y + 1) & A_CHARTEXT) == *SNAKE_CHAR) {
            *lose = 1;
            return;
        }
    }
    colored_print(field, ps.snake_head.x, ps.snake_head.y, SNAKE_CHAR, 2);
}

static void change_directions(void)
{
    snake *temp = NULL;
    temp = s->previous;
    while (temp != s) {
        temp->direction = temp->previous->direction;
        temp = temp->previous;
    }
}

static void main_cycle(int *lose, int *store)
{
    snake_move(lose);
    change_directions();
    wmove(field, ps.snake_head.x + 1, ps.snake_head.y + 1);
    switch (wgetch(field)) {
        case KEY_LEFT:
            if (s->direction != RIGHT)
                s->direction = LEFT;
            break;
        case KEY_RIGHT:
            if (s->direction != LEFT)
                s->direction = RIGHT;
            break;
        case KEY_UP:
            if (s->direction != DOWN)
                s->direction = UP;
            break;
        case KEY_DOWN:
            if (s->direction != UP)
                s->direction = DOWN;
            break;
        case 's': /* "s" to store current game and exit */
            *store = 1;
            break;
        case 'q': /* q to exit */
            *lose = 1;
            break;
    }
}

static void eat_fruit(void)
{
    ps.points = ps.points + 7;
    s = snake_grow();
    ps.size++;
    fruit_gen();
}

static snake *snake_grow(void)
{
    snake *temp = s->previous;
    temp->next = malloc(sizeof(snake));
    if (temp->next) {
        temp->next->previous = temp;
        temp->next->direction = temp->direction;
        temp->next->next = NULL;
        s->previous = temp->next;
    } else {
        temp->next = NULL;
    }
    return s;
}

static void colored_print(WINDOW *win, int x, int y, char *c, int color)
{
    wattron(win, COLOR_PAIR(color));
    mvwprintw(win, x + 1, y + 1, c);
    wattroff(win, COLOR_PAIR);
}

static int *resume_func(int *initial_directions, int *resume)
{
    char *path_resume_file = strcat(getpwuid(getuid())->pw_dir, "/.local/share/snake.txt");
    FILE *f = NULL;
    int i = 0;
    if ((f = fopen(path_resume_file, "r"))) {
        fread(&ps, sizeof(int), sizeof(struct state) / sizeof(int), f);
        initial_directions = malloc(sizeof(int) * ps.size);
        while (i != ps.size) {
            fscanf(f, "%i\n", &initial_directions[i]);
            i++;
        }
        fclose(f);
        remove(path_resume_file);
        return initial_directions;
    }
    printf("No previous games found. Starting a new match.\n");
    *resume = 0;
    sleep(1);
    return init_func(initial_directions);
}

static int *init_func(int *initial_directions)
{
    int i = 0;
    ps.points = 0;
    ps.size = STARTING_SIZE;
    ps.snake_head.x = ROWS/2;
    ps.snake_head.y = COLS/2;
    ps.snake_tail.x = ROWS/2;
    ps.snake_tail.y = COLS/2 - (STARTING_SIZE - 1);
    initial_directions = malloc(sizeof(int) * ps.size);
    while (i != ps.size) {
        initial_directions[i] = RIGHT;
        i++;
    }
    return initial_directions;
}

static void store_and_exit(void)
{
    char *path_resume_file = strcat(getpwuid(getuid())->pw_dir, "/.local/share/snake.txt");
    FILE *f = NULL;
    snake *temp = NULL;
    f = fopen(path_resume_file, "w");
    fwrite(&ps, sizeof(int), sizeof(struct state) / sizeof(int), f);
    for (temp = s; temp; temp = temp->next)
        fprintf(f, "%i\n", temp->direction);
    fclose(f);
}

static void store_score(void)
{
    char *path_score_file = strcat(getpwuid(getuid())->pw_dir, "/.local/share/snake_score.txt");
    FILE *f = NULL;
    int *score_list = NULL;
    int i = 0, dim = 0;
    if ((f = fopen(path_score_file, "r"))) {
        do {
            score_list = realloc(score_list, (i + 1) * sizeof(int));
            fscanf(f, "%i\n", &score_list[i]);
            i++;
        } while ((i != MAX_SCORE_LENGTH) && (!feof(f)));
        fclose(f);
        dim = i;
        if (dim == MAX_SCORE_LENGTH) {
            if (score_list[dim - 1] > ps.points)
                return;
            score_list[dim - 1] = ps.points;
        } else {
            score_list = realloc(score_list, (i + 1) * sizeof(int));
            score_list[i] = ps.points;
            dim++;
        }
        while ((score_list[i] > score_list[i - 1]) && (i > 0)) {
            score_list[i] = score_list[i - 1];
            score_list[i - 1] = ps.points;
            i--;
        }
    }
    f = fopen(path_score_file, "w");
    if (dim != 0) {
        for(i = 0; i < dim; i++)
            fprintf(f, "%i\n", score_list[i]);
    } else
        fprintf(f, "%i\n", ps.points);
    fclose(f);
}

static void print_score_list(void)
{
    char *path_score_file = strcat(getpwuid(getuid())->pw_dir, "/.local/share/snake_score.txt");
    FILE *f = NULL;
    int *score_list = NULL, i = 0, dim;
    if ((f = fopen(path_score_file, "r"))) {
        do {
            score_list = realloc(score_list, (i + 1) * sizeof(int));
            fscanf(f, "%i\n", &score_list[i]);
            i++;
        } while (!feof(f) && (i < MAX_SCORE_LENGTH));
        dim = i;
        fclose(f);
        printf("\tTop scores:\n");
        for(i = 0; i < dim; i++)
            printf("\t\t%d\n", score_list[i]);
    } else {
        printf("No score list found.\n");
    }
    free(score_list);
}