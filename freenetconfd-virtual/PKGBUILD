# Maintainer: Luka Perkov <luka.perkov@sartura.hr>

pkgname=freenetconfd-virtual
pkgver=1.0
pkgrel=1
pkgdesc='virtual package for freenetconfd - a modular NETCONF server'
url='https://github.com/freenetconf/freenetconfd.git'
arch=('i686' 'x86_64')
license=('GPLv2')
makedepends=('git' 'cmake' 'gcc' 'make' 'pkg-config')
conflicts=(freenetconfd)
provides=(freenetconfd)
md5sums=('SKIP')

package() {
	mkdir -p $pkgdir/usr/include/
	ln -s /opt/dev/freenetconfd/include/freenetconfd/ $pkgdir/usr/include/
}

# burp -c system `ls freenetconfd-virtual-*.src.tar.gz | sort | tail -n 1`
