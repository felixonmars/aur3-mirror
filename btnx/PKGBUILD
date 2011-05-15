pkgname=btnx
pkgver=0.4.11
pkgrel=1
pkgdesc="Button Extension- a GNU/GPL mouse tool for GNU/Linux"
arch=(i686 x86_64)
url=("http://ftp.de.debian.org/debian/pool/main/b/btnx/btnx_0.4.11.orig.tar.gz")
license=('GPL')
groups=(daemons)
depends=(btnx-config)
makedepends=(btnx-config)
provides=()
conflicts=()
replaces=()
backup=()
options=('!libtool' '!emptydirs')
install=
source=(btnx_0.4.11.orig.tar.gz)
noextract=()
md5sums=('fe8571e1f1097e5ecd7d728d635a9fa8')
 
build() {
cd $startdir/src/${pkgname}-${pkgver}
init_scripts_path=/etc/rc.d \
init_tool=no \
output_syslog=yes \
./configure --prefix=/usr --sysconfdir=/etc
make || return 1
mkdir -p ${startdir}/pkg/etc/rc.d
install -m 755 ${startdir}/src/btnx-${pkgver}/src/btnx ${startdir}/pkg/etc/rc.d
make DESTDIR="$startdir/pkg" install
} 
 
md5sums=('fe8571e1f1097e5ecd7d728d635a9fa8')
