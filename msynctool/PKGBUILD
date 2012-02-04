# Maintainer: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Hauke Wesselmann <hauke@h-dawg.de>

pkgname='msynctool'
pkgver='0.22'
pkgrel='1'
pkgdesc='CLI interface to the opensync framework'
arch=('i686' 'x86_64')
url='http://www.opensync.org/'
license=('GPL')
depends=('libopensync')
conflicts=('msynctool-unstable')
makedepends=('python2' 'cmake')

md5sums=('3ddc55209e682a8b99a47cf3d0053dbf')
source=("${url}download/releases/$pkgver/$pkgname-$pkgver.tar.bz2")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make; make DESTDIR=$pkgdir install
}

