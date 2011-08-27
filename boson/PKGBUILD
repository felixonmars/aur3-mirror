# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
pkgname=boson
pkgver=0.11
pkgrel=1
pkgdesc="Boson is an OpenGL real-time strategy game, with the feeling of Command&Conquer(tm) or StarCraft(tm)."
url="http://boson.eu.org/"
license=""
depends=('qt>=3.1' 'kdelibs>=3.1' 'openal' 'lib3ds' 'libvorbis' 'python')
makedepends=('perl')
conflicts=()
replaces=()
backup=()
install=
source=(http://dl.sourceforge.net/sourceforge/boson/$pkgname-code-$pkgver.tar.bz2 \
        http://dl.sourceforge.net/sourceforge/boson/$pkgname-data-$pkgver.tar.bz2 \
        http://dl.sourceforge.net/sourceforge/boson/$pkgname-music-$pkgver.tar.bz2)
md5sums=('9099e71743e05b00cc544be82a97719b' '1580c07445ce47059f815724c808b295'\
         'a04f8ccef2a47c8eaed950877587db3f')

build() {
  cd $startdir/src/$pkgname-code-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install

  cd $startdir/src/$pkgname-data-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install

  cd $startdir/src/$pkgname-music-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
