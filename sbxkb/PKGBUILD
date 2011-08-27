pkgname=sbxkb
pkgver=0.7.6
pkgrel=1
pkgdesc="Simple tray XKB indicator"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://downloads.sourceforge.net/project/staybox"
groups=()
depends=('gtk2' 'glibc')
makedepends=('pkgconfig')

source=(http://downloads.sourceforge.net/project/staybox/${pkgname}-${pkgver}.tar.gz)
#source=(${pkgname}-${pkgver}.tar.gz)

build() {
cd ${srcdir}/${pkgname}-${pkgver}
./configure --sysconfdir=/etc --prefix=/usr || return 1
make || return 1
make DESTDIR=${pkgdir} install || return 1
}
md5sums=('25dc697817a2952a4468c5d2a2f206d2')

