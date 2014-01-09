# Maintainer: Marek Jędryka <marek629@poczta.onet.pl>

pkgname=subotage
pkgver=0.15
pkgrel=3
pkgdesc='bash subtitle converter'

url="http://subotage.sourceforge.net/"
arch=('any')
license=('GPLv3')
depends=('bash' 'coreutils' 'sed' 'gawk')
optdepends=()
makedepends=()
conflicts=('bashnapi')
replaces=()
backup=()
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}_${pkgver}.tgz")
md5sums=('28180092a11a36f2bcca351ed9b09621')

build() {
  echo "nothing to do"
}

package() {
  tar -zxf ${pkgname}_${pkgver}.tgz &> /dev/null
  mkdir ${pkgdir}/usr/bin -p
  cp -v subotage.sh ${pkgdir}/usr/bin
}
