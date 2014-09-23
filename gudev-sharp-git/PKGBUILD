# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: oke3 < Sekereg [at] gmx [dot] com >
# Contributor: neuromante <lorenzo.nizzi.grifi@gmail.com>

pkgname=gudev-sharp-git
_gitname=gudev-sharp
pkgver=3.0.0.r0.g7bd4500
pkgrel=4
pkgdesc="Gudev mono bindings (development version)"
arch=('any')
url="http://github.com/mono/gudev-sharp"
license=('LGPL')
depends=('gtk-sharp-3')
makedepends=('git')
provides=('gudev-sharp=3.0.0')
conflicts=('gudev-sharp')
options=('!makeflags')
source=('git://github.com/mono/gudev-sharp.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_gitname"
    ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var
    make
}

package() {
    cd "$srcdir/$_gitname"
    make DESTDIR="$pkgdir" install
}
