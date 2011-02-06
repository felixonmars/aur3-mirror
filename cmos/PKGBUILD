pkgname=cmos
pkgver=1
pkgrel=1
pkgdesc="Utility for controlling a Sun Cobalt CMOS"
arch=(
	'i686'
)
url='http://gentoo.404ster.com/'
license=GPL
depends=()
source=(
	"ftp://gentoo.404ster.com/pub/gentoo-stuff/raq/tools/$pkgname"
)
noextract=(
	'cmos'
)
md5sums=(
	'bea4ad1431060a540ff7fa4991a09ec0'
)
options=(!strip)

build() {
	mkdir -p $startdir/pkg/sbin
	install -m750 $startdir/src/cmos $startdir/pkg/sbin/cmos
}
