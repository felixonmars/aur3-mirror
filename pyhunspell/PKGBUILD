# Maintainer: Your Name <ghotrix [4t] gmail [d0t] com>
pkgname=pyhunspell
pkgver=0.1
pkgrel=1
pkgdesc="Python bindings for the Hunspell spellchecking engine"
arch=('any')
url="https://code.google.com/p/pyhunspell/"
license=('LGPL')
groups=()
depends=('hunspell' 'python2')
makedepends=('subversion' 'patch')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('strip' 'zipman')
install=
changelog=
source=(svn+http://pyhunspell.googlecode.com/svn/trunk/)
noextract=()

build() {
  cd "$srcdir/trunk"

  echo -e "6c6\n< 			libraries = ['hunspell-1.2'],\n---\n> 			libraries = ['hunspell']," > patch.diff
  patch setup.py patch.diff
  python2 setup.py build
}

package() {
  cd "$srcdir/trunk"

  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  install -m755 -d "${pkgdir}/usr/share/licenses/pyhunspell"
}
md5sums=('SKIP')
