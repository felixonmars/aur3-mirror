# Maintainer: Enrico Carlesso <enrico (at) ecarlesso (dot) org>
pkgname=buzzbird
pkgver=0.9.1
pkgrel=1
pkgdesc="A XULRunner based Twitter client"
arch=('i686')
license=('Custom')
depends=('alsa-lib' 'nss' 'libxt' 'libgnome')
url="http://getbuzzbird.com/bb/"
source=(http://cloud.github.com/downloads/mdesjardins/${pkgname}/${pkgname}-linux-${pkgver}.tar.bz2 LICENSE.txt)
md5sums=('feb9626288e298c70542180afdb64d7c' '3db51fe40e8846e71ca94169286e6bc9')

build() {
	mkdir -p $pkgdir/opt
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/licenses/$pkgname
	cp LICENSE.txt  $pkgdir/usr/share/licenses/buzzbird/
	cp -r $srcdir/$pkgname-${pkgver/.1/} $pkgdir/opt/$pkgname
	ln -s /opt/$pkgname/$pkgname $pkgdir/usr/bin/$pkgname
}
