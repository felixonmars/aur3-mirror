# Maintainer: Christoffer Hirth <admin[at]toffyrn[dot]net>
pkgname=toffyrn--qvmc
pkgver=0.0.92
pkgrel=1
pkgdesc="A library for quantum variational Monte Carlo."
url="https://orion.toffyrn.net/trac/physics/wiki"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('armadillo')
optdepends=('libopencl')
makedepends=()
conflicts=()
replaces=()
backup=()
source=('https://orion.toffyrn.net/svn/physics/qvmc/tags/toffyrn--qvmc-0.0.92.tar.gz')
install=install
md5sums=('f0ab3d791e39db222663a2f50bf98a57')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure
  make
}

package() {
  cd "${pkgdir}"
  mkdir -p etc/ld.so.conf.d/
  echo "/usr/local/lib" > etc/ld.so.conf.d/toffyrn--qvmc.conf
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
