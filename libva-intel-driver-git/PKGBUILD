# $Id$
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=libva-intel-driver-git
_gitname=intel-driver
pkgver=1.3.2.r32.g82d2ed8
pkgrel=1
pkgdesc='VA-API implementation for Intel G45 and HD Graphics family'
arch=('i686' 'x86_64')
url='http://freedesktop.org/wiki/Software/vaapi'
license=('MIT')
depends=('libva')
makedepends=('git')
conflicts=("libva-$_gitname")
provides=("libva-$_gitname")
source=(git://anongit.freedesktop.org/vaapi/intel-driver)
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $_gitname
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
