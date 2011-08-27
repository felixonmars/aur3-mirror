# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: Your Name <youremail@domain.com>
pkgname=babeldjango-svn
pkgver=462
pkgrel=1
pkgdesc="This is a collection of utilities for integrating Babel into  Django applications."
arch=('i686')
url="http://babel.edgewall.org/wiki/BabelDjango"
license=('BSD')
groups=()
depends=('python-babel>=0.9.4')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
noextract=()
md5sums=() #generate with 'makepkg -g'

_svntrunk=http://svn.edgewall.org/repos/babel/contrib/django/


build() {
  cd "$srcdir/"

  svn co $_svntrunk -r $pkgver $pkgname 
  cd $pkgname
  python setup.py install --root=$startdir/pkg
}

