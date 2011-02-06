# Maintainer: Vojtech Kral <kral.vojtech at gmail dot com>

pkgname=pactree
pkgver=0.2
pkgrel=2
pkgdesc="Shell script for generating in-depth package dependency graphs"
arch=('i686' 'x86_64')
url="http://carlocci.ngi.it/arch/pactree/"
license=('GPL2')
depends=('bash')
optdepends=('graphviz: for outputting graphs in png format')
makedepends=()
provides=('pactree')

source=(http://carlocci.ngi.it/arch/pactree/$pkgname.sh)
md5sums=('576d724740bd15f7ada30b9a046a8355')
noextract=('$pkgname.sh')


build() {
  mkdir -p ${pkgdir}/usr/bin
  cp $pkgname.sh ${pkgdir}/usr/bin/$pkgname
  chmod +x ${pkgdir}/usr/bin/$pkgname
}
