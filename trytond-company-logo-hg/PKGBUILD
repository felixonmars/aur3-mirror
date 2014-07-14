# Maintainer: Ross Clark <contact@artisteducator.com>
_pkgname=trytond-company_logo
pkgname=trytond-company-logo-hg
pkgver=r15.81e86211b00a
pkgrel=1
pkgdesc="The trytond-company-logo-hg module of the Tryton application platform, adds ability to upload a company logo"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.2' 'trytond-company>=3.2' 'trytond-party>=3.2'  'trytond-currency>=3.2')
makedepends=('python2-distribute')
source=("hg+https://bitbucket.org/trytonspain/${_pkgname}#branch=default")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd $srcdir/$_pkgname
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname
  python2 setup.py install --root=$pkgdir
  # Remove VCS leftovers.
  find "${pkgdir}" -type d -name .hg -exec rm -r '{}' +
}
