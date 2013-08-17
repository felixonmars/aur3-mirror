# Maintainer: Wade <archwade.20.apex3@xoxy.net>
pkgname=newsd
pkgver=1.46
pkgrel=1
pkgdesc="Standalone local NNTP server for local forum serving on a single server"
arch=('i686' 'x86_64')
url="http://newsd.easysw.com/index.php"
license=('GPL')
depends=(sh gcc-libs)
install=newsd.install
source=(
  https://github.com/wwade/$pkgname/archive/$pkgver.tar.gz
  newsd.install
  newsd.service
)

sha512sums=('1a78d06ead0d43d37bf15f8fc26b5100e1494574bb67a3904762bcc3cf51b660c0d95b4f4bea3ad7202bd1e92424c7d30bc9f392d0aa6b3594ddd7f246ca9ea6'
            '0c88a787e4ab4392d081d3ef35f5016ac491922d8c16b3e4471c32861ba72dee98f55807d47b3ef1ffccde998abdf92c2a62fe96203d03da6d45f4731d51db39'
            '9d892c2fc039dbd75d7907d3d36cf3f25090b1c84683f0dc35bd08709382b0cd497b945ea73f0187aa3afc013f6793835f60c4f2cf7d4070045868ac265a2ebf')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  mkdir -p ${pkgdir}/usr/lib/systemd/system/
  cp ${srcdir}/newsd.service ${pkgdir}/usr/lib/systemd/system/

  rm -fr $pkgdir/etc/rc.d
}

# vim:set ts=2 sw=2 et:
