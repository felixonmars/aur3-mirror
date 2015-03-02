# Contributor: Rene Rasmussen <madeye@paranoidix.dk>
#              PKGBUILD adapted from brother-dcpj315w by jneight

pkgname=brother-dcpj925dw
pkgver=3.0.1
pkgrel=1
pkgdesc="Brother cups and lpd driver for DCP-J925DW"
url="http://solutions.brother.com/linux/en_us/index.html"
license=('custom:Brother Industries')
depends=('cups' 'a2ps')
depends_x86_64=('lib32-gcc-libs')
makedepends=('rpmextract')
install=brother-dcpj925dw.install
arch=('i686' 'x86_64')

md5sums=('d429fb9b1faa4e895d8af8045e83cb80'
	 '9481020a4aa0cbde915cd52d0b0201fe'
)

source=("http://www.brother.com/pub/bsc/linux/dlf/dcpj925dwcupswrapper-3.0.0-1.i386.rpm" 
	"http://www.brother.com/pub/bsc/linux/dlf/dcpj925dwlpr-$pkgver-$pkgrel.i386.rpm" 
)

build() {
 cd "$srcdir"
}

post_install() {
	/opt/brother/Printers/dcpj925dw/cupswrapper/cupswrapperdcpj925dw
}

package() { 
	install -d $pkgdir/usr/bin
	  install -d $pkgdir/var/spool/lpd
	install -Dm755 "$srcdir"/usr/bin/brprintconf_dcpj925dw "$pkgdir"/usr/bin/
	  cp -R $srcdir/opt $pkgdir/opt
}


