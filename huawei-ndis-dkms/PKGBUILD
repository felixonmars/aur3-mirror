# Maintainer: Oleg Rakhmanov < orakhmanov [at] gmail [dot] com >

pkgname=huawei-ndis-dkms
pkgver=v2.07.00.00
pkgrel=1
pkgdesc="NDIS Mode driver for Huawei cellular data cards"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="http://www.realtek.com.tw/"
license=('GPL')
depends=('dkms' 'linux-headers')
conflicts=()
install=${pkgname}.install
options=(!strip)
_pkgname="hw_cdc_driver"
source=("https://dl.dropboxusercontent.com/u/15043728/ArchLinuxArm/huawei_ndis/ndis_src.tar.xz"
		"dkms.conf")
		
md5sums=('7865f9738a46124156a5579cc26ec086'
         '46d7caa9edf32007cb8a062534f03bbd')

package() {
	
	installDir="$pkgdir/usr/src/${_pkgname}-${pkgver}"
	
	install -dm755 "$installDir"
	install -m644 "$srcdir/dkms.conf" "$installDir"

 	cd "${srcdir}/ndis_src/"

 	for d in `find . -type d`
 	do
		install -dm755  "$installDir/$d"
	done
	
	for f in `find . -type f`
	do
		install -m644 "${srcdir}/ndis_src/$f" "$installDir/$f"
	done
}
