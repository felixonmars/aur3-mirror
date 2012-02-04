# Contributor: Nedim Boztepe <pardusnedo (_at_)hotmail.de>

pkgname=skype4py-svn
pkgver=283
pkgrel=1
pkgdesc="Skype4Py is a Python wrapper for the Skype API"
arch=('i686' 'x86_64')
license=('GPL')
url="https://developer.skype.com/wiki/Skype4Py"
depends=('python')
makedepends=('subversion')
source=()
md5sums=()
_svntrunk="https://skype4py.svn.sourceforge.net/svnroot/skype4py/"
_svnmod="skype4py"
provides=('skype4py')
conflicts=('skype4py')



build() {
  cd $startdir/src/
  mkdir -p ~/.subversion
  svn co https://skype4py.svn.sourceforge.net/svnroot/skype4py
  cd $_svnmod
  python setup.py install --root=$startdir/pkg/ || return 1
}


