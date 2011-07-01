pkgname=pygccxml-svn
pkgver=1854
pkgrel=1
pkgdesc="The purpose of pygccxml is to read a generated file and provide a simple framework to navigate C++ declarations, using Python classes."
arch=('i686' 'x86_64')
url="http://www.language-binding.net/pygccxml/pygccxml.html"
depends=('gccxml-cvs' 'python2')
makedepends=('subversion')
provides=('pygccxml')
conflicts=('pygccxml')
license=('custom')

_svntrunk="http://pygccxml.svn.sourceforge.net/svnroot/pygccxml/pygccxml_dev"
_svnmod="pygccxml"

build() {
  cd "$srcdir"
  mkdir -p root
  msg "Connecting to pygccxml SVN server......."
  svn co "$_svntrunk" "$_svnmod"
  msg "Starting make..."
  cd "$_svnmod"
  python2 setup.py install --prefix=../root/
}

package() {
  cp -r "$srcdir"/root/ "$pkgdir"/usr/
}