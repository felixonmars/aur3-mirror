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

static int screen_init(int level);
static void screen_end(void);
static snake *reclist(snake *s, int i, snake *previous);
static void grid_init(void);
static void change_directions(int direction);
static void eat_fruit(int x, int y);
static void snake_move(void);
static snake *snake_grow(int x, int y);
static int main_cycle(void);

/* Global variables */
int rowtot, coltot, points, lose;
char grid[ROWS][COLS];
snake *s;
WINDOW *field, *score;

int main(void)
{
	int level;
	lose = 0;
	points = 0;
	srand(time(NULL));
	do {
		printf("Select level: 1 easy, 2 medium, 3 hard, 4 really fuc**ng impossible.\n");
		scanf("%d", &level);
	} while (level != 1 && level != 2 && level != 3 && level != 4);
	if (screen_init(level))
		return 1;
	grid_init();
	while (!lose) {
		if (!main_cycle())
			break;
	}
	screen_end();
	return 0;
}

static int screen_init(int level)
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
	getmaxyx(stdscr, rowtot, coltot);
	/* check terminal size */
	if ((rowtot < ROWS + 6) || (coltot < COLS + 2)) {
		clear();
		endwin();
		printf("This screen has %d rows and %d columns. Enlarge it.\n", rowtot, coltot);
		printf("You need at least %d rows and %d columns.\n", ROWS + 6, COLS + 2);
		return 1;
	}
	/* print grid centered */
	i = (rowtot - 4 - ROWS - 2) / 2;
	k = (coltot - COLS - 2) / 2;
	field = subwin(stdscr, ROWS + 2, COLS + 2, i, k);
	score = subwin(stdscr, 2 + 2, coltot, rowtot - 4, 0);
	keypad(field, TRUE);
	switch (level) {
	case 1:
		wtimeout(field, 180);
		break;
	case 2:
		wtimeout(field, 120);
		break;
	case 3:
		wtimeout(field, 80);
		break;
	case 4:
		wtimeout(field, 30);
		break;
	}
	wborder(field, '|', '|', '-', '-', '+', '+', '+', '+');
	wborder(score, '|', '|', '-', '-', '+', '+', '+', '+');
	mvwprintw(score, 2, 1, "F2 anytime to *rage* quit. Arrow keys to move.");
	mvwprintw(score, 1, 1, "%d points.", points);
	mvwprintw(field, 0, 0, "Snake");
	mvwprintw(score, 0, 0, "Score");
	wrefresh(score);
	return 0;
}

static void screen_end(void)
{
	char exitmsg[] = "Leaving...bye! See you later :)";
	wtimeout(stdscr, -1);
	wclear(field);
	wclear(score);
	delwin(field);
	delwin(score);
	clear();
	attron(COLOR_PAIR(rand()%6 + 1));
	attron(A_BOLD);
	if (lose)
		mvprintw(rowtot / 2, (coltot - strlen("You scored %d points!")) / 2, "You scored %d points!", points);
	else
		mvprintw(rowtot / 2, (coltot - strlen(exitmsg)) / 2, "%s", exitmsg);
	refresh();
	sleep(1);
	attroff(COLOR_PAIR);
	attroff(A_BOLD);
	endwin();
}

static snake *reclist(snake *s, int i, snake *previous)
{
	s = malloc(sizeof(snake));
	if ((s) && (i != STARTING_SIZE)) {
		s->x = ROWS/2;
		s->y = COLS/2 - i;
		s->direction = RIGHT;
		grid[s->x][s->y] = 'O';
		wattron(field, COLOR_PAIR(2));
		mvwprintw(field, s->x + 1, s->y + 1, "%c", grid[s->x][s->y]);
		wattroff(field, COLOR_PAIR);
		s->previous = previous;
		s->next = reclist(s->next, i + 1, s);
	} else {
		s = NULL;
	}
	return s;
}

static void fruit_gen(void)
{
	int i = 1, k = 1;
	do {
		i = rand()%ROWS;
		k = rand()%COLS;
	} while (grid[i][k] == 'O');
	grid[i][k] = '*';
	wattron(field, COLOR_PAIR(1));
	mvwprintw(field, i + 1, k + 1, "%c", grid[i][k]);
	wattroff(field, COLOR_PAIR);
}

static void grid_init(void)
{
	s = reclist(s, 0, NULL);
	fruit_gen();
}

static void snake_move(void)
{
	int i, k, eat = 0;
	snake *temp = NULL;
	for (temp = s; temp; temp = temp->next) {
		grid[temp->x][temp->y] = ' ';
		mvwprintw(field, temp->x + 1, temp->y + 1, "%c", grid[temp->x][temp->y]);
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
		if ((temp == s) && (grid[temp->x][temp->y] == '*'))
			eat = 1;
		if (grid[temp->x][temp->y] == 'O') {
			lose = 1;
			return;
		}
		grid[temp->x][temp->y] = 'O';
		wattron(field, COLOR_PAIR(2));
		mvwprintw(field, temp->x + 1, temp->y + 1, "%c", grid[temp->x][temp->y]);
		wattroff(field, COLOR_PAIR);
	}
	if (eat) {
		eat_fruit(i, k);
		mvwprintw(score, 1, 1, "%d points.", points);
		wrefresh(score);
	}
}

static void change_directions(int direction)
{
	snake *temp = NULL;
	temp = s;
	while (temp->next) {
		temp = temp->next;
	}
	while (temp->previous != NULL) {
		temp->direction = temp->previous->direction;
		temp = temp->previous;
	}
	s->direction = direction;
	snake_move();
}

static int main_cycle(void)
{
	wmove(field, s->x + 1, s->y + 1);
	wrefresh(field);
	switch (wgetch(field)) {
	case KEY_LEFT:
		if ((s->direction != RIGHT) && (s->direction != LEFT))
			change_directions(LEFT);
		break;
	case KEY_RIGHT:
		if ((s->direction != LEFT) && (s->direction != RIGHT))
			change_directions(RIGHT);
		break;
	case KEY_UP:
		if ((s->direction != DOWN && s->direction != UP))
			change_directions(UP);
		break;
	case KEY_DOWN:
		if ((s->direction != UP) && (s->direction != DOWN))
			change_directions(DOWN);
		break;
	case KEY_F(2): /* f2 to exit */
		return 0;
	default:
		change_directions(s->direction);
		break;
	}
	return 1;
}

static void eat_fruit(int x, int y)
{
	points = points + 7;
	fruit_gen();
	s = snake_grow(x, y);
}

static snake *snake_grow(int x, int y)
{
	snake *temp = NULL;
	for (temp = s; temp->next; temp = temp->next);
	temp->next = malloc(sizeof(snake));
	if (temp->next) {
		temp->next->x = x;
		temp->next->y = y;
		temp->next->previous = temp;
		temp->next->direction = temp->direction;
		grid[temp->next->x][temp->next->y] = 'O';
		wattron(field, COLOR_PAIR(2));
		mvwprintw(field, temp->next->x + 1, temp->next->y + 1, "%c", grid[temp->next->x][temp->next->y]);
		wattroff(field, COLOR_PAIR);
		temp->next->next = NULL;
	} else {
		temp->next = NULL;
	}
	return s;
}
