# Maintainer: madmack <ali@devasque.com> (up to 4.6)
# Maintainer: Andre Ericson <de.ericson@gmail.com>  (4.6+)

_pkgbase=asix
pkgname=asix-dkms
pkgver=v4.14.0
pkgrel=2
pkgdesc="Driver for USB ASIX Ethernet models AX88772C 772B 772A 760 772 178"
arch=('i686' 'x86_64')
url="http://www.asix.com.tw/"
license=('GPL')
depends=('dkms')
provides=('asix-dkms' 'asix-module')
conflicts=("asix-module")
install=${pkgname}.install
options=(!strip)
_pkgname="AX88772C_772B_772A_760_772_178_LINUX_DRIVER"
_pkgname2="Source"

source=("http://www.asix.com.tw/FrootAttach/driver/${_pkgname}_${pkgver}_${_pkgname2}.tar.bz2"
        "dkms.conf"
        "asix-dkms.install"
        "time_date_errors.patch")
		
md5sums=('8fdd212a09196629878491622e19af25'
         'fc33b5dd739e8964a346525a1434143e'
         '811163b44999fd08359e8bf77a705480'
         'e0682b1f89edfc5e29ca0b9bac220446')

package() {
	
	installDir="$pkgdir/usr/src/${_pkgbase}-${pkgver}"
	
	install -dm755 "$installDir"
	install -m644 "$srcdir/dkms.conf" "$installDir"
	install -dm755 "$pkgdir/etc/modprobe.d"
	install -dm755 "$pkgdir/etc/modules-load.d"

        sed -e "s/@_PKGBASE@/${_pkgbase}/" \
            -e "s/@PKGVER@/${pkgver}/" \
            -i $installDir/dkms.conf

 	cd "${srcdir}/${_pkgname}_${pkgver}_${_pkgname2}/"
 	
        patch -p1 -i $srcdir/time_date_errors.patch

 	for d in `find . -type d`
 	do
		install -dm755  "$installDir/$d"
	done
	
	for f in `find . -type f`
	do
		install -m644 "${srcdir}/${_pkgname}_${pkgver}_${_pkgname2}/$f" "$installDir/$f"
	done
}


