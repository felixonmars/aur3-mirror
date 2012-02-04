pkgname=carletonvpn-linux
pkgver=4.0.5
pkgrel=3
pkgdesc="Client to access the Carleton University VPN"
arch=(i686 x86_64)
_kernver=`uname -r`
url='http://www6.carleton.ca/ccs/all-services/wireless-and-internet/vpn/'
source=(CarletonVPN-linux.patch
	vpnclient_init.patch)
md5sums=('b1a2596ec87e940323c552ad2eb093f7'
	'db853b84f0c01ed776ac0044ca5d06ce')
license=("custom")
install=CarletonVPN-linux.install
if [ "`uname -m`" = "i686" ]; then
   depends=('linux>=3')
else
   depends=('linux>=3' 'lib32-gcc-libs')
fi
makedepends=('linux-headers>=3' 'lynx')

build() {
	if [ ! -f "$startdir"/CarletonVPN-linux-$pkgver.tar.gz ]; then
		msg2 "Press return, then use your Carleton credentials to download the Carleton VPN client"
		read wait
		lynx https://www4.carleton.ca/vpn/index.cgi
		if [ ! -f CarletonVPN-linux-$pkgver.tar.gz ]; then
			msg2 "CarletonVPN-linux-$pkgver.tar.gz wasn't downloaded, exiting"
			return 1
		fi
	else
		ln -s "$startdir"/CarletonVPN-linux-$pkgver.tar.gz .
	fi
	tar zxvf CarletonVPN-linux-$pkgver.tar.gz -C "$srcdir/"
	pushd "$srcdir/vpnclient"
	msg2 "Applying patches..."
	patch <../CarletonVPN-linux.patch
	patch <../vpnclient_init.patch

	msg2 "Building..."
	KBUILD_NOPEDANTIC=1 make
	popd
}

package() {
	cd "$srcdir/vpnclient"

	msg2 "Installing files and creating symlinks..."
	install -d -m755 "$pkgdir/usr/bin"
	install -D -m755 vpnclient cvpnd ipseclog cisco_cert_mgr "$pkgdir/usr/bin/"
	install -D -m755 libvpnapi.so "$pkgdir/usr/lib/libvpnapi.so"
	install -D -m644 vpnapi.h "$pkgdir/usr/include/vpnapi.h"
	install -D -m644 vpnclient.ini "$pkgdir/usr/vpnclient.ini"	
	install -D -m644 sample.pcf "$pkgdir/etc/opt/cisco-vpnclient/Profiles/sample.pcf"
	install -D -m644 CarletonVPN.pcf "$pkgdir/etc/opt/cisco-vpnclient/Profiles/CarletonVPN.pcf"
	install -d -m755 "$pkgdir/etc/opt/cisco-vpnclient/Certificates"
	install -D -m644 cisco_ipsec.ko "$pkgdir/lib/modules/$_kernver/CiscoVPN/cisco_ipsec.ko"
	install -D -m644 license.txt "$pkgdir/usr/share/licenses/vpnclient/license.txt"
	install -d -m755 "$pkgdir/usr/bin"
	install -d -m755 "$pkgdir/etc/rc.d"
	install -D -m755 vpnclient_init "$pkgdir/etc/rc.d/vpnclient_init"
	
	msg2 "Updating install file..."
	sed -i -e "s/KERNEL_VERSION=.*/KERNEL_VERSION=$_kernver/" "$startdir/CarletonVPN-linux.install"
}
