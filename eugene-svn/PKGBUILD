# Contributor: Max Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=eugene-svn
pkgver=3031
pkgrel=2
pkgdesc="Eugene is a basic (fast, parallel) Genetic Algorithm implementation in C++"
arch=('i686' 'x86_64')
url="http://dev.drobilla.net/browser/trunk/eugene"
license=('GPL')
depends=('flowcanvas>=0.5.1' 'glibmm>=2.14.0' 'gtkmm>=2.10.0' 'libglademm>=2.6.0' 'libgnomecanvasmm>=2.6.0' 'boost' 'python2')
makedepends=('subversion')
install=eugene.install

_svnmod="eugene"
_svntrunk="http://svn.drobilla.net/lad/trunk"

build() {
 cd "$srcdir"
 msg "Connecting to SVN server..."
 msg "Checking out $_svnmod"
 svn co "$_svntrunk" "$_svnmod"
 msg "SVN checkout done or server timeout"

 msg "Starting build..."
 cd "$srcdir/$_svnmod/${pkgname%-svn}"
 python2 ./waf configure --prefix=/usr
 python2 ./waf
}

package() {
 cd "$srcdir/$_svnmod/${pkgname%-svn}"
 DESTDIR="$pkgdir" python2 ./waf install
}
