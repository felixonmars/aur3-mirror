# Maintainer: Ross Clark <contact@artisteducator.com>
_pkgname=trytond-party_communication
pkgname=trytond-party-communication-hg
pkgver=r38.17a496b6c1dd
pkgrel=1
pkgdesc="The trytond_party_communication module of the Tryton application platform, adds telephone numbers etc. to contact details"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.2' 'trytond-party>=3.2')
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
