# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: Hauke Wesselmann <hauke@h-dawg.de>

pkgname=libopensync-plugin-file-stable
_realname=libopensync-plugin-file
pkgver=0.22
pkgrel=1
pkgdesc='File plugin for OpenSync 0.2x'
url='http://www.opensync.org'
license=('LGPL')
arch=('i686' 'x86_64')
depends=('libopensync-stable')
source=(http://archive.ubuntu.com/ubuntu/pool/universe/libo/${_realname}/${_realname}_${pkgver}.orig.tar.gz)
options=('!libtool')
sha256sums=('3bb5661ffd1224c47f6a090c3086765ecf7b7f1e72f75b5fe416809962115387')

build() {
  cd ${srcdir}/${_realname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${_realname}-${pkgver}
  make DESTDIR=$pkgdir install
}
