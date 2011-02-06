#include <iostream>
#include "XKeyboard.h"

int main( int argc, char* argv[] ) {
  if (argc == 0) {
    


  XKeyboard xkb;
  std::cout << xkb.currentGroupSymbol();
  return 0;
}
