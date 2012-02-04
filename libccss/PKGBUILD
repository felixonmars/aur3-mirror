pkgname=libccss
_pkgname=ccss
pkgver=0.5.0
pkgrel=1
pkgdesc="CSS reading library"
arch=('i686' 'x86_64')
url="http://www.moblin.org"
license=('GPL')
depends=('cairo>=1.4' 'libtool' 'libsoup' 'librsvg')
makedepends=('gtk-doc')
provides=($pkgname)
conflicts=($pkgname)
groups=('moblin-git')
md5sums=('468ffcbbdf738a1896f2d77610375124')
source=(https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}.orig.tar.gz)

build() {
  cd $startdir/src
  
    cd ${_pkgname}-${pkgver}/
    ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var || return 1
    make || return 1
    make DESTDIR=$pkgdir install || return 1
}