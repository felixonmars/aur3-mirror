#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <ncurses.h>
#include <unistd.h>

#define ROWS 30
#define COLS 120
#define STARTING_SIZE 3
#define RIGHT 0
#define LEFT 1
#define UP 2
#define DOWN 3

typedef struct list {
	int x;
	int y;
	int direction;
	struct list *next;
	struct list *previous;
} snake;

struct state {
	int rowtot;
	int coltot;
	int points;
	int lose;
	char grid[ROWS][COLS];
	snake *s;
	WINDOW *field;
	WINDOW *score;
};

static int screen_init(struct state *program_state, int level);
static void screen_end(struct state *program_state);
static snake *reclist(snake *s, int i, snake *previous, struct state *program_state);
static void freelist(snake *s);
static void fruit_gen(struct state *program_state);
static void grid_init(struct state *program_state);
static void change_directions(int direction, struct state *program_state);
static void eat_fruit(int x, int y, struct state *program_state);
static void snake_move(struct state *program_state);
static snake *snake_grow(int x, int y, struct state *program_state);
static int main_cycle(struct state *program_state);

int main(void)
{
	int level;
	static struct state program_state;
	program_state.lose = 0;
	program_state.points = 0;
	srand(time(NULL));
	do {
		printf("Select level: 1 easy, 2 medium, 3 hard, 4 really fuc**ng impossible.\n");
		scanf("%d", &level);
	} while (level != 1 && level != 2 && level != 3 && level != 4);
	if (screen_init(&program_state, level))
		return 1;
	grid_init(&program_state);
	while (!program_state.lose) {
		if (!main_cycle(&program_state))
			break;
	}
	freelist(program_state.s);
	screen_end(&program_state);
	return 0;
}

static int screen_init(struct state *program_state, int level)
{
	int i, k;
	initscr();
	start_color();
	init_pair(1, COLOR_RED, COLOR_BLACK);
	init_pair(2, COLOR_GREEN, COLOR_BLACK);
	init_pair(3, COLOR_YELLOW, COLOR_BLACK);
	init_pair(4, COLOR_BLUE, COLOR_BLACK);
	init_pair(5, COLOR_MAGENTA, COLOR_BLACK);
	init_pair(6, COLOR_CYAN, COLOR_BLACK);
	raw();
	noecho();
	getmaxyx(stdscr, program_state->rowtot, program_state->coltot);
	/* check terminal size */
	if ((program_state->rowtot < ROWS + 6) || (program_state->coltot < COLS + 2)) {
		clear();
		endwin();
		printf("This screen has %d rows and %d columns. Enlarge it.\n", program_state->rowtot, program_state->coltot);
		printf("You need at least %d rows and %d columns.\n", ROWS + 6, COLS + 2);
		return 1;
	}
	/* print grid centered */
	i = (program_state->rowtot - 4 - ROWS - 2) / 2;
	k = (program_state->coltot - COLS - 2) / 2;
	program_state->field = subwin(stdscr, ROWS + 2, COLS + 2, i, k);
	program_state->score = subwin(stdscr, 2 + 2, program_state->coltot, program_state->rowtot - 4, 0);
	keypad(program_state->field, TRUE);
	switch (level) {
	case 1:
		wtimeout(program_state->field, 180);
		break;
	case 2:
		wtimeout(program_state->field, 120);
		break;
	case 3:
		wtimeout(program_state->field, 80);
		break;
	case 4:
		wtimeout(program_state->field, 30);
		break;
	}
	wborder(program_state->field, '|', '|', '-', '-', '+', '+', '+', '+');
	wborder(program_state->score, '|', '|', '-', '-', '+', '+', '+', '+');
	mvwprintw(program_state->score, 2, 1, "F2 anytime to *rage* quit. Arrow keys to move.");
	mvwprintw(program_state->score, 1, 1, "%d points.", program_state->points);
	mvwprintw(program_state->field, 0, 0, "Snake");
	mvwprintw(program_state->score, 0, 0, "Score");
	wrefresh(program_state->score);
	return 0;
}

static void screen_end(struct state *program_state)
{
	char exitmsg[] = "Leaving...bye! See you later :)";
	wtimeout(stdscr, -1);
	wclear(program_state->field);
	wclear(program_state->score);
	delwin(program_state->field);
	delwin(program_state->score);
	clear();
	attron(COLOR_PAIR(rand()%6 + 1));
	attron(A_BOLD);
	if (program_state->lose)
		mvprintw(program_state->rowtot / 2, (program_state->coltot - strlen("You scored %d points!")) / 2, "You scored %d points!", program_state->points);
	else
		mvprintw(program_state->rowtot / 2, (program_state->coltot - strlen(exitmsg)) / 2, "%s", exitmsg);
	refresh();
	sleep(1);
	attroff(COLOR_PAIR);
	attroff(A_BOLD);
	endwin();
}

static snake *reclist(snake *s, int i, snake *previous, struct state *program_state)
{
	s = malloc(sizeof(snake));
	if ((s) && (i != STARTING_SIZE)) {
		s->x = ROWS/2;
		s->y = COLS/2 - i;
		s->direction = RIGHT;
		program_state->grid[s->x][s->y] = 'O';
		wattron(program_state->field, COLOR_PAIR(2));
		mvwprintw(program_state->field, s->x + 1, s->y + 1, "%c", program_state->grid[s->x][s->y]);
		wattroff(program_state->field, COLOR_PAIR);
		s->previous = previous;
		s->next = reclist(s->next, i + 1, s, program_state);
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

static void fruit_gen(struct state *program_state)
{
	int i, k;
	do {
		i = rand()%ROWS;
		k = rand()%COLS;
	} while (program_state->grid[i][k] == 'O');
	program_state->grid[i][k] = '*';
	wattron(program_state->field, COLOR_PAIR(1));
	mvwprintw(program_state->field, i + 1, k + 1, "%c", program_state->grid[i][k]);
	wattroff(program_state->field, COLOR_PAIR);
}

static void grid_init(struct state *program_state)
{
	program_state->s = reclist(program_state->s, 0, NULL, program_state);
	fruit_gen(program_state);
}

static void snake_move(struct state *program_state)
{
	int i, k, eat = 0;
	snake *temp = NULL;
	for (temp = program_state->s; temp; temp = temp->next) {
		program_state->grid[temp->x][temp->y] = ' ';
		mvwprintw(program_state->field, temp->x + 1, temp->y + 1, "%c", program_state->grid[temp->x][temp->y]);
		if ((eat) && (!temp->next)) {
			i = temp->x;
			k = temp->y;
		}
		switch (temp->direction) {
			case RIGHT:
				temp->y++;
				if (temp->y == COLS)
					temp->y = 0;
				break;
			case LEFT:
				temp->y--;
				if (temp->y == -1)
					temp->y = COLS - 1;
				break;
			case UP:
				temp->x--;
				if (temp->x == -1)
					temp->x = ROWS - 1;
				break;
			case DOWN:
				temp->x++;
				if (temp->x == ROWS)
					temp->x = 0;
				break;
		}
		if ((temp == program_state->s) && (program_state->grid[temp->x][temp->y] == '*'))
			eat = 1;
		if (program_state->grid[temp->x][temp->y] == 'O') {
			program_state->lose = 1;
			return;
		}
		program_state->grid[temp->x][temp->y] = 'O';
		wattron(program_state->field, COLOR_PAIR(2));
		mvwprintw(program_state->field, temp->x + 1, temp->y + 1, "%c", program_state->grid[temp->x][temp->y]);
		wattroff(program_state->field, COLOR_PAIR);
	}
	if (eat) {
		eat_fruit(i, k, program_state);
		mvwprintw(program_state->score, 1, 1, "%d points.", program_state->points);
		wrefresh(program_state->score);
	}
}

static void change_directions(int direction, struct state *program_state)
{
	snake *temp = NULL;
	temp = program_state->s;
	while (temp->next) {
		temp = temp->next;
	}
	while (temp->previous != NULL) {
		temp->direction = temp->previous->direction;
		temp = temp->previous;
	}
	program_state->s->direction = direction;
	snake_move(program_state);
}

static int main_cycle(struct state *program_state)
{
	wmove(program_state->field, program_state->s->x + 1, program_state->s->y + 1);
	wrefresh(program_state->field);
	switch (wgetch(program_state->field)) {
	case KEY_LEFT:
		if ((program_state->s->direction != RIGHT) && (program_state->s->direction != LEFT))
			change_directions(LEFT, program_state);
		break;
	case KEY_RIGHT:
		if ((program_state->s->direction != LEFT) && (program_state->s->direction != RIGHT))
			change_directions(RIGHT, program_state);
		break;
	case KEY_UP:
		if ((program_state->s->direction != DOWN && program_state->s->direction != UP))
			change_directions(UP, program_state);
		break;
	case KEY_DOWN:
		if ((program_state->s->direction != UP) && (program_state->s->direction != DOWN))
			change_directions(DOWN, program_state);
		break;
	case KEY_F(2): /* f2 to exit */
		return 0;
	default:
		change_directions(program_state->s->direction, program_state);
		break;
	}
	return 1;
}

static void eat_fruit(int x, int y, struct state *program_state)
{
	program_state->points = program_state->points + 7;
	program_state->s = snake_grow(x, y, program_state);
	if (program_state->points != (7 * COLS * ROWS) - (STARTING_SIZE * 7))
		fruit_gen(program_state);
}

static snake *snake_grow(int x, int y, struct state *program_state)
{
	snake *temp = NULL;
	for (temp = program_state->s; temp->next; temp = temp->next);
	temp->next = malloc(sizeof(snake));
	if (temp->next) {
		temp->next->x = x;
		temp->next->y = y;
		temp->next->previous = temp;
		temp->next->direction = temp->direction;
		program_state->grid[temp->next->x][temp->next->y] = 'O';
		wattron(program_state->field, COLOR_PAIR(2));
		mvwprintw(program_state->field, temp->next->x + 1, temp->next->y + 1, "%c", program_state->grid[temp->next->x][temp->next->y]);
		wattroff(program_state->field, COLOR_PAIR);
		temp->next->next = NULL;
	} else {
		temp->next = NULL;
	}
	return program_state->s;
}
