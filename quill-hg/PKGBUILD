# Maintainer: xiannox <xian.nox@gmail.com>

# General package information
pkgname=quill-hg
pkgver=tip
pkgrel=1
pkgdesc="A lightweight web browser"
arch=("i686" "x86_64")
url="https://bitbucket.org/celestriad/quill"
license=('GPL3')
depends=('qt5-webkit')
makedepends=('mercurial' 'qt5-tools')
conflicts=('quill')
provides=('quill')

install=quill.install

# Repository-related
_clonedir=quill-src
source=("$_clonedir"::'hg+https://bitbucket.org/celestriad/quill')
# To check out a specific branch append #branch=<branch> to the end of the URL
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_clonedir"
  printf "%s.r%s" "$(hg parents --template '{latesttag}')" "$(hg identify -i)"
}

build() {
  cd "$srcdir/$_clonedir"
  lrelease-qt5 core/resources/translations/*.ts
  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$_clonedir"
  make INSTALL_ROOT="${pkgdir}" install
}
