# Maintainer:  Cristian Maureira <cmaureirafredes@gmail.com>

pkgname=python-prettyplotlib
pkgver=0.1.4
pkgrel=1
pkgdesc='Painlessly create beautiful matplotlib plots'
arch=('any')
url='https://github.com/olgabot/prettyplotlib/wiki'
license=('MIT')
depends=('python-matplotlib' 'python-brewer2mpl')
provides=('prettyplotlib')
_gitname=('prettyplotlib')
source=("$_gitname::git+https://github.com/olgabot/prettyplotlib.git")
md5sums=('SKIP')

build() {
  cd "$_gitname"
  python3 setup.py build
}

package() {
  cd "$_gitname"
  python3 setup.py install --root="$pkgdir"
}
