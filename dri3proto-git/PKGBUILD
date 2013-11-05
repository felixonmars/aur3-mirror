_pkgname=dri3proto
pkgname=dri3proto-git
pkgver=1.0.1.g4325ee7
pkgrel=1
pkgdesc="DRI3 protocol specification and Xlib/Xserver headers"
arch=('any')
url='http://cgit.freedesktop.org/xorg/proto/dri3proto/'
license=('custom')
provides=($_pkgname)
conflicts=($_pkgname)
replaces=($_pkgname)

source=("git+http://cgit.freedesktop.org/xorg/proto/dri3proto/")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --always | cut -d "-" -f2- | tr - .
}

build() {
  cd $_pkgname
  ./autogen.sh --prefix=/usr
  make
}

package(){
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}