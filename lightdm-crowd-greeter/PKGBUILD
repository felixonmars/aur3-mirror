# Maintainer: SpepS <dreamspepser at yahoo dot it>

_name=crowd-greeter
pkgname=lightdm-$_name
pkgver=0.0.2
pkgrel=1
pkgdesc="A 3D lightdm greeter"
arch=(i686 x86_64)
url="https://launchpad.net/~lightdm-team/+archive/crowd-greeter"
license=('GPL3')
groups=('lightdm-greeters')
depends=('lightdm' 'mesa')
source=("https://launchpad.net/~lightdm-team/+archive/$_name/+files/${_name}_$pkgver.orig.tar.gz")
md5sums=('c6c839d4fac957065c7e1cb326aa394e')

build() {
  cd "$srcdir/$_name-$pkgver"

  ./configure --prefix=/usr \
              --libexecdir=/usr/lib/lightdm
  make CFLAGS="$CFLAGS -lX11 -lm"
}

package() {
  cd "$srcdir/$_name-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
