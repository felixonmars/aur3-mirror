# Contributor: Michal Krenek <mikos@sg1.cz>

pkgname=ktabedit
pkgver=0.0.6
pkgrel=1
pkgdesc="A KDE tabulature editor, supports Guitar Pro 3 & 4 files"
url="http://kguitartmp.sourceforge.net"
depends=('kdelibs' 'tse3')
source=(http://kguitartmp.sourceforge.net/fichiers/$pkgname-$pkgver.tar.bz2)
md5sums=('2b70f083ffdf1baca2425a38e4968024')

build() {
  cd $startdir/src/$pkgname
  ./configure --prefix=/opt/kde --disable-debug 
  make || return 1
  make DESTDIR=$startdir/pkg install
}
