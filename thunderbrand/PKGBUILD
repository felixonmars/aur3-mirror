# Maintainer:  Lucky <aur.archlinux.org [at] lucky.take0ver [dot] net>

pkgname=thunderbrand
pkgver=3.0
pkgrel=1
pkgdesc="A script to brand Thunderbird without recompiling."
arch=('any')
license=('GPL')
depends=('zip' 'unzip' 'thunderbird>=3.0')
url='http://bbs.archlinux.org/viewtopic.php?id=49314'
source=('thunderbrand.sh')
md5sums=('8b623da1865986fa109339c0325fd47d')

build() {
  mkdir -p "${pkgdir}/usr/bin"
  install -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
