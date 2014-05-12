# Maintainer: vegasd

pkgname=pytagfix-git
_gitname=pytagfix
pkgver=0.1.f3402e5
pkgrel=1
pkgdesc="Tag prettifer for musical albums."
arch=('any')
url="https://github.com/vegasd/"
license=('GPL3')
depends=('python' 'python-pytaglib')
source=("git://github.com/vegasd/$_gitname.git")
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git tag | awk 'END {print}' | cut -d "v" -f2).$(git describe --always | sed 's|-|.|g')
}

package() {
  cd $_gitname
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dvm755 ./pytagfix $pkgdir/usr/bin/pytagfix
}
