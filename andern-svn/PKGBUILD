# Contributor: Clayton Thompson <fiendskull9@gmail.com>

_svntrunk=http://andern.googlecode.com/svn/trunk/
_svnmod=andern-read-only

cur=`svn log $_svntrunk --limit 1 | sed -e '/^r/!d' -e 's/^r\([0-9]\+\) .*/\1/;q'`
pkgname=andern-svn
pkgver=28
pkgrel=1
pkgdesc="a lightweight ID3v2 Tag editor written in python using GTK2"
arch=(i686)
url="http://fiendy.com/andern"
license="GPL"
depends=('gtk2' 'python' 'pygtk' 'pyid3lib')
makedepends=('subversion' 'versionpkg')
provides=('andern')
source=()
md5sums=()


build() {
  cd $startdir/src
  mkdir -p ~/.subversion
  svn co $_svntrunk -r $pkgver $_svnmod
  cd $_svnmod
  sudo python setup.py install
}
