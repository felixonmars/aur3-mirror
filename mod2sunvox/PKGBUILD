# Maintainer: fuzzix <fuzzix@gmail.com>

# No docs, license info etc. Have fun!

pkgname=mod2sunvox
pkgver=1.1
pkgrel=2
pkgdesc="MOD/XM -> SunVox conversion utility"
arch=('i686' 'x86_64')
url="http://www.warmplace.ru/soft/sunvox/"
license=('custom')
arch=('i686' 'x86_64')
[ "$CARCH" = "x86_64" ] && depends=('lib32-glibc' 'lib32-gcc-libs')

source=(http://www.warmplace.ru/soft/sunvox/${pkgname}${pkgver}.zip)
md5sums=('7cd6a3199c1c0b3f9b4367b2ed7fd01d')

build() {
  cd "${srcdir}/"
  install -d "${pkgdir}/usr/bin"
  install -Dm0755 "${pkgname}/linux/${pkgname}" "${pkgdir}/usr/bin"
}

