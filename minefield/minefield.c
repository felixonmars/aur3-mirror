#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <ncurses.h>

#define N 20

typedef struct{
	char sign;		//carattere relativo al disegno del campo
	int bomb;	  	//se ha la bomba vale 1
	int nearby; 	//numero di bombe nelle celle accanto (se ha la bomba vale -1)
	int visited; 	//se è stata visitata dall'utente
}grid;

void cascadeuncover(grid a[][N],int i,int k,int row,int col);
int checknear(grid a[][N],int i,int k);
int check_visited(grid a[][N]);
int win_check(grid a[][N]);

int main()
{	
	int bombs,i,k,row,col,ch,rowtot,coltot,victory=1,filled=0;
	grid a[N][N];
	char winmesg[]="YOU WIN! It was just luck...";
	char losemesg[]="You're a **cking loser.";
	
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
//initialize grid
	for(i=0;i<N;i++){
		for(k=0;k<N;k++){
			a[i][k].sign='-';
			a[i][k].visited=0;
			a[i][k].bomb=0;
		}
	}
//produce %num random bombs	
	srand (time(NULL));
	for(i=0;i<bombs;i++){
		do{
			row=(rand()%N);
			col=(rand()%N);
		}while(a[row][col].bomb==1);
		a[row][col].bomb=1;
	}	
//check near bombs
	for(i=0;i<N;i++){
		for(k=0;k<N;k++){
			if(a[i][k].bomb==1)
				a[i][k].nearby=-1;
			else	
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
	if((rowtot<(N-1)*2+3+1)||(coltot<(N-1)*8+1)){
		clear();
		attron(COLOR_PAIR(1));
		printw("This screen has %d rows and %d columns. Try to enlarge it.\nYou need at least %d rows and %d columns.\n", rowtot, coltot, (N-1)*2+3+1, (N-1)*8+1);
		refresh();
		attroff(COLOR_PAIR(1));
		getch();
		endwin();
		return 1;
	}
//print grid centered	
	row=(rowtot-(N-1)*2+1-4)/2;   //-4 to leave vertical space to the 3 helper lines below.
	col=(coltot-(N-1)*8+1)/2;
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
	ch=getch();
	while((ch!=(KEY_F(2)))&&(ch!=99)&&(victory)&&(bombs>=0)&&(!filled))
	{	switch(ch)
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
				if(a[i][k].visited!=1){
					if(a[i][k].bomb==1)
						victory=0;
					else{
						cascadeuncover(a,i,k,row,col);					
						refresh();
						move(row+i*2,col+k*8);
					}
				}	
				break;
			case 10: //Enter to  identify a bomb
				if(a[i][k].visited==1){
					if(a[i][k].sign=='*'){
						a[i][k].sign='?';						
						printw("%c", a[i][k].sign);
						bombs++;
						mvprintw(rowtot-3,1,"Still %d bombs.\n",bombs);
						move(row+i*2,col+k*8);
					}else{
						if(a[i][k].sign=='?'){
							a[i][k].sign='-';
							printw("%c", a[i][k].sign);
							move(row+i*2,col+k*8);
							a[i][k].visited=0;
						}
					}
				}else{
					if(bombs!=0){
						a[i][k].sign='*';
						a[i][k].visited=1;
						printw("%c", a[i][k].sign);
						bombs--;
						mvprintw(rowtot-3,1,"Still %d bombs.\n",bombs);
						move(row+i*2,col+k*8);
					}
				}
				refresh();
				break;		
		}
	filled=check_visited(a);	
	if((victory)&&(!filled))	
		ch=getch();
	}
		
	if(ch==KEY_F(2)){
		clear();
		endwin();
		return 0;
	}
//victory check.
	if(victory)
		victory=win_check(a);
				
	clear();		
	attron(A_BOLD);
	attron(A_REVERSE);
	attron(COLOR_PAIR(2));
	if(victory==1)
		mvprintw(rowtot/2,(coltot-strlen(winmesg))/2,"%s",winmesg);
	else
		mvprintw(rowtot/2,(coltot-strlen(losemesg))/2,"%s",losemesg);
	refresh();
	attroff(A_BOLD);
	attroff(A_REVERSE);
	attroff(COLOR_PAIR(2));
	getch();
	endwin();	
	return 0;
}

void cascadeuncover(grid a[][N],int i,int k,int row,int col){
	if(((i>=0)&&(i<N)&&(k>=0)&&(k<N))&&(a[i][k].visited==0)){		
		a[i][k].visited=1;			
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
			printw("%c", a[i][k].sign);
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
	if((i>=0)&&(k>=0)&&(i<N)&&(k<N))
		return (a[i][k].bomb==1);
	return 0;
}	

int check_visited(grid a[][N]){
	int i,k;	
	for(i=0;i<N;i++){
		for(k=0;k<N;k++){
			if(a[i][k].visited==0)
				return 0;
			}
		}
	return 1;
}

int win_check(grid a[][N]){
	int i,k;
	for(i=0;i<N;i++){
		for(k=0;k<N;k++){
			if((a[i][k].bomb==1)&&(a[i][k].sign!='*'))
				return 0;
		}
	}
	return 1;
}
