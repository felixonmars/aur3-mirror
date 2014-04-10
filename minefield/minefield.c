#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <ncurses.h>
#include <unistd.h>

#define N 20

typedef struct{
  char sign;    //char to be printed (* = has bomb, - = covered)
  int nearby;   //=-1 if bomb. Else is the number of bombs near the cell.
}grid;

void grid_init(grid a[][N], int bombs); //initialize grid
int num_bombs(); //calculate bomb's number
void cascadeuncover(grid a[][N], int i, int k, int row, int col, int horiz_space, int vert_space); //uncover until there are 0-bombs-cell
int checknear(grid a[][N], int i, int k); //check number of bombs nearby
int win_check(grid a[][N]); //check if we won
void victory_check(grid a[][N], int victory, int rowtot, int coltot); //final check

int main()
{ 
  int bombs, i, k, row, col, rowtot, coltot, victory = 1;
  grid a[N][N];
  char exitmsg[] = "Leaving...bye! See you later :)";
  int horiz_space, vert_space; //scaled values to fit terminal size
  
  srand(time(NULL));  
  bombs = num_bombs();
  grid_init(a, bombs);  
//initialize screen 
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
//check terminal size
  if((rowtot < N + 4)|| (coltot < N)){
    clear();
    endwin();
    printf("This screen has %d rows and %d columns. Try to enlarge it.\nYou need at least %d rows and %d columns.\n", rowtot, coltot, N+4, N);
    return 1;
  }
  vert_space = (rowtot - 4) / (N - 1); //-4 to leave vertical space to the 3 helper lines below.
  horiz_space = coltot / ( N - 1);
//print grid centered 
  row = (rowtot - 4 - (N - 1) * vert_space) / 2;   //-4 to leave vertical space to the 3 helper lines below.
  col= (coltot - (N - 1) * horiz_space) / 2;
  for(i = 0; i < N; i++){
    for(k = 0; k < N; k++)
      mvprintw(row + i * vert_space, col + k * horiz_space, "%c", a[i][k].sign);  
  }
      
  mvprintw(rowtot - 1, 1, "Enter to put a bomb (*). Space to uncover.\n");
  mvprintw(rowtot - 2, 1, "F2 anytime to *rage* quit.\n");
  mvprintw(rowtot - 3, 1, "Still %d bombs.\n", bombs);  
  i = 0;
  k = 0;  
  while((victory) && (bombs > 0)){
    move(row + i * vert_space, col + k * horiz_space);
    refresh();
    switch(getch())
    { 
      case KEY_LEFT:
        if(k != 0)
          k--;
        break;
      case KEY_RIGHT:
        if(k != N-1)
          k++;
        break;
      case KEY_UP:
        if(i != 0)
          i--;
        break;
      case KEY_DOWN:
        if(i != N-1)
          i++;
        break;  
      case 32: //space to uncover
        if(a[i][k].sign == '-'){
          if(a[i][k].nearby == -1)
            victory = 0;
          else
            cascadeuncover(a, i, k, row, col, horiz_space, vert_space);         
        }
        break;
      case 10: //Enter to  identify a bomb
        if((a[i][k].sign == '*') || (a[i][k].sign == '-')){
          if(a[i][k].sign == '*'){
            a[i][k].sign = '-';           
            bombs++;    
          }else{
            a[i][k].sign = '*';
            bombs--;
          }
          printw("%c", a[i][k].sign);
          mvprintw(rowtot - 3, 1, "Still %d bombs.\n", bombs);    
        }
        break;
      case KEY_F(2): //f2 to exit
        clear();
        attron(COLOR_PAIR(rand()%6 + 1));
        mvprintw(rowtot / 2, (coltot - strlen(exitmsg)) / 2, "%s", exitmsg);
        refresh();
        sleep(1);
        attroff(COLOR_PAIR);
        endwin();
        return 0;   
    }
  }
//victory check.
  victory_check(a, victory, rowtot, coltot);
  return 0;
}

void grid_init(grid a[][N],int bombs){
  int i, k, row, col;
//initialize grid
  for(i = 0; i < N; i++){
    for(k = 0; k < N; k++){
      a[i][k].sign = '-';
    }
  }
//produce %num random bombs 
  for(i = 0;i < bombs; i++){
    do{
      row = rand()%N;
      col = rand()%N;
    }while(a[row][col].nearby == -1);
    a[row][col].nearby = -1;
  } 
//check near bombs
  for(i = 0; i < N; i++){
    for(k = 0; k < N; k++){
      if(a[i][k].nearby != -1)
        a[i][k].nearby = checknear(a, i - 1, k - 1) + checknear(a, i - 1, k) + checknear(a, i - 1, k + 1) + checknear(a, i, k - 1) + checknear(a, i, k + 1) + checknear(a, i + 1, k - 1) + checknear(a, i + 1, k) + checknear(a, i + 1, k + 1);
    }
  } 
}

int num_bombs(){
  int bombs;
  do{
    printf("Select level.\n*1 for easy, 2 for medium, 3 for hard, 4 for...good luck!.\n");
    scanf("%d", &bombs);
  }while((bombs != 1) && (bombs != 2) && (bombs != 3) && (bombs != 4));
  
  switch(bombs){
    case 1:
      bombs = 25;
      break;
    case 2:
      bombs = 40;
      break;
    case 3:
      bombs = 65;
      break;
    case 4:
      bombs = 80;
      break;
  }
  return bombs;
}

void cascadeuncover(grid a[][N],int i,int k,int row,int col,int horiz_space,int vert_space){
  if(((i >= 0) && (i < N) && (k >= 0) && (k < N)) && (a[i][k].sign == '-')){          
    a[i][k].sign = '0' + a[i][k].nearby;
    move(row + i * vert_space, col + k * horiz_space);
    if(a[i][k].nearby != 0){
      if(a[i][k].nearby >= 4)
        attron(COLOR_PAIR(1));
      else
        attron(COLOR_PAIR(a[i][k].nearby + 3));
      printw("%c", a[i][k].sign);
      attroff(COLOR_PAIR);
    }else{        
      attron(A_BOLD);
      attron(COLOR_PAIR(3));
      printw("%c", a[i][k].sign);
      attroff(COLOR_PAIR);
      attroff(A_BOLD);      
      cascadeuncover(a, i, k + 1, row, col, horiz_space, vert_space);
      cascadeuncover(a, i, k - 1, row, col, horiz_space, vert_space);
      cascadeuncover(a, i + 1, k, row, col, horiz_space, vert_space);
      cascadeuncover(a, i - 1, k, row, col, horiz_space, vert_space);
      cascadeuncover(a, i - 1, k + 1, row, col, horiz_space, vert_space);
      cascadeuncover(a, i - 1, k - 1, row, col, horiz_space, vert_space);
      cascadeuncover(a, i + 1, k + 1, row, col, horiz_space, vert_space);
      cascadeuncover(a, i + 1, k - 1, row, col, horiz_space, vert_space);
    }
  }
}

int checknear(grid a[][N],int i,int k){
  if((i >= 0) && (k >= 0) && (i < N) && (k < N) && (a[i][k].nearby == -1))
    return 1;
  return 0;
} 

int win_check(grid a[][N]){
  int i, k;
  for(i = 0; i < N; i++){
    for(k = 0; k < N; k++){
      if((a[i][k].nearby == -1) && (a[i][k].sign != '*'))
        return 0;
    }
  }
  return 1; // S**t! you won :(
}

void victory_check(grid a[][N],int victory,int rowtot,int coltot){
  char winmesg[] = "YOU WIN! It was just luck...";
  char losemesg[] = "You're a **cking loser.";
      
  clear();    
  attron(A_BOLD);
  attron(A_REVERSE);
  attron(COLOR_PAIR(2));
  if((victory) && win_check(a))
    mvprintw(rowtot / 2, (coltot - strlen(winmesg)) / 2, "%s", winmesg);
  else
    mvprintw(rowtot / 2, (coltot - strlen(losemesg)) / 2, "%s", losemesg);
  refresh();
  sleep(1);
  attroff(A_BOLD);
  attroff(A_REVERSE);
  attroff(COLOR_PAIR);
  endwin(); 
  return; 
}
