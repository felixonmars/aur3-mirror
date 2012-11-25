# Contributor: tantalum <tantalum@online.de>
pkgname=scss-guile
pkgver=0.4.2
pkgrel=1
pkgdesc='Installs scss for using it with guile'
arch=(any)
license=(GPL)
depends=('guile')
url=http://www.nongnu.org/scss/
source=(http://savannah.nongnu.org/download/scss/scss-${pkgver}.tar.gz)
md5sums=(60867228df735f5137dd1fc72e222ae5)
install=install
build () {
  cd ${srcdir}/scss-${pkgver}
  target_dir=${pkgdir}/usr/share/guile/site/scss
  mkdir -p ${target_dir} &&
  mv -t ${target_dir} interface common.scm lexer.scm parser.scm properties.scm scss.scm
}