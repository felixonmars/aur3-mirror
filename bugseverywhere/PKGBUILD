# Maintainer: Alfredo Palhares <masterkorp@masterkorp.net>
pkgname=bugseverywhere
pkgver=1.1.1
pkgrel=1
pkgdesc="A distributed bugtracker"
arch=('any')
url="http://bugseverywhere.org/"
license=('GPL')
depends=('python2' 'python2-yaml')
makedepends=('python2-sphinx' 'python2-numpydoc')
optdepends=('cherrypy: web interface')
provides=('bugseverywhere')
conflicts=('bugseverywhere-git' 'bugseverywhere-bzr')
backup=()
options=(!emptydirs)
install=
source=(http://download.bugseverywhere.org/releases/be-$pkgver.tar.gz)
noextract=()
md5sums=('21b2136be285390f80cca68ef24753ca')


build() {
  cd "$srcdir/be-$pkgver"

  python2 setup.py install --root=$pkgdir/ --optimize=1

  # Build html documentation
  sed -i 's/python /python2 /' doc/Makefile
  sed -i 's/sphinx-build/sphinx-build2/' doc/Makefile
  make sphinx

  install -d $pkgdir/usr/share/doc/bugseverywhere
  cp -r doc/.build/html/* $pkgdir/usr/share/doc/bugseverywhere/

}

# vim:set ts=2 sw=2 et:
