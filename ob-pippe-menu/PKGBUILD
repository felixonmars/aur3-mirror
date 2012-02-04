pkgname=ob-pippe-menu
pkgver=0.7.3
pkgrel=1
pkgdesc="Openbox pippe menu for XDG system menu"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://downloads.sourceforge.net/project/staybox"
groups=()
depends=('gtk2' 'glibc' 'gnome-menus')
makedepends=('pkgconfig')

source=(${url}/apps/ob_pippe_menu-${pkgver}.tar.gz)

build() {
    cd ${srcdir}/ob_pippe_menu-${pkgver}
    ./configure --sysconfdir=/etc --prefix=/usr || return 1
    make || return 1
    make DESTDIR=${pkgdir} install || return 1
}
md5sums=('30a0d36e02885f0e1a8f8393078b15a6')
