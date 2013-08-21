# Maintainer: madmack < ali@devasque.com > (up to 4.6)
# Maintainer: Andre Ericson < de.ericson@gmail.com > (4.6+)

pkgname=asix-dkms
pkgver=v4.11.0
pkgrel=1
pkgdesc="Driver for USB ASIX Ethernet models AX88772C 772B 772A 760 772 178"
arch=('i686' 'x86_64')
url="http://www.asix.com.tw/"
license=('GPL')
depends=('dkms' 'linux-headers')
provides=('asix-dkms' 'asix-module')
conflicts=("asix-module")
install=${pkgname}.install
options=(!strip)
_pkgname="AX88772C_772B_772A_760_772_178_LINUX_Driver"
_pkgname2="Source"
source=("http://www.asix.com.tw/FrootAttach/driver/${_pkgname}_${pkgver}_${_pkgname2}.tar.bz2"
        "dkms.conf"
		"blacklist-asix.conf"
		"asix-dkms.conf"
		"asix-dkms.install" )
		
md5sums=('81916e436f15c55a7576a27f8e3db7be'
		 '88bf691b136660af111240a625572e92'
		 'cf5fd1c10a1fcfb47554e801dfbf785b'
		 'bf71fda856d9d37b01313e681670540a'
		 '7ae52067d96de48e51ad206f62b7a2ee')

package() {
	
	installDir="$pkgdir/usr/src/$pkgname-$pkgver"
	
	install -dm755 "$installDir"
	install -m644 "$srcdir/dkms.conf" "$installDir"
	install -dm755 "$pkgdir/etc/modprobe.d"
	install -dm755 "$pkgdir/etc/modules-load.d"
	install -m644 "$srcdir/asix-dkms.conf" "$pkgdir/etc/modules-load.d/asix-dkms.conf"
	install -m644 "$srcdir/blacklist-asix.conf" "$pkgdir/etc/modprobe.d/blacklist-asix.conf"
 	
 	cd "${srcdir}/${_pkgname}_${pkgver}_${_pkgname2}/"
 	
 	for d in `find . -type d`
 	do
		install -dm755  "$installDir/$d"
	done
	
	for f in `find . -type f`
	do
		install -m644 "${srcdir}/${_pkgname}_${pkgver}_${_pkgname2}/$f" "$installDir/$f"
	done
	
}


