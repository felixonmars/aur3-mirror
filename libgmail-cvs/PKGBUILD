# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Adam Brightmore <sinister.ray@gmail.com>
pkgname=libgmail-cvs
pkgver=20110628
pkgrel=1
pkgdesc="Library to provide access to Gmail via Python."
arch=('i686' 'x86_64' 'ppc')
url="http://libgmail.sourceforge.net/"
license=('GPL')
groups=('lib')
depends=('python-mechanize')
makedepends=('cvs')
provides=('libgmail-modified' 'libgmail')
conflicts=('libgmail-modified' 'libgmail')

_cvsroot="d:pserver:anonymous@libgmail.cvs.sourceforge.net:/cvsroot/libgmail"
_cvsmod="libgmail"

build() {
  cd "$srcdir"

  cvs -"$_cvsroot" co -P "$_cvsmod"

  mkdir -p "$pkgdir/usr"
  cd libgmail

  python2 setup.py build
  python2 setup.py install --prefix "$pkgdir/usr"
}
