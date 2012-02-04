# Contributor: Christoph Zeiler <rabyte*gmail>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de> 

pkgname=qu
pkgver=1.24.02
pkgrel=1
pkgdesc="A general purpose, object oriented programming language with a clean syntax"
arch=('i686' 'x86_64')
url="http://www.qu-lang.org/"
license=('GPL')
depends=('libqu' 'bash')
source=(http://www.qu-lang.org/qu-latest.tar.gz)
md5sums=('8df1092c35e52350ba08dfc486eb69b8')

build() {
  cd $pkgname
  ./configure --prefix=$pkgdir/usr/share
  sed 's|local/||g' -i qu.conf
  cd src
  rm -f qu.o
  make qu || return 1
  cd ../lib
  make || return 1
  cd ..
  make install
  chmod 755 $pkgdir/usr/share/qu/bin/qu
  mkdir -p $pkgdir/usr/bin
  ln -sf /usr/share/qu/bin/qu $pkgdir/usr/bin/qu
}
