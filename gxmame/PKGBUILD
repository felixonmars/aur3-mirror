pkgname=gxmame
pkgver=0.34
pkgrel=1
pkgdesc="GXMame is a frontend for XMame using the GTK library, the goal is to provide the same GUI than mame32"
arch=('i686')
url="http://sourceforge.net/projects/gxmame/"
license="GPL"
depends=('gtk2' 'zlib')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://sourceforge.net/projects/gxmame/files/gxmame/0.34/gxmame-0.34.tar.gz)
md5sums=(72887b63f36077cd8ad4bd77d51001ca)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}