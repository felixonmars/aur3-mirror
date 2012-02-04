# Maintainer:  TDY <tdy@gmx.com>
# Contributor: Arto Puranen <purcher@gmail.com>
# Contributor: tobias <tobias@archlinux.org>

pkgname=gmpc-last.fm
pkgver=0.20.0
pkgrel=1
pkgdesc="A plugin for fetching artist images from last.fm"
arch=('i686' 'x86_64')
url="http://gmpcwiki.sarine.nl/"
license=('GPL')
depends=('gmpc>=0.16.2' 'gtk2>=2.8' 'libmpd>=0.15.98')
makedepends=('intltool>=0.21' 'pkg-config>=0.9.0')
options=('!libtool')
source=(http://download.sarine.nl/Programs/${pkgname%-*}/$pkgver/${pkgname/./-}-$pkgver.tar.gz)
md5sums=('aa5ae094e1bb78a11de9dd6e12f0bfb7')

build() {
  cd "$srcdir/${pkgname/./-}-$pkgver"
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd "$srcdir/${pkgname/./-}-$pkgver"
  make DESTDIR="$pkgdir" install
}
