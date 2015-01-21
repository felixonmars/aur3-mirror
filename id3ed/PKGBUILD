# Maintainer: Carlos Rivas <carlos (a t) twobitcoder (do t) com>
# Contributor: Joost Bremmer <toost dot b at gmail dot com>

pkgname=id3ed
pkgver=1.10.4
pkgrel=2
pkgdesc="Interactive command line ID3-Tag editor"
arch=('i686' 'x86_64' 'arm')
url="http://code.fluffytapeworm.com/projects/id3ed"
license=('GPL')
source=("http://code.fluffytapeworm.com/projects/${pkgname}/${pkgname}-${pkgver}.tar.gz")
options=('!buildflags')
md5sums=('fc0df31ef4ad90b83ee133929afbcc83')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  install -d $pkgdir/usr/{bin,share/man/man1}
  make DESTDIR="$pkgdir" install
}
