pkgname=dkms-rpi-rtl8188eu-git
pkgver=0.1
pkgrel=0
pkgdesc='Linux driver for tplink-wn725n nano wireless adapter.'
arch=('any')
url="https://github.com/liwei/rpi-rtl8188eu"
license=('custom')
depends=('dkms' 'linux-headers')
install=${pkgname}.install
options=(!strip)
source=(dkms.conf dkms-rpi-rtl8188eu-git.install)
md5sums=('21aaf0d5a9b34b64ec8bc1ec5eb4fd00'
         'f53d8de336203ef386111eac634c1974')

_pkgname=rpi-rtl8188eu

_gitroot='git://github.com/liwei/rpi-rtl8188eu.git'
_gitname="$_pkgname"

build() {
	cd "$srcdir"

	#rm -rf "$_gitname"
	#msg 'Connecting to GIT server...'
	#git clone --depth=1 "$_gitroot" "$_gitname"
	#msg 'Git checkout done or server timeout'
	rm -rf "$_gitname/.git"
}

package() {
	installdir="$pkgdir/usr/src/$_pkgname-$pkgver"
	install -dm755 "$installdir"
	install -m644 "$srcdir/dkms.conf" "$installdir"
	cp -r "$srcdir/$_gitname/." "$installdir"
}
