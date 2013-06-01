# Maintainer: JWC <acc+arch@AT@jwcxz.com>
pkgname=python2-vim-pandemic-git
_gitname=vim-pandemic
pkgver=0.0.0
pkgrel=2
pkgdesc="A utility for managing Vim bundles"
arch=('any')
url="http://jwcxz.com/projects/vim-pandemic"
license=('MIT')
groups=()
depends=('pacman' 'python2')
makedepends=('git')
provides=('python2-vim-pandemic')
conflicts=('python2-vim-pandemic')
options=(!emptydirs)
source=('git+https://github.com/jwcxz/vim-pandemic')
md5sums=(SKIP)

pkgver() {
    cd $_gitname
    git describe --always | cut -f2 -dv | sed 's|-|.|g'
}

package() {
  cd $_gitname
  sed 's/python/python2/g' -i bin/pandemic
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
