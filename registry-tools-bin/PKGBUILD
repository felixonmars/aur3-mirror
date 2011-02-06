# Contributer Jonathan Wiersma <arch aur at jonw dot org>

pkgname=registry-tools-bin
pkgver=4.0.0_alpha4_20080727
_pkghash32=17624848
_pkghash64=17624811
_pkgrel_ubuntu=1ubuntu1
_urlstart="http://launchpadlibrarian.net/"
_urlmid="${pkgname%-bin}_${pkgver//_/%7E}-${_pkgrel_ubuntu}"
pkgrel=1
pkgdesc="Tools for viewing and manipulating a Windows registry"
arch=('i686' 'x86_64')
url="https://launchpad.net/ubuntu/intrepid/+package/registry-tools"
license=("GPL3")
depends=('gnutls>2.4' 'ncurses>5.6' 'pam>=1.0' 'readline>=5.2')
makedepends=('binutils')
conflicts=("samba>=4")
install=registry-tools.install
_debname="$pkgname-${pkgver}_$_pkgrel_ubuntu.deb"
source=("$_debname::$_urlstart/$_pkghash32/${_urlmid}_i386.deb")
md5sums=('61a6ede23f583259e25c6c46fbad2511')
if [ "$CARCH" == "x86_64" ]; then
	source=("$_debname::$_urlstart/$_pkghash64/${_urlmid}_amd64.deb")
	md5sums=('d9c9a6c12aa6b2d85bf6416b2fad875f')
fi

build() {
	cd $srcdir || return 1
	
	ar x $_debname || return 1
	tar zxf data.tar.gz || return 1
	
	install -dm755 $pkgdir/usr/share/man/man1/ || return 1
	find usr/share/man/ -type f -exec install -Dm644 {} \
		$pkgdir/{} \; || return 1
	
	install -dm755 $pkgdir/usr/bin/ || return 1
	find usr/bin/ -type f -exec install -Dm755 {} \
		$pkgdir/{} \; || return 1
}
