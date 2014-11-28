# Maintainer: Nathan Fisher <nfisher dot sr gmail com>

pkgname=epubzilla-git
pkgver=0.1.1.r27.ge5fb30f
pkgrel=1
pkgdesc="Python library for extracting data from EPUB documents."
url="http://odeegan.com/epubzilla"
arch=('i686' 'x86_64')
license=('GPL')
depends=('python' 'python-lxml')
makedepends=('git')
_gitname=epubzilla
_gitroot='https://bitbucket.org/odeegan/'
_gitrepo="$_gitname.git"
source=("git+${_gitroot}${_gitrepo}")
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  echo "0.1.1.r$(git rev-list --count master).g$(git log -1 --format="%h")" 
}

build() {
  cd $_gitname
  python setup.py build
}

package() {
  cd $_gitname
  python setup.py install --root "$pkgdir/"
}
