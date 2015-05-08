# Maintainer: Soukyuu <chrno-sphered at hotmail dot com>

pkgname=wavpack-git
pkgver=r324.7b6c682
pkgrel=1
pkgdesc="Audio compression format with lossless, lossy and hybrid compression modes"
arch=('i686' 'x86_64')
url="http://www.wavpack.com/"
license=('BSD')
depends=('glibc')
source=('git+https://github.com/dbry/wavpack')
sha1sums=('SKIP')
conflicts=('wavpack')
provides=('wavpack')

build() {
  cd ${srcdir}/wavpack
  ./autogen.sh
  ./configure --prefix=/usr --libdir=/usr/lib
  make
}

package() {
  cd ${srcdir}/wavpack
  ls -la
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

pkgver() {
  cd $srcdir/wavpack
  echo r$(git rev-list --count master).$(git rev-parse --short master)
}

