# Maintainer: Christian Babeux <christian.babeux@0x80.ca>

pkgname=lttv-git
_gitname='lttv'
pkgver=a17029f
pkgrel=1
pkgdesc="Userspace tracing library for LTTng"
arch=('i686' 'x86_64')
url="http://lttng.org/"
license=('GPL')
depends=('gtk2' 'babeltrace' 'popt')
makedepends=('git')
provides=('lttv')
conflicts=('lttv')
options=(!libtool)

source=("git://git.lttng.org/lttv.git")
sha1sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $_gitname
  ./bootstrap
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --libexecdir="/usr/lib/$pkgname"

  make
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir/" install
}
