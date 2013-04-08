# Maintainer: CJlano <cjlano+AUR.basiciw@free.fr>

pkgname=basiciw-git
_gitname=basiciw
pkgver=0.4.d3789da
pkgrel=1
pkgdesc="Retrieve information such as ESSID or signal quality from wireless cards (Python module)"
arch=('i686' 'x86_64')
url="https://github.com/enkore/basiciw/"
license=('MIT')
depends=('python')
makedepends=('git')
source=('git://github.com/enkore/basiciw.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  echo "0.$(git rev-list --count HEAD).$(git describe --always )"
}

package() {
  cd "$srcdir"/$_gitname
  python setup.py install --root "$pkgdir"

  # Install README file
  install -Dm644 README "${pkgdir}/usr/share/${pkgname}/README"
}

# vim:set ts=2 sw=2 et:
