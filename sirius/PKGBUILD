# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=sirius
pkgver=0.8.0
pkgrel=2
pkgdesc="A program for playing the game of othello/reversi."
arch=('i686' 'x86_64')
url="ftp://ftp.iitb.ac.in/distributions/fedora.old/extras/4/SRPMS/repoview/sirius.html"
license=('GPL2')
depends=('libgnomeui')
source=(ftp://ftp.iitb.ac.in/distributions/fedora.old/extras/4/SRPMS/sirius-0.8.0-5.src.rpm)
md5sums=('7ef504a0c6ac068b0bce587d5dee8c78')

prepare() {
  #cd $srcdir 
  # Extract RPM
  bsdtar xf sirius-0.8.0-5.src.rpm
  tar xf sirius-0.8.0.tar.gz

  cd $srcdir/$pkgname-$pkgver  
  ./configure --prefix=/usr LIBS="-lpthread -lm"
   
   # Fix desktop file entry
   sed -i 's|Game;|Game;BoardGame|;s|Comment=Sirius, a o|GenericName=O|' sirius.desktop
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  
  # Man page
  install -Dm644 debian/sirius.1 $pkgdir/usr/share/man/man1/sirius.1
}
