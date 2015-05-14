# Maintainer: Justin Li <justinnhli@gmail.com>
# Contributors:
#  fenuks
#  crossroads1112
#  demizer
#  David Manouchehri <david@davidmanouchehri.com>

pkgname=python-neovim-git
_gitname=python-client
_gitbranch=master
_gitauthor=neovim
pkgver=0.r253.1fab30b
pkgrel=2
pkgdesc="Python client for neovim"
url="https://github.com/$_gitauthor/$_gitname"
license=('Apache')
source=("git://github.com/$_gitauthor/$_gitname.git#branch=$_gitbranch")
sha512sums=('SKIP')
arch=('any')
depends=('python-cairo'
         'python-click'
         'python-gobject'
         'python-greenlet'
         'python-msgpack')
makedepends=('git' 'python-setuptools')

pkgver() {
  cd "$_gitname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_gitname"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set sw=2 sts=2 et:
