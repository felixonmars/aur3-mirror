# Maintainer: Kozec <kozec at kozec dot com>
pkgname=realvnc
pkgver=5.2.3
pkgrel=1
_magic_x64=1720
_magic_x86=1719
pkgdesc="RealVNC provides remote control software which lets you see and interact with desktop applications across any network."
arch=(i686 x86_64)
url="http://www.realvnc.com"
license=('custom')
install="realvnc.install"
conflicts=('vnc' 'tightvnc' 'tigervnc' 'xf4vnc-xvnc')
provides=("vnc=$pkgver")
if [ $CARCH == x86_64 ] ; then
	_arch=x64
	source=(install.diff vncinitconfig.diff "VNC-${pkgver}-Linux-x64-ANY.tar.gz::http://www.realvnc.com/download/binary/${_magic_x64}")
	md5sums=('c937757edcaab531dde303197648f3c2'
			 '2913cfe17ca9f9a7e8c4c53f8a6ea28b'
			 'aa7e06c8fc4a962ce82f3c7d66c49503')
else
	_arch=x86
	source=(install.diff vncinitconfig.diff "VNC-${pkgver}-Linux-x86-ANY.tar.gz::http://www.realvnc.com/download/binary/${_magic_x86}")
	md5sums=('c937757edcaab531dde303197648f3c2'
			 '2913cfe17ca9f9a7e8c4c53f8a6ea28b'
			 'cd023074a17bd8bcc324ed8af8259fcf')
fi
noextract=()

build() {
	cd "$srcdir/VNC-${pkgver}-Linux-${_arch}"
	cp "vncinstall" "vncinstall.arch"
	chmod +w "vncinstall.arch"
	msg "install.diff"
	patch -Np0 -i "$srcdir/install.diff" vncinstall.arch || return 1

	cp "vncinitconfig" "vncinitconfig.arch"
	chmod +w "vncinitconfig.arch"
	msg "vncinitconfig.diff"
	patch -Np0 -i "$srcdir/vncinitconfig.diff" vncinitconfig.arch || return 1
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/man/man1"
	mkdir -p "$pkgdir/usr/share/cups"
	mkdir -p "$pkgdir/etc/vnc"
	cd "$srcdir/VNC-${pkgver}-Linux-${_arch}"
	./vncinstall.arch "$pkgdir"
	./vncinitconfig.arch "$pkgdir" -config
	rm "$pkgdir/etc/vnc/get_primary_ip4"
	rm "$pkgdir/etc/vnc/vncelevate"
	ln -s /usr/lib/vnc/get_primary_ip4 "$pkgdir/etc/vnc/get_primary_ip4"
	ln -s /usr/lib/vnc/vncelevate "$pkgdir/etc/vnc/vncelevate"
}

