# Maintainer: Stephane Sezer <sas@cd80.net>
pkgname='mbdbdump'
pkgver='1.0'
pkgbranch='master'
pkgrel='1'
pkgdesc='Analyze contents of an iPhone backup in MBDB format.'
arch=('any')
url="https://github.com/sas/${pkgname}"
license=('BSD')
depends=('openssl')
source=("${pkgname}-${pkgbranch}.zip::${url}/archive/${pkgbranch}.zip")
md5sums=('SKIP')

build () {
  cd "${srcdir}/${pkgname}-${pkgbranch}"
  make all
}

package () {
  cd "${srcdir}/${pkgname}-${pkgbranch}"
  make PREFIX="${pkgdir}/usr" install
}
