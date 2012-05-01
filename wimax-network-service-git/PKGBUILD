# Maintainer: Ivan Shapovalov <intelfx100 at gmail dot com>
pkgname=wimax-network-service-git
pkgver=20120501
pkgrel=1
pkgdesc="WiMAX Network Service - unofficial GIT repository"
arch=('i686' 'x86_64')
url="http://lists.linuxwimax.org/pipermail/wimax"
license=('custom')
depends=('libnl' 'libeap' 'wimax-tools' 'dhclient')
conflicts=('wimax-network-service')
provides=('wimax-network-service')
optdepends=('i2400m-firmware: for working with new intel 6x50 cards'
            'kernel26>=2.6.35: any kernel newer than 2.6.35 is required')
source=('dhcp-renew.patch'
        'wimaxd.rc')

_gitroot='git://people.freedesktop.org/~dcbw/wimax'
_gitname='wimax'

build() {
	cd "${srcdir}"
	msg "Connecting to GIT server..."

	if [[ -d "$_gitname" ]]; then
		cd "$_gitname" && git pull origin
		msg "The local files are updated."
	else
		git clone --depth=1 "$_gitroot" "$_gitname"
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting build..."

	cd "${srcdir}"
	cp -rfuT "$_gitname" "$_gitname-build"
	cd "$_gitname-build"
	./configure --sysconfdir=/etc --localstatedir=/var --mandir=/usr/share/man --prefix=/usr
	make
}

package() {
	cd "${srcdir}/$_gitname-build"
	make DESTDIR=${pkgdir} install
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	rm -Rf ${pkgdir}/etc/init.d
	cd ${pkgdir}
	patch -Np0 < ${srcdir}/dhcp-renew.patch
	mkdir -p ${pkgdir}/etc/rc.d
	cp ${startdir}/wimaxd.rc ${pkgdir}/etc/rc.d/wimaxd
	chmod +x ${pkgdir}/etc/rc.d/wimaxd
}
md5sums=('ff5e6d2277a5d2f4f60f0b3b3afaeb38'
         '99464624d412261e48d26c514cb9b059')
