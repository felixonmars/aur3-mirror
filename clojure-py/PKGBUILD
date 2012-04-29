# Maintainer: James Hunt <aur at brandnewmath dot com>

pkgname=clojure-py
_pkgname=clojure_py
pkgver=0.2.4
pkgrel=2
pkgdesc="An implementation of Clojure in pure Python."
url="https://github.com/halgari/clojure-py"
license=('EPL')
depends=('python2')
arch=('any')
provides=('clojure-py')
source=("https://github.com/downloads/halgari/${pkgname}/${_pkgname}-${pkgver}.tar.gz" "LICENSE" "clojure.py")
sha1sums=('c37b169faed31fb7fc5755671b78acb943ea5aa4'
          'e78277e502c29abb74b9587a5dc951ec392554ea'
          '2721d99122fae5ffd8bcd9fbfe3d97dd8be8fc12')

package() {
  mkdir -p ${pkgdir}/usr/share/licenses/clojure-py
  cp LICENSE ${pkgdir}/usr/share/licenses/clojure-py
  mkdir -p ${pkgdir}/usr/bin
  install -m755 clojure.py ${pkgdir}/usr/bin/clojurepy
  cd "$srcdir/${_pkgname}-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}
