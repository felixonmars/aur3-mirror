# Maintainer:  <clu>

pkgname=chianti
pkgver=7.1.3
pkgrel=1
pkgdesc="The CHIANTI atomic database."
url="http://www.chiantidatabase.org/chianti.html"
arch=('any')
license=('unknown')
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=(http://www.chiantidatabase.org/download/CHIANTI_${pkgver}_data.tar.gz)
md5sums=('d826f22292fdfea73726e448a4ad5339')
noextract=(CHIANTI_${pkgver}_data.tar.gz)

package() {
  cd $srcdir
  mkdir -p $pkgdir/opt/chianti
  tar -xzvf CHIANTI_${pkgver}_data.tar.gz -C $pkgdir/opt/chianti
}
