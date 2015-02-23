#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <ncurses.h>
#include <unistd.h>
#include <pwd.h>

#define ROWS 30
#define COLS 120
#define STARTING_SIZE 3
#define MAX_SCORE_LENGTH 9
#define FRUIT_POINTS 7
#define HEAD 0
#define DEFAULT_SPEED 28000
#define HARD_SPEED 22000
#define EASY_SPEED 30000

/* eigenvectors associated to snake movements */
#define RIGHT 10
#define LEFT -10
#define UP -1
#define DOWN 1

/* chars to be printed */
#define SNAKE_CHAR "O"
#define FRUIT_CHAR "*"

/* Coordinates of snake's head and tail */
struct point {
    int x;
    int y;
};

/* Program state struct */
#pragma pack(push, 1)
struct state {
    int size;
    int delay;
    struct point snake_head;
    struct point snake_tail;
    struct point fruit_coord;
};
#pragma pack(pop)

static int starting_questions(int argc, char *argv[]);
static int check_term_size(int rowtot, int coltot);
static void screen_init(int rowtot, int coltot);
static void screen_end(int rowtot, int coltot, int lose, int store);
static void print_initial_snake(int x, int y, int i);
static void fruit_gen(void);
static void grid_init(void);
static void change_directions(void);
static void eat_fruit(void);
static void snake_move(int *lose);
static void snake_grow(void);
static void main_cycle(int *lose, int *store);
static void colored_print(WINDOW *win, int x, int y, char *c, int color);
static void init_func(char *argv);
static void store_and_exit(void);
static void store_score(void);
static void print_score_list(void);

/* Give default "new match" values to program state struct */
static struct state ps = {
    .delay = DEFAULT_SPEED,
    .size = STARTING_SIZE,
    .snake_head = {ROWS/2, COLS/2},
    .snake_tail = {ROWS/2, COLS/2 - (STARTING_SIZE - 1)},
    .fruit_coord = {-1, -1}
};
static WINDOW *field = NULL, *score = NULL;
static int *snake = NULL;

int main(int argc, char *argv[])
{
    int rowtot, coltot, lose = 0, store = 0;
    if (starting_questions(argc, argv) == 1)
        return 0;
    srand(time(NULL));
    initscr();
    getmaxyx(stdscr, rowtot, coltot);
    if (check_term_size(rowtot, coltot) == 1)
        return 1;
    screen_init(rowtot, coltot);
    grid_init();
    while ((!lose) && (!store))
        main_cycle(&lose, &store);
    screen_end(rowtot, coltot, lose, store);
    free(snake);
    return 0;
}

static int starting_questions(int argc, char *argv[])
{
    if ((argc == 1) || (((strcmp(argv[1],"-n")) != 0) && ((strcmp(argv[1],"-r")) != 0) && ((strcmp(argv[1],"-s")) != 0))) {
        printf("Helper message.\nStart this program with:\n\t'-n $level'\tif you want to play a new game, where '$level' is one between easy and hard.\n\t\t\tLeaving only '-n' will play default level;\n\t'-r'\t\tto resume your last saved game;\n\t'-s'\t\tto view your top scores.\n");
        return 1;
    }
    if (((strcmp(argv[1],"-s")) == 0)) {
        print_score_list();
        return 1;
    }
    init_func(argv[1]);
    if (argc == 3) {
        if ((((strcmp(argv[argc - 1],"easy")) != 0)) && (((strcmp(argv[argc - 1],"hard")) != 0))) {
            printf ("Level not recognized. Playing at default level.\n");
            sleep(1);
        } else {
            if (((strcmp(argv[2],"easy")) == 0))
                ps.delay = EASY_SPEED;
            else
                ps.delay = HARD_SPEED;
        }
    }
    return 0;
}

static int check_term_size(int rowtot, int coltot)
{
    if ((rowtot < ROWS + 6) || (coltot < COLS + 2)) {
        clear();
        endwin();
        delwin(stdscr);
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
    nodelay(field, TRUE);
    wattron(field, COLOR_PAIR(4));
    wattron(score, COLOR_PAIR(3));
    wborder(field, '|', '|', '-', '-', '+', '+', '+', '+');
    wborder(score, '|', '|', '-', '-', '+', '+', '+', '+');
    wattroff(field, COLOR_PAIR);
    mvwprintw(score, 2, 1, "q anytime to *rage* quit. Arrow keys to move. s to save current game and leave.");
    mvwprintw(score, 1, 1, "Points: ");
    if (ps.size != STARTING_SIZE)
        wattron(score, A_BOLD);
    mvwprintw(score, 1, strlen("Points: ") + 1, "%d", (ps.size - STARTING_SIZE) * FRUIT_POINTS);
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
    attron(COLOR_PAIR(rand() % 4 + 1));
    attron(A_BOLD);
    if (lose) {
        if (ps.size != STARTING_SIZE)
            store_score();
        mvprintw(rowtot / 2, (coltot - strlen("You scored %d points!")) / 2, "You scored %d points!", (ps.size - STARTING_SIZE) * FRUIT_POINTS);
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
    delwin(stdscr);
}

static void print_initial_snake(int x, int y, int i)
{
    if (i != ps.size) {
        colored_print(field, x, y, SNAKE_CHAR, 2);
        i++;
        x = ((x - (snake[i] % 10)) + ROWS) % ROWS;
        y = ((y - (snake[i] / 10)) + COLS) % COLS;
        return print_initial_snake(x, y, i);
    }
}

static void fruit_gen(void)
{
    int j, tot = ROWS * COLS;
    if ((tot) == ps.size)
        return;
    j = rand() % (tot);
    do {
        ps.fruit_coord.x = j / COLS;
        ps.fruit_coord.y = j - (ps.fruit_coord.x * COLS);
        j = (j + 1 + (tot)) % (tot);
    } while ((mvwinch(field,  ps.fruit_coord.x + 1,  ps.fruit_coord.y + 1) & A_CHARTEXT) == *SNAKE_CHAR);
    colored_print(field, ps.fruit_coord.x, ps.fruit_coord.y, FRUIT_CHAR, 1);
}

static void grid_init()
{
    print_initial_snake(ps.snake_head.x, ps.snake_head.y, 0);
    if (ps.fruit_coord.x == -1)
        fruit_gen();
    else
        colored_print(field, ps.fruit_coord.x, ps.fruit_coord.y, FRUIT_CHAR, 1);
}

static void snake_move(int *lose)
{
    ps.snake_head.x = ((ps.snake_head.x + snake[HEAD] % 10) + ROWS) % ROWS;
    ps.snake_head.y = ((ps.snake_head.y + snake[HEAD] / 10) + COLS) % COLS;
    if ((mvwinch(field, ps.snake_head.x + 1, ps.snake_head.y + 1) & A_CHARTEXT) == *FRUIT_CHAR) {
        eat_fruit();
        mvwprintw(score, 1, strlen("Points: ") + 1, "%d", (ps.size - STARTING_SIZE) * FRUIT_POINTS);
        wrefresh(score);
    } else {
        mvwprintw(field, ps.snake_tail.x + 1,  ps.snake_tail.y + 1, " ");
        ps.snake_tail.x = ((ps.snake_tail.x + snake[ps.size - 1] % 10) + ROWS) % ROWS;
        ps.snake_tail.y = ((ps.snake_tail.y + snake[ps.size - 1] / 10) + COLS) % COLS;
        if ((mvwinch(field, ps.snake_head.x + 1, ps.snake_head.y + 1) & A_CHARTEXT) == *SNAKE_CHAR) {
            *lose = 1;
            return;
        }
    }
    colored_print(field, ps.snake_head.x, ps.snake_head.y, SNAKE_CHAR, 2);
}

static void change_directions(void)
{
    int i;
    for (i = ps.size - 1; i > 0; i--)
        snake[i] = snake[i - 1];
}

static void main_cycle(int *lose, int *store)
{
    snake_move(lose);
    change_directions();
    wmove(field, ps.snake_head.x + 1, ps.snake_head.y + 1);
    switch (wgetch(field)) {
        case KEY_LEFT:
            if (snake[HEAD] != RIGHT)
                snake[HEAD] = LEFT;
            break;
        case KEY_RIGHT:
            if (snake[HEAD] != LEFT)
                snake[HEAD] = RIGHT;
            break;
        case KEY_UP:
            if (snake[HEAD] != DOWN)
                snake[HEAD] = UP;
            break;
        case KEY_DOWN:
            if (snake[HEAD] != UP)
                snake[HEAD] = DOWN;
            break;
        case 's': /* "s" to store current game and exit */
            *store = 1;
            break;
        case 'q': /* q to exit */
            *lose = 1;
            break;
    }
    usleep(ps.delay);
}

static void eat_fruit(void)
{
    ps.size++;
    snake_grow();
    fruit_gen();
}

static void snake_grow(void)
{
    snake = realloc(snake, ps.size * sizeof(int));
    snake[ps.size - 1] = snake[ps.size - 2];
}

static void colored_print(WINDOW *win, int x, int y, char *c, int color)
{
    wattron(win, COLOR_PAIR(color));
    mvwprintw(win, x + 1, y + 1, c);
    wattroff(win, COLOR_PAIR);
}

static void init_func(char *argv)
{
    char *path_resume_file = strcat(getpwuid(getuid())->pw_dir, "/.local/share/snake.txt");
    FILE *f = NULL;
    int i, resume = strcmp(argv, "-r");
    if ((resume == 0) && (f = fopen(path_resume_file, "r"))) {
        fread(&ps, sizeof(int), sizeof(struct state) / sizeof(int), f);
        snake = malloc(sizeof(int) * ps.size);
        fread(snake, sizeof(int), ps.size, f);
        fclose(f);
        remove(path_resume_file);
    } else {
        if (resume == 0) {
            printf("No previous games found. Starting a new match.\n");
            sleep(1);
        }
        snake = malloc(sizeof(int) * STARTING_SIZE);
        for (i = 0; i < STARTING_SIZE; i++)
            snake[i] = RIGHT;
    }
}

static void store_and_exit()
{
    char *path_resume_file = strcat(getpwuid(getuid())->pw_dir, "/.local/share/snake.txt");
    FILE *f = fopen(path_resume_file, "w");
    fwrite(&ps, sizeof(int), sizeof(struct state) / sizeof(int), f);
    fwrite(snake, sizeof(int), ps.size, f);
    fclose(f);
}

static void store_score(void)
{
    char *path_score_file = strcat(getpwuid(getuid())->pw_dir, "/.local/share/snake_score.txt");
    FILE *f = NULL;
    int i, dim = 1, points = (ps.size - STARTING_SIZE) * FRUIT_POINTS;
    int *score_list = malloc(sizeof(int));
    score_list[0] = points;
    if ((f = fopen(path_score_file, "r"))) {
        for (i = 1; (i < MAX_SCORE_LENGTH) && (!feof(f)); i++) {
            score_list = realloc(score_list, (i + 1) * sizeof(int));
            fscanf(f, "%d\n", &score_list[i]);
        }
        fclose(f);
        dim = i;
        if ((score_list[dim - 1] >= points) && (dim == MAX_SCORE_LENGTH)) {
            free(score_list);
            return;
        }
        for (i = 0; (score_list[i] < score_list[i + 1]) && (i < dim - 1); i++) {
            score_list[i] = score_list[i + 1];
            score_list[i + 1] = points;
        }
    }
    f = fopen(path_score_file, "w");
    for (i = 0; (i < dim) && (i < MAX_SCORE_LENGTH); i++)
        fprintf(f, "%d\n", score_list[i]);
    fclose(f);
    free(score_list);
}

static void print_score_list(void)
{
    char *path_score_file = strcat(getpwuid(getuid())->pw_dir, "/.local/share/snake_score.txt");
    FILE *f = NULL;
    int *score_list = NULL, i, dim;
    if ((f = fopen(path_score_file, "r"))) {
        for (i = 0; (!feof(f) && (i < MAX_SCORE_LENGTH)); i++) {
            score_list = realloc(score_list, (i + 1) * sizeof(int));
            fscanf(f, "%d\n", &score_list[i]);
        }
        dim = i;
        fclose(f);
        printf("\tTop scores:\n");
        for (i = 0; i < dim; i++)
            printf("\t\t%d) %d\n", i + 1, score_list[i]);
        free(score_list);
    } else {
        printf("No score list found.\n");
    }
}