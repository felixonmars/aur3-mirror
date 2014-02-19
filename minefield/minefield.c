#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <ncurses.h>

#define N 20

typedef struct{
	char sign;		// char to be printed (* = has bomb, ? = don't know)
	int nearby; 	// =-1 if bomb. Else is the number of bombs near the cell.
}grid;

int num_bombs(); // calculate bomb's number
void cascadeuncover(grid a[][N],int i,int k,int row,int col); // uncover until there are 0-bombs-cell
int checknear(grid a[][N],int i,int k); // check number of bombs nearby
int win_check(grid a[][N]); // check if we won
void victory_check(grid a[][N],int victory,int rowtot,int coltot); // end check

int main()
{	
	int bombs,i,k,row,col,rowtot,coltot,victory=1;
	grid a[N][N];
	
  bombs=num_bombs();
  
//initialize grid
	for(i=0;i<N;i++){
		for(k=0;k<N;k++){
			a[i][k].sign='-';
		}
	}
//produce %num random bombs	
	srand (time(NULL));
	for(i=0;i<bombs;i++){
		do{
			row=(rand()%N);
			col=(rand()%N);
		}while(a[row][col].nearby==-1);
		a[row][col].nearby=-1;
	}	
//check near bombs
	for(i=0;i<N;i++){
		for(k=0;k<N;k++){
			if(a[i][k].nearby!=-1)
				a[i][k].nearby=checknear(a,i-1,k-1)+checknear(a,i-1,k)+checknear(a,i-1,k+1)+checknear(a,i,k-1)+checknear(a,i,k+1)+checknear(a,i+1,k-1)+checknear(a,i+1,k)+checknear(a,i+1,k+1);
		}
	}	
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
	getmaxyx(stdscr,rowtot,coltot); 	
//check terminal size
	if((rowtot<(N-1)*2+3+1)||(coltot<(N-1)*8+5)){
		clear();
		endwin();
		printf("This screen has %d rows and %d columns. Try to enlarge it.\nYou need at least %d rows and %d columns.\n", rowtot, coltot, (N-1)*2+3+1, (N-1)*8+5);
		return 1;
	}
//print grid centered	
	row=(rowtot-(N-1)*2-4)/2;   //-4 to leave vertical space to the 3 helper lines below.
	col=(coltot-(N-1)*8)/2;
	for(i=0;i<N;i++){
		for(k=0;k<N;k++){
			move(row+i*2,col+k*8);
			printw("%c", a[i][k].sign);
		}		
	}
			
	i=0;
	k=0;	
	mvprintw(rowtot-1,1,"Enter to put a bomb (*), twice to put a '?'. Space to uncover. 'c' to check before filling everything.\n");
	mvprintw(rowtot-2,1,"F2 anytime to *rage* quit.\n");
	mvprintw(rowtot-3,1,"Still %d bombs.\n", bombs);	
	refresh();
	attron(A_BLINK);
	move(row,col);
	attroff(A_BLINK);
	
	while((victory)&&(bombs>0)){
		switch(getch())
		{	
			case KEY_LEFT:
				if(k!=0){
					k--;
					attron(A_BLINK);
					move(row+i*2,col+k*8);
					attroff(A_BLINK);
				}
				break;
			case KEY_RIGHT:
				if(k!=N-1){
					k++;
					attron(A_BLINK);
					move(row+i*2,col+k*8);
					attroff(A_BLINK);
				}
				break;
			case KEY_UP:
				if(i!=0){
					i--;
					attron(A_BLINK);
					move(row+i*2,col+k*8);
					attroff(A_BLINK);
				}
				break;
			case KEY_DOWN:
				if(i!=N-1){
					i++;
					attron(A_BLINK);
					move(row+i*2,col+k*8);
					attroff(A_BLINK);
				}
				break;	
			case 32: //space to uncover
				if(a[i][k].sign=='-'){
					if(a[i][k].nearby==-1)
						victory=0;
					else{
						cascadeuncover(a,i,k,row,col);					
						refresh();
						move(row+i*2,col+k*8);
					}
				}	
				break;
			case 10: //Enter to  identify a bomb
				if(a[i][k].sign=='*'){
					a[i][k].sign='?';						
					printw("%c", a[i][k].sign);
					bombs++;
					mvprintw(rowtot-3,1,"Still %d bombs.\n",bombs);
				}else{
					if(a[i][k].sign=='?'){
						a[i][k].sign='-';
						printw("%c", a[i][k].sign);
					}else{
						if(a[i][k].sign=='-'){
							a[i][k].sign='*';
							printw("%c", a[i][k].sign);
							bombs--;
							mvprintw(rowtot-3,1,"Still %d bombs.\n",bombs);
						}
					}
				}
				move(row+i*2,col+k*8);
				refresh();
				break;
			case 99:
				victory_check(a,victory,rowtot,coltot);
				return 0;
			case KEY_F(2): //f2 to exit
				clear();
				endwin();
				return 0;		
		}
	}
//victory check.
	victory_check(a,victory,rowtot,coltot);
	return 0;
}

int num_bombs(){
	int bombs;
	do{
		printf("Select level.\n*1 for easy, 2 for medium, 3 for hard, 4 for...good luck!.\n");
		scanf("%d",&bombs);
	}while((bombs!=1)&&(bombs!=2)&&(bombs!=3)&&(bombs!=4));
	
	switch(bombs){
		case 1:
			bombs=25;
			break;
		case 2:
			bombs=40;
			break;
		case 3:
			bombs=65;
			break;
		case 4:
			bombs=80;
			break;
	}
	return bombs;
}

void cascadeuncover(grid a[][N],int i,int k,int row,int col){
	if(((i>=0)&&(i<N)&&(k>=0)&&(k<N))&&(a[i][k].sign=='-')){					
		if(a[i][k].nearby!=0){
			a[i][k].sign='0'+a[i][k].nearby;
			move(row+i*2,col+k*8);
			if(a[i][k].nearby==1)
				attron(COLOR_PAIR(4));
			else{
				if(a[i][k].nearby==2)
					attron(COLOR_PAIR(5));
				else{
					if(a[i][k].nearby==3)
						attron(COLOR_PAIR(6));		
					else{
						if(a[i][k].nearby>=4)
							attron(COLOR_PAIR(1));
					}
				}
			}
			printw("%c",a[i][k].sign);
			attroff(COLOR_PAIR);
		}else{				
			a[i][k].sign='0';
			move(row+i*2,col+k*8);
			attron(A_BOLD);
			attron(COLOR_PAIR(3));
			printw("%c", a[i][k].sign);
			attroff(COLOR_PAIR(3));
			attroff(A_BOLD);			
			cascadeuncover(a,i,k+1,row,col);
			cascadeuncover(a,i,k-1,row,col);
			cascadeuncover(a,i+1,k,row,col);
			cascadeuncover(a,i-1,k,row,col);
			cascadeuncover(a,i-1,k+1,row,col);
			cascadeuncover(a,i-1,k-1,row,col);
			cascadeuncover(a,i+1,k+1,row,col);
			cascadeuncover(a,i+1,k-1,row,col);
		}
	}
	return;			
}

int checknear(grid a[][N],int i,int k){
	if((i>=0)&&(k>=0)&&(i<N)&&(k<N)&&(a[i][k].nearby==-1))
		return 1;
	return 0;
}	

int win_check(grid a[][N]){
	int i,k;
	for(i=0;i<N;i++){
		for(k=0;k<N;k++){
			if((a[i][k].nearby==-1)&&(a[i][k].sign!='*'))
				return 0;
		}
	}
	return 1; // F**k yoy won :(
}

void victory_check(grid a[][N],int victory,int rowtot,int coltot){
	char winmesg[]="YOU WIN! It was just luck...";
	char losemesg[]="You're a **cking loser.";
	
	if(victory)
		victory=win_check(a);			
	clear();		
	attron(A_BOLD);
	attron(A_REVERSE);
	attron(COLOR_PAIR(2));
	if(victory)
		mvprintw(rowtot/2,(coltot-strlen(winmesg))/2,"%s",winmesg);
	else
		mvprintw(rowtot/2,(coltot-strlen(losemesg))/2,"%s",losemesg);
	refresh();
	attroff(A_BOLD);
	attroff(A_REVERSE);
	attroff(COLOR_PAIR(2));
	getch();
	endwin();	
	return;	
}
