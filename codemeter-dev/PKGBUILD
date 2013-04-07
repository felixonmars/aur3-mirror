# Maintainer: Christian Bühler <christian.buehler@ipoplan.de>
pkgname=codemeter-dev
pkgver=5.0.1057.500
pkgrel=1
pkgdesc="CodeMeter Development Kit"
arch=('x86_64')
url="http://www.wibu.com/downloads-developer-software.html"
license=('unknown')
source=(codemeter64-dev_${pkgver}_amd64.deb::file://codemeter64-dev_${pkgver}_amd64.deb)
md5sums=('75d9e1c106af001731900550abc5a22d')

package() {
  cd "$pkgdir"
  tar xf "$srcdir/data.tar.gz"
}

# vim:set ts=2 sw=2 et:
