# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from bazaar sources.

# Contributor: Alexandre Défossez <alexandre.defossez at google famous mailing service>
pkgname=epydoc-svn
pkgver=3
pkgrel=1
pkgdesc="Epydoc is a tool for generating API documentation for Python modules,based on their docstrings."
arch=('any') # python
url="http://epydoc.sourceforge.net/"
license=('MIT')
groups=()
depends=('python2' 'graphviz' 'docutils')
makedepends=('subversion')
provides=(epydoc) 
conflicts=(epydoc)
replaces=()
backup=()
options=()
install=
source=()
noextract=()

build() {
  cd "$srcdir"
  msg "Downloading latest svn version..."
  
  svn co https://epydoc.svn.sourceforge.net/svnroot/epydoc/trunk/epydoc $srcdir/svn_src

  rm -rf "$srcdir/svn-build"
  cp -r "$srcdir/svn_src/src" "$srcdir/svn-build"
  cd "$srcdir/svn-build"

  python2 setup.py build || return 1
} 

package(){
  cd "$srcdir/svn-build"
  python2 setup.py install --root="$pkgdir" || return 1
  install -D -m644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
