# Maintainer:  Lucky <aur.archlinux.org [at] lucky.take0ver [dot] net>

pkgname=sunbrand
pkgver=0.9
pkgrel=1
pkgdesc="A script to brand Sunbird without recompiling."
url="http://bbs.archlinux.org/viewtopic.php?id=90351"
arch=('any')
license=('GPL')
depends=('zip' 'unzip' 'sunbird=0.9')
source=(${pkgname}.sh)
md5sums=('21a84e6706b6691e9e6ebd93322f2965')

build() {
  mkdir -p ${pkgdir}/usr/bin
  install -m755 ${srcdir}/${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
}
