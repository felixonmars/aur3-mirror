# Contributor: totoloco <totoloco at ushcompu dot com dot ar>

_pkgname=googlecl
pkgname=googlecl-svn
pkgver=636
pkgrel=1
pkgdesc="Command line tools for the Google Data APIs"
arch=('any')
url="http://code.google.com/p/googlecl/"
license=('APACHE')
depends=('python2-gdata')
makedepends=('subversion')
provides=('googlecl')
conflicts=('googlecl')
source=("$_pkgname::svn+http://googlecl.googlecode.com/svn/trunk/")
md5sums=('SKIP')


pkgver() {
  cd $SRCDEST/$_pkgname
  svnversion | tr -d [A-z]
}

package() {
  cd "$srcdir/$_pkgname"
  python2 setup.py install --prefix=/usr --root=$pkgdir
}

# vim:set ts=2 sw=2 et:
