# Contributor: Cedric GESTES <ctaf42@gmail.com>
pkgname=clanbomber2
pkgver=0.9.1
pkgrel=1
pkgdesc="clanbomber is bomberman clone"
arch=('i686' 'x86_64')
url="http://clanbomber.sourceforge.net/"
license=('GPL')
depends=('directfb' 'fusionsound')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
groups=()
options=()
install=
source=(http://prdownloads.sourceforge.net/sourceforge/clanbomber/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=(generate with makepkg -g)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
#  make DESTDIR=$startdir/pkg install || return 1
  make prefix=$startdir/pkg/usr install || return 1
}


#depends=('libpng' 'glibc' 'libx11' 'libice' 'zlib' 'libxau' 'libxdmcp')

