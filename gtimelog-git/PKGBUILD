# Maintainer: Felipe Prenholato <philipe.rp@gmail.com>
# Based on gtimelog PKGBUILD by Bartłomiej Piotrowski

pkgname=gtimelog-git

pkgrel=1
pkgdesc='Small GTK+ app for keeping track of your time - git version'
arch=('any')
url='http://mg.pov.lt/gtimelog/'
license=('GPL')
depends=('python' 'python-gobject' 'python-setuptools')
source=("git+https://github.com/gtimelog/gtimelog.git")
md5sums=('SKIP')
provides=('gtimelog')
conflicts=('gtimelog')
_gitname="gtimelog"

pkgver() {
    version="$(grep '__version__' ${srcdir}/${_gitname}-build/src/gtimelog/__init__.py | cut -d"'" -f2)"
    gitcommit="$(git describe --always)"
    echo "${version}.${gitcommit}"
}

prepare() {
  cd "${srcdir}"
  # create work copy
  rm -rf "${srcdir}/${_gitname}-build"
  git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  cd "${srcdir}/${_gitname}-build"
}


package() {
  cd "${srcdir}/${_gitname}-build"
  python setup.py install --root="$pkgdir"
}
