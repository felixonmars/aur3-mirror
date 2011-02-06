# Contributor: Eric Forgeot < http://anamnese.online.fr >
pkgname=abctab2ps
pkgver=1.8.8
pkgrel=2
pkgdesc="abctab2ps is a music and luth tablature typesetting program which translates an input file in the abc language into postscript."
arch=(i686 x86_64)
url="http://www.lautengesellschaft.de/cdmm/"
license=('GPL')
depends=('glibc')
makedepends=('autoconf')
provides=('abctab2ps')
#backup=()
#groups=()
#options=()
#install=
source=(http://www.lautengesellschaft.de/cdmm/$pkgname-$pkgver.tar.gz http://www.lautengesellschaft.de/cdmm/tab2abc.tar.gz)
#noextract=()
md5sums=('')

build() {
  cd $startdir/src/$pkgname-$pkgver/src
  #./configure --prefix=/usr
  make || return 1
  
mkdir -p $startdir/pkg/usr/bin
mkdir -p $startdir/pkg/usr/share/doc/abctab2ps
mkdir -p $startdir/pkg/usr/man/man1
mkdir -p $startdir/pkg/usr/share/abctab2ps

make DESTDIR=$startdir/pkg install PREFIX=$startdir/pkg/usr || return 1
#BINDIR=$(PREFIX)/bin MANDIR=$(PREFIX)/man/man1 DOCDIR=$(PREFIX)/share/doc/abctab2ps FONTDIR=$(PREFIX)/share/abctab2ps || return 1
mkdir -p $startdir/pkg/usr/share/doc/abctab2ps/
cp -fr $startdir/src/$pkgname-$pkgver/doc/* $startdir/pkg/usr/share/doc/abctab2ps
  #make prefix=$startdir/pkg/usr docdir=$startdir/pkg/usr/doc install
## tab2ps ##
mkdir -p $startdir/pkg/usr/share/doc/tab2abc/
mkdir -p $startdir/pkg/usr/share/doc/tab2abc/
cp -fr $startdir/src/tab2abc/Readme $startdir/pkg/usr/share/doc/tab2abc/
cp -fr $startdir/src/tab2abc/tab2abc.html $startdir/pkg/usr/share/doc/tab2abc/
cp -fr $startdir/src/tab2abc/tab2abc.1  $startdir/pkg/usr/man/man1
cp -fr $startdir/src/tab2abc/tab2abc  $startdir/pkg/usr/bin
chmod +x $startdir/pkg/usr/bin/tab2abc
} 
