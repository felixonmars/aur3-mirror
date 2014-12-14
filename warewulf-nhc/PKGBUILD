# Maintainer: Mike Dacre <mike@dacre.me>
pkgname=warewulf-nhc
pkgver=1.4.1
pkgrel=1
pkgdesc="Node health check software for Torque or Slurm from Warewulf"
arch=('any')
url="http://warewulf.lbl.gov/trac/wiki/Node%20Health%20Check#SampleConfiguration"
license=('GPL')
depends=('bash')
source=("http://warewulf.lbl.gov/downloads/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('7578f07b500bc8c8270e28a476584479')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
