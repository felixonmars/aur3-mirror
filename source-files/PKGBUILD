# Contributor: Prurigro
# Maintainer: Prurigro
pkgname=utorrent-server-userscript
_pkgname=utorrent-server
pkgver=3.0
pkgrev=25053
pkgrel=1
pkgdesc="A script for users to control uTorrent Server"
url="http://aur.archlinux.org/packages.php?SeB=m&K=prurigro"
license="GPL"
depends=(bash openssl-compatibility zlib)
source=(utorrent
		http://download.utorrent.com/linux/$_pkgname-$pkgver-$pkgrev.tar.gz)
md5sums=('0e21461f3f3451cf7be06c8738823303'
		'49f6376e9df19f773763180464367c2c')
arch=('i686')

build() {
	install -d "$pkgdir"/usr/bin || return 1
	install -D -m755 "$srcdir"/utorrent "$pkgdir"/usr/bin/ || return 1
	
	install -d "$pkgdir"/opt/$_pkgname/docs || return 1
	pushd "$srcdir"/$_pkgname-v3_0 || return 1
		find . -type f -exec install -D '{}' "$pkgdir"/opt/$_pkgname/'{}' \; || return 1
	popd || return 1
}
