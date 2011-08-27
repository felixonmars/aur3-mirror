# Maintainer: Alex Anthony <alex.anthony28991@googlemail.com>

pkgname=libccss-old
_pkgname=libccss
pkgver=0.3.1
pkgrel=1
pkgdesc="CSS reading library"
arch=('i686' 'x86_64')
url="http://www.moblin.org"
license=('GPL')
depends=('cairo>=1.4' 'libtool' 'libsoup' 'librsvg')
makedepends=()
provides=($_pkgname $_pkgname-git)
conflicts=($_pkgname $_pkgname-git)
groups=('moblin-git')
source=(http://gitorious.org/moblin-and-gnome-devel-packaging/moblin-git/blobs/raw/06a584af8aba3fc72167488d1456f8b77fd0174c/ccss/$pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('c13c4dcafbd595e66b47399129f48fa6')

build() {
  cd $srcdir/$_pkgname-$pkgver || return 1
    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var || return 1
    make || return 1
    make DESTDIR=$pkgdir install || return 1

    # Merge gconf schemas in a single file
#    install -d m755 $pkgdir/usr/share/gconf/schemas || return 1
#    gconf-merge-schema $pkgdir/usr/share/gconf/schemas/epiphany.schemas 
#        $pkgdir/etc/gconf/schemas/*.schemas || return 1
#    rm -rf $pkgdir/etc
}
