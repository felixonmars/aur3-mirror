# Maintainer: madmack < ali@devasque.com > (up to 4.6)
# Maintainer: Andre Ericson < de.ericson@gmail.com > (4.6+)

_pkgbase=asix
pkgname=asix-dkms
pkgver=v4.13.0
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
_pkgname="AX88772C_772B_772A_760_772_178_LINUX_DRIVER"
_pkgname2="Source"

source=("http://www.asix.com.tw/FrootAttach/driver/${_pkgname}_${pkgver}_${_pkgname2}.tar.bz2"
        "dkms.conf"
		"blacklist-asix.conf"
		"asix-dkms.conf"
		"asix-dkms.install" )
		
md5sums=('438dd2abe58711d98db19e278b841e9a'
         '38d47c8264855ee5e3e67ac4f637c696'
         'cf5fd1c10a1fcfb47554e801dfbf785b'
         'bf71fda856d9d37b01313e681670540a'
         '7db07a479dd17d201e5364435ca0936a')

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


