# Maintainer: Nicolas Pouillard <nicolas.pouillard@gmail.com>

pkgname=lighty-stats
pkgver=0.3.6
pkgrel=1
pkgdesc='a lighttpd (and general httpd) logfile analyzer written in perl'
license=('custom')
arch=('i686' 'x86_64')
url="https://derf.homelinux.org/~derf/projects/lighty-stats/"
depends=('perl')
makedepends=()
source=("https://derf.homelinux.org/~derf/projects/lighty-stats/$pkgname-$pkgver.tar.bz2")
md5sums=('693b9d836f8341b23febf24d31d9db4f')

build() {
        . /etc/profile
	cd $srcdir/$pkgname-$pkgver
	make || return 1
	make prefix=$pkgdir/usr install || return 1
}
