# Contributor: SaThaRiel <sathariel74[at]gmail[dot]com>
pkgname=entroband
pkgver=1.7.1
pkgrel=1
pkgdesc="Entroband is an Angband variant that is intended to be difficult, yet rewarding for characters of all levels."
arch=('i686' 'x86_64')
url="http://artsci.wustl.edu/~bcbarnes/band/"
license=('custom')
depends=('ncurses' 'libx11')
source=(http://furytech.net/files/Variant/Entroband/entroband-1.7.1-src.zip)
md5sums=('48e347a2f03c635204fb2d96ceee6c1a')
 
build() {
  cd $srcdir/entro-src
  sh ./bootstrap
  ./configure --prefix=/usr --with-setgid=games \
        --x-includes=/usr/include --x-libraries=/usr/lib \
        --with-libpath=/usr/lib/entroband/ \
        --with-x --disable-fontset \
        --disable-japanese \
        --disable-xim

  sed 's/q00water.txt//g' lib/edit/Makefile > lib/edit/Makefile.tmp && mv lib/edit/Makefile.tmp lib/edit/Makefile
  make || return 1
  make DESTDIR=$pkgdir install
}
