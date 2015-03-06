# Maintainer: Mike Cooper <mythmon@gmail.com>
_pkgname=jbo
pkgname=${_pkgname}-git
pkgver=0
pkgrel=1
pkgdesc="An offline Lojban dictionary. Uses jbovlaste offline."
arch=('any')
url="https://github.com/dag/jbo"
license=('BSD')
depends=('python2'
         'python2-progressbar>2.2'
         'python2-pystemmer'
         'python2-lxml')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(jbo::git+https://github.com/dag/jbo.git)
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  install "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
