# Maintainer: Lucky <aur.archlinux.org [at] lucky.take0ver [dot] net>

pkgname=firebrand
pkgver=3.6
pkgrel=3
pkgdesc="A script to brand Firefox without recompiling."
url="http://bbs.archlinux.org/viewtopic.php?id=44320"
license=("GPL")
arch=("any")
depends=("zip" "unzip" "firefox>=3.6")
source=("${pkgname}.sh")
md5sums=("6f0b9c529f6ff1a98faacabefe1b8d4e")

build() {
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
