#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <ncurses.h>
#include <unistd.h>

#define N 20  //grid costant
#define L 3   //Life value (3=max)
#define M 12  //max number of enemy ships

typedef struct x{
  int ship_col; //col of the ship
  int ship_shoot_row; //row reached by ship's shoot
  int life; //life (between 1-3)
  int value;  //value in points of this ship (5*life) 
}enemy_ship;

typedef struct y{
  int col;  //column of my ship
  int shoot_row[N]; //row reached by my ship's shoot
  int shoot_col[N]; //col from which we shot
}my_ship;

int screen_init();  //screen init
void screen_end();  //end game
void grid_init(); //initialize grid
void print_grid();  //print grid
void bold_print(int i, int k, char c);  //print bold!
void change_refresh_time(); //change game speed
void change_height();//in conjunction with lower_enemy_ships, lower of "height" enemy ships
void lower_enemy_ships(); //see above
void change_num_ships();  //add more random ships
void ships_generate();  //generate M random enemy ships
void enemy_shoots();  //lower enemy shoots every round
void my_shoot();  //store col from which we shot
void update_my_shoot(); //raise my x (0<x<N) shoots every round
void manage_hit();  //check if enemy ship was hit
void delete_hit_ship(); //take care of deleting hit ship if its life is 0
void old_shoots_recover();  //take care of shoots from destroyed ship(they must reach ground)
void my_shoots_sort();  //sort my shoots: lower shoot_row must have lower index in the array

//global variables
int points = 0; //points scored by user
int victory = 1;  //are you still playin?
int my_shoots_num = 0;  //tracks number of shoots from player (between 0 and N-2)
int row, col, horiz_space, vert_space, rowtot, coltot;  //Used to manage screen size and printw
int height = 0; //height of enemy ships
int difficulty = 0; //addend for enemy_ships_number
int enemy_ships_number = 7; //number of enemy ships (will increase with time)

int main()
{ 
  int i;
  char a[N][N];
  enemy_ship s[M], old[M];
  my_ship mine;
  
  srand(time(NULL));
  
  if(screen_init() == 1)
    return 1;
  grid_init(a);
  print_grid(a);
//initialize enemy ships + old shoots
  for(i = 0; i < M; i++){
    s[i].ship_col = -1;
    old[i].ship_col = -1;
  } 
  ships_generate(a, s);
//initialize my ship
  for(i = 0; i < N; i++)
    mine.shoot_col[i] = -1;
  mine.col = 0;
  i--;  
  a[i][mine.col] = '*';
  bold_print(i, mine.col, a[i][mine.col]);
  do{
    move(row + i * vert_space, col + mine.col * horiz_space);
    change_refresh_time();
    refresh();
    switch(getch())
    { 
      case KEY_LEFT:
        if((mine.col > 0) && (a[i][mine.col - 1] != ':')){
          a[i][mine.col] = ' ';
          printw("%c", a[i][mine.col]);
          mine.col--;
          a[i][mine.col] = '*';
          mvprintw(row + i * vert_space, col + mine.col * horiz_space, "%c", a[i][mine.col]);
        }
        break;
      case KEY_RIGHT:
        if((mine.col < N - 1) && (a[i][mine.col + 1] != ':')){
          a[i][mine.col] = ' ';
          printw("%c", a[i][mine.col]);
          mine.col++;
          a[i][mine.col] = '*';
          mvprintw(row + i * vert_space, col + mine.col * horiz_space, "%c", a[i][mine.col]);
        }
        break;
      case 32: //space to shoot
        my_shoot(&mine);
        my_shoots_sort(&mine);
        my_shoots_num++;
        break;
      case KEY_F(2): //f2 to exit
        screen_end();
        return 0;   
    }
    if(points < 800){
      if(points >= 100){
        change_num_ships(a, s);   
        if(points >= 150)
          change_height(a, s, &mine, old);    
      }
    }if(my_shoots_num != 0)   
      update_my_shoot(a, s, &mine, old);
    enemy_shoots(a, s, mine.col);
    old_shoots_recover(a, old, mine.col);
  }while(victory);
  screen_end();
  return 0;
}

int screen_init(){
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
  getmaxyx(stdscr, rowtot, coltot);
  if((rowtot < N + 4) || (coltot < N)){
    clear();
    endwin();
    printf("This screen has %d rows and %d columns. Try to enlarge it.\nYou need at least %d rows and %d columns.\n", rowtot, coltot, N + 4, N);
    return 1;
  }
  return 0;
}

void screen_end(){
  char exitmsg[] = "Leaving...bye! See you later :)";
  wtimeout(stdscr, -1);
  clear();
  attron(COLOR_PAIR(rand()%6 + 1));
  attron(A_BOLD);
  if(!victory)
    mvprintw(rowtot / 2,(coltot - strlen("You scored %d points!")) / 2, "You scored %d points!", points);
  else
    mvprintw(rowtot / 2,(coltot - strlen(exitmsg)) / 2, "%s", exitmsg);
  refresh();
  sleep(1);
  attroff(COLOR_PAIR);
  attroff(A_BOLD);
  endwin();
}

void grid_init(char a[][N]){
  int i, k;
  for(i = 0; i < N; i++){
    for(k = 0; k < N; k++){
      a[i][k] = ' ';
    }
  }
}

void print_grid(char a[][N]){
  int i, k;
  vert_space = (rowtot - 4) / (N - 1);  //-4 to leave vertical space to the 3 helper lines below.
  horiz_space = coltot / (N - 1);
//print grid centered 
  row = (rowtot - 4 - (N - 1) * vert_space) / 2;   //-4 to leave vertical space to the 3 helper lines below.
  col = (coltot - (N - 1) * horiz_space) / 2;
  for(i = 0; i < N; i++){
    for(k = 0; k < N; k++)
      mvprintw(row + i * vert_space, col + k * horiz_space, "%c", a[i][k]); 
  }
  attron(COLOR_PAIR(3));
  mvprintw(rowtot - 1, 1, "Move with right/left. Shoot with space.");
  mvprintw(rowtot - 2, 1, "F2 anytime to *rage* quit.");
  mvprintw(rowtot - 3, 1, "Points: %d", points);
  attroff(COLOR_PAIR(3));
  return;
}

void bold_print(int i,int k,char c){
  attron(A_BOLD);
  mvprintw(row + i * vert_space, col + k * horiz_space, "%c", c);
  attroff(A_BOLD);
}

void change_refresh_time(){
  if(points >= 800){
    wtimeout(stdscr, 50);
    return;
  }
  if(points >= 600){
    wtimeout(stdscr, 75);
    return;
  }if(points >= 400){
    wtimeout(stdscr, 100); 
    return;
  }if(points >= 250){
    wtimeout(stdscr, 160); 
    return;
  }if(points >= 100){
    wtimeout(stdscr,200); 
    return;
  }if(points == 0){
    wtimeout(stdscr, 250);
    return;
  }
}

void change_height(char a[][N], enemy_ship s[M], my_ship *mine, enemy_ship old[M]){
  int old_height=height;
  if(points >= 800)
    height = 5;
  else{ 
    if(points >= 650)
      height = 4;
    else{
      if(points >= 500)
        height = 3;
      else{
        if(points >= 300)
          height = 2;
        else{ 
          if(points >= 150)
            height = 1;
        }
      }
    }
  }
  if(height != old_height)      
    lower_enemy_ships(a, s, mine, old);
}

void lower_enemy_ships(char a[][N], enemy_ship s[M], my_ship *mine, enemy_ship old[M]){
  int i, j;
  for(i = 0; i < enemy_ships_number + difficulty; i++){
    a[height - 1][s[i].ship_col] = ' ';   //delete "M" above.
    mvprintw(row + (height - 1) * vert_space, col + s[i].ship_col * horiz_space, "%c", a[height - 1][s[i].ship_col]);
    if(a[height][s[i].ship_col] != '^'){  //check if a shoot was coming     
      a[height][s[i].ship_col] = 'M';
      if(s[i].life == 3)
        bold_print(height, s[i].ship_col, a[height][s[i].ship_col]);
      else
        mvprintw(row + height * vert_space, col + s[i].ship_col * horiz_space, "%c", a[height][s[i].ship_col]);
    }else{
      if(s[i].life != 1){ //if life is > 1, then, even if hit, that ship will remain. So, print it.
        a[height][s[i].ship_col] = 'M';
        mvprintw(row + height * vert_space, col + s[i].ship_col * horiz_space, "%c", a[height][s[i].ship_col]);
      }for(j = 0; j < N; j++){  //find my shoot that will hit this ship, and call manage_hit on it.
        if((mine->shoot_col[j] == s[i].ship_col) && (mine->shoot_row[j] == height)){
          manage_hit(a, j, i, s, old);
          j = N;
        }
      }
      mine->shoot_col[j] = -1;
      my_shoots_num--;
    }
  }
}

void change_num_ships(char a[][N],enemy_ship s[M]){
  int old_difficulty=difficulty;
  if(points >= 750)
    difficulty = 5;
  else{
    if(points >= 600)
      difficulty = 4;
    else{
      if(points>=450)
        difficulty = 3;
      else{
        if(points>=250)
          difficulty = 2;
        else{ 
          if(points>=100)
            difficulty = 1;
        }
      }
    }
  }
  if(difficulty != old_difficulty)  
    ships_generate(a, s);
}

void ships_generate(char a[][N], enemy_ship s[M]){
  int k, i;
  for(i = 0; i < enemy_ships_number + difficulty; i++){
    if(s[i].ship_col == -1){
      do
        k = rand()%N;
      while(a[height][k] == 'M');
      a[height][k] = 'M';
      s[i].ship_col = k;
      s[i].ship_shoot_row = height;
      s[i].life = rand()%L+1;
      s[i].value = 5 * s[i].life;
      if(s[i].life == 3)
        bold_print(height, s[i].ship_col, a[height][s[i].ship_col]);
      else
        mvprintw(row + height * vert_space, col + s[i].ship_col * horiz_space, "%c", a[height][s[i].ship_col]);
    }
  }
} 

void enemy_shoots(char a[][N], enemy_ship s[M], int my_ship_col){
  int i;
  for(i = 0; i < enemy_ships_number + difficulty; i++){
    if(s[i].ship_shoot_row > height){ //if we're not on the same row of the ship, delete above shoot (otherwise it would delete the ship)
      if(a[s[i].ship_shoot_row][s[i].ship_col] == ':'){
        a[s[i].ship_shoot_row][s[i].ship_col] = ' ';
        mvprintw(row + s[i].ship_shoot_row * vert_space, col + s[i].ship_col * horiz_space, "%c", a[s[i].ship_shoot_row][s[i].ship_col]);
      }if((s[i].ship_shoot_row + 1 == N - 1) && (s[i].ship_col == my_ship_col)){
        victory = 0;
        return;
      }if(s[i].ship_shoot_row + 1 == N)
        s[i].ship_shoot_row = height; 
    } 
    s[i].ship_shoot_row++;  //go down and print the shoot
    if(a[s[i].ship_shoot_row][s[i].ship_col] != '^'){
      a[s[i].ship_shoot_row][s[i].ship_col] = ':';
      attron(COLOR_PAIR(1));
      bold_print(s[i].ship_shoot_row, s[i].ship_col, a[s[i].ship_shoot_row][s[i].ship_col]);
      attroff(COLOR_PAIR);
    }     
  }
}

void my_shoot(my_ship *mine){
  int i;
  for(i = 0; i < N; i++){
    if(mine->shoot_col[i] == -1){
      mine->shoot_col[i] = mine->col;
      mine->shoot_row[i] = N - 1;
      return;
    }
  } 
}

void update_my_shoot(char a[][N], enemy_ship s[M], my_ship *mine, enemy_ship old[M]){
  int i, j;
  for(i = 0;i < N; i++){
    if(mine->shoot_col[i] != -1){ //if this shoot exists
      if(mine->shoot_row[i] != N - 1){  //if we're not in the same row of our ship
        a[mine->shoot_row[i]][mine->shoot_col[i]] = ' ';  
        mvprintw(row + mine->shoot_row[i] * vert_space, col + mine->shoot_col[i] * horiz_space, "%c", a[mine->shoot_row[i]][mine->shoot_col[i]]); 
      }if(mine->shoot_row[i] - 1 <= height){  //if we reach the height value (or we're above, in case we lowered ships in the same round), delete this shoot after manage_hit.
        for(j = 0; j < enemy_ships_number + difficulty; j++){
          if(s[j].ship_col == mine->shoot_col[i]){
            manage_hit(a, i, j, s, old);
            j = M;
          }
        }
        mine->shoot_col[i] = -1;
        my_shoots_num--;
      }else{
        mine->shoot_row[i]--; 
        a[mine->shoot_row[i]][mine->shoot_col[i]] = '^';
        attron(COLOR_PAIR(4));
        bold_print(mine->shoot_row[i], mine->shoot_col[i], a[mine->shoot_row[i]][mine->shoot_col[i]]);
        attroff(COLOR_PAIR(4));
      }
    }
  }
}

void manage_hit(char a[][N], int i, int j, enemy_ship s[M], enemy_ship old[M]){
  if(s[j].life == 1){
    points = points + s[j].value;
    delete_hit_ship(a, j, s, old);
    attron(COLOR_PAIR(3));
    attron(A_BOLD);
    mvprintw(rowtot - 3, 1, "Points: %d", points);
    attroff(COLOR_PAIR(3));
    attroff(A_BOLD);
  }else
    s[j].life--;
}

void delete_hit_ship(char a[][N], int j, enemy_ship s[M], enemy_ship old[M]){
  int i;
  if(s[j].ship_shoot_row != N - 1){ //if this ship shoot is still in the game, save it to array old, then delete the ship and generate one more.
    for(i = 0; i < enemy_ships_number + difficulty; i++){
      if(old[i].ship_col == -1){
        old[j].ship_shoot_row = s[j].ship_shoot_row;
        old[j].ship_col = s[j].ship_col;
        i = M;
      }
    }
  }
  a[height][s[j].ship_col] = ' ';
  mvprintw(row + height * vert_space, col + s[j].ship_col * horiz_space, "%c", a[height][s[j].ship_col]);
  s[j].ship_col = -1;
  ships_generate(a, s);
}

void old_shoots_recover(char a[][N], enemy_ship old[M], int my_ship_col){ //take old shoots left from destroyed enemy ships, and take them to the ground
  int i;
  for(i = 0; i < enemy_ships_number + difficulty; i++){
    if(old[i].ship_col != -1){
      if(a[old[i].ship_shoot_row][old[i].ship_col] == ':'){
        a[old[i].ship_shoot_row][old[i].ship_col] = ' ';
        mvprintw(row + old[i].ship_shoot_row * vert_space, col + old[i].ship_col * horiz_space, "%c", a[old[i].ship_shoot_row][old[i].ship_col]);
      }if((old[i].ship_shoot_row + 1 == N - 1) && (old[i].ship_col == my_ship_col)){
        victory = 0;
        return;
      }if(old[i].ship_shoot_row + 1 == N){
        old[i].ship_col = -1;
        return;
      }
      old[i].ship_shoot_row++;
      if(a[old[i].ship_shoot_row][old[i].ship_col] != '^'){
        a[old[i].ship_shoot_row][old[i].ship_col] = ':';
        attron(COLOR_PAIR(1));
        bold_print(old[i].ship_shoot_row, old[i].ship_col, a[old[i].ship_shoot_row][old[i].ship_col]);
        attroff(COLOR_PAIR(1));
      }
    }
  }
}

void my_shoots_sort(my_ship *mine){ //to semplify the code, i need this func. I must be sure that shoots from my ship are ranked by shoot_row (lower shoot_row, lower index). This  way shoots in a row are easier to manage.
  int i, j, higher;
  for(i = 0; i < N - 1; i++){
    for(j = i + 1; j < N; j++){
      if((mine->shoot_col[i] == mine->shoot_col[j]) && (mine->shoot_row[i] > mine->shoot_row[j])){
        higher = mine->shoot_row[i];
        mine->shoot_row[i] = mine->shoot_row[j];
        mine->shoot_row[j] = higher;
      }
    }
  }
}
