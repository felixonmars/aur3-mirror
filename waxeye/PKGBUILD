# Maintainer:  <ying@althonx4>
# Contributor: <martin.minka@gmail->
pkgname=waxeye  
pkgver=0.8.1
pkgrel=1
pkgdesc="A parser generator based on parsing expression grammars (PEGs). It supports C, Java, Javascript, Python, Ruby and Scheme."
url="http://www.waxeye.org"
arch=('i686' 'x86_64')
license=('MIT')
makedepends=(racket)
source=("https://github.com/orlandohill/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('d17c165ac9790295de66a1b8db47d42b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  raco link "${srcdir}/${pkgname}-${pkgver}/src/scheme/waxeye"
  build/make dist-unix
  raco link --remove "${srcdir}/${pkgname}-${pkgver}/src/scheme/waxeye"

}

package() {
  install -d "${pkgdir}/opt/${pkgname}"
  cp -r "${srcdir}/${pkgname}-${pkgver}/dist/${pkgname}-${pkgver}/"* "${pkgdir}/opt/${pkgname}/"
  install -d "${pkgdir}/usr/bin/"
  ln -sf "/opt/${pkgname}/bin/waxeye" "${pkgdir}/usr/bin/waxeye"
}


