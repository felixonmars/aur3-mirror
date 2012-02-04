# Contributor: Vamp898 <vamp898@web.de>
pkgname=libassa
pkgver=3.5.0
pkgrel=2
pkgdesc="libASSA is an object-oriented C++ networking library based on Adaptive Communication Patterns"
arch=( 'i686' 'x86_64' )
url="http://libassa.sourceforge.net"
license=('GPL')
depends=()
install=assa.install
source=( http://mesh.dl.sourceforge.net/sourceforge/libassa/libassa-3.5.0.tar.gz )
md5sums=('9b61dfd94bf4e083829ffb0231243d8b')


build() {

       cd $srcdir/libassa-3.5.0
       ./configure --prefix=/usr || return 1
       make || return 1
       make DESTDIR=$pkgdir install || return 1
       
}
