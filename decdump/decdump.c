// zbynek@ithvezda.cz
// Quick & dirty decdump
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <inttypes.h>
// Max characters per line
#define MAX (20)
#define NO_PRINT_CHAR ('.')
char buff[MAX];
int used = 0;
uint64_t cnt = 0;

void printTextPos() { printf("%7lu |", (cnt - used)); }

void printTextValues() {
  // characters
  for (int i = 0; i < used; ++i) {
    char toPrint = buff[i];
    switch (toPrint) {
      case '\n':
        printf("%4d\\n", toPrint);
        continue;
      case '\r':
        printf("%4d\\r", toPrint);
        continue;
      default:
        printf("%4d  ", toPrint);
    }
  }
}

void printTextValuesPad() {
  for (int i = used; i < MAX; ++i) {
    printf("      ");
  }
}

void printOrigText() {
  putc('|', stdout);

  for (int i = 0; i < used; ++i) {
    char toPrint = isprint(buff[i]) ? buff[i] : NO_PRINT_CHAR;
    putc(toPrint, stdout);
  }

  // pad
  if (used != MAX)
    for (int i = used; i < (MAX); ++i) {
      fputc(' ', stdout);
    }

  putc('|', stdout);
}
void printBuff() {
  printTextPos();
  printTextValues();
  printTextValuesPad();
  printOrigText();

  putc('\n', stdout);
}

int main() {
  int c;
  while ((c = getc(stdin)) != EOF) {
    cnt++;
    buff[used] = c;
    if (++used == MAX) {
      printBuff();
      used = 0;
    }
    // putc(c,stdout);
  }
  if (used > 0) {
    printBuff();
  } else {
    putc('\n', stdout);
  }
  return 0;
}
