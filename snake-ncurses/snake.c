#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <ncurses.h>
#include <unistd.h>

#define N 30
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
static snake *reclist(snake *s, int i, int x, snake *previous);
static void grid_init(void);
static void change_directions(int direction);
static void eat_fruit(int x, int y);
static void snake_move(void);
static snake *snake_grow(int x, int y);
static int main_cycle(void);

/* Global variables */
int horiz_space, vert_space; /* scaled values to fit terminal size */
int row, col, rowtot, coltot, points, lose;
char grid[N][N];
snake *s;

int main(void)
{
	int level;
	lose = 0;
	srand(time(NULL));
	do {
		printf("Select level: 1 easy, 2 medium, 3 hard, 4 really fuc**ng impossible.\n");
		scanf("%d", &level);
	} while (level != 1 && level != 2 && level != 3 && level != 4);
	grid_init();
	if (screen_init(level))
		return 1;
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
	keypad(stdscr, TRUE);
	switch (level) {
	case 1:
		wtimeout(stdscr, 300);
		break;
	case 2:
		wtimeout(stdscr, 200);
		break;
	case 3:
		wtimeout(stdscr, 150);
		break;
	case 4:
		wtimeout(stdscr, 80);
		break;
	}
	getmaxyx(stdscr, rowtot, coltot);
	/* check terminal size */
	if ((rowtot < N + 2) || (coltot < N)) {
		clear();
		endwin();
		printf("This screen has %d rows and %d columns. Enlarge it.\n",
		       rowtot, coltot);
		printf("You need at least %d rows and %d columns.\n",
		       N + 2, N);
		return 1;
	}
	/* -2 to leave vertical space to the 2 helper lines below. */
	vert_space = (rowtot - 2) / (N - 1);
	horiz_space = coltot / (N - 1);
	/* print grid centered */
	row = (rowtot - 2 - (N - 1) * vert_space) / 2;
	col = (coltot - (N - 1) * horiz_space) / 2;
	for (i = 0; i < N; i++) {
		for (k = 0; k < N; k++)
			mvprintw(row + i * vert_space, col + k * horiz_space,
				 "%c", grid[i][k]);
	}
	points = 0;
	mvprintw(rowtot - 1, 1, "F2 anytime to *rage* quit. Arrow keys to move.\n");
	mvprintw(rowtot - 2, 1, "%d points\n", points);
	return 0;
}

static void screen_end(void)
{
	char exitmsg[] = "Leaving...bye! See you later :)";
	wtimeout(stdscr, -1);
	clear();
	attron(COLOR_PAIR(rand()%6 + 1));
	attron(A_BOLD);
	if (lose)
		mvprintw(rowtot / 2, (coltot - strlen("You scored %d points!")) / 2, "You scored %d points!", points);
	else
		mvprintw(rowtot / 2, (coltot - strlen(exitmsg)) / 2, "%s",
			 exitmsg);
	refresh();
	sleep(1);
	attroff(COLOR_PAIR);
	attroff(A_BOLD);
	endwin();
}

static snake *reclist(snake *s, int i, int x, snake *previous)
{
	s = malloc(sizeof(snake));
	if ((s) && (i != STARTING_SIZE)) {
		s->x = x;
		s->y = x - i;
		s->direction = 0;
		grid[s->x][s->y] = 'O';
		s->previous = previous;
		s->next = reclist(s->next, i + 1, x, s);
	} else {
		s = NULL;
	}
	return s;
}

static void fruit_gen(void)
{
	int i, k;
	do {
		i = rand()%N;
		k = rand()%N;
	} while (grid[i][k] == 'O');
	grid[i][k] = '*';
}

static void grid_init(void)
{
	s = reclist(s, RIGHT, N/2, NULL);
	fruit_gen();
}

static void snake_move(void)
{
	int i, k, eat = 0;
	snake *temp = NULL;
	for (temp = s; temp; temp = temp->next) {
		grid[temp->x][temp->y] = ' ';
		if ((eat) && (!temp->next)) {
			i = temp->x;
			k = temp->y;
		}
		switch (temp->direction) {
			case RIGHT:
				temp->y++;
				if (temp->y == N)
					temp->y = 0;
				break;
			case LEFT:
				temp->y--;
				if (temp->y == -1)
					temp->y = N - 1;
				break;
			case UP:
				temp->x--;
				if (temp->x == -1)
					temp->x = N - 1;
				break;
			case DOWN:
				temp->x++;
				if (temp->x == N)
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
	}
	if (eat) {
		eat_fruit(i, k);
		mvprintw(rowtot - 2, 1, "%d points\n", points);
	}
	for (i = 0; i < N; i++) {
		for (k = 0; k < N; k++)
			mvprintw(row + i * vert_space, col + k * horiz_space, "%c", grid[i][k]);
	}
	move(row + s->x * vert_space, col + s->y * horiz_space);
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
	refresh();
	switch (getch()) {
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
		temp->next->next = NULL;
	} else {
		temp->next = NULL;
	}
	return s;
}
