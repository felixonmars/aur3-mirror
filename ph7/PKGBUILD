# Contributor: Jens Staal <staal1978@gmail.com>
pkgname=ph7
pkgver=2001004
pkgrel=1
pkgdesc="A light-weight alternative implementation of PHP"
arch=('i686' 'x86_64')
url="http://ph7.symisc.net/"
license=('custom:Symisc Public License')
#depends=('')
#makedepends=('')
source=("http://www.symisc.net/downloads/ph7-amalgamation-${pkgver}.zip" \
"http://www.symisc.net/downloads/ph7-interpreter-src.zip")
md5sums=('1f7692c122fcdf03ffd7a8852a993884' 'be437280e0aa226c7f8d4f4508ef50c2')

build() {
  cd $srcdir
  
  msg "checking favourite compiler"
    if [-z $CC]
    then
    msg2 "you got a favourite compiler, use that"
    else
    msg2 "favourite compiler not set, default to gcc"
    CC=gcc
    fi
  
  msg "compiling the ph7 binary"
  $CC -W -Wall -O6 -o ph7 ph7_interp.c ph7.c -D PH7_ENABLE_MATH_FUNC -lm
}

package() {
  mkdir -p ${pkgdir}/usr/{bin,share/licenses/ph7}
  install -m755 ph7 ${pkgdir}/usr/bin/
  install -m644 license.txt ${pkgdir}/usr/share/licenses/ph7/
}
