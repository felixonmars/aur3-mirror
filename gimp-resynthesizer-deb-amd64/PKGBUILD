#Contributor: santodelaespada <sebastianbenvenuti@gmail.com>
pkgname=gimp-resynthesizer-deb-amd64
pkgver=0.16
pkgrel=1
pkgdesc="Resynthesizer plugin for The Gimp. From debian sources. With 'Heal selection' fix."
arch=('x86_64')
license=("GPL2")
url="http://www.logarithmic.net/pfh/resynthesizer"
depends=('gimp')
makedepends=('deb2targz' 'tar')
source=("http://http.us.debian.org/debian/pool/main/g/gimp-resynthesizer/gimp-resynthesizer_$pkgver-1.1_amd64.deb"
	"http://registry.gimp.org/files/smart-remove.scm")

md5sums=('0c348dbb8dfdaa8b59e38e1f2c280cb9'
	 '92aa7e9ac6b2bda43ac4c14346345296')

build() {
	cd ${srcdir}
	deb2targz gimp-resynthesizer_$pkgver-1.1_amd64.deb
	tar axf gimp-resynthesizer_0.16-1.1_amd64.tar.gz
	mv usr ${pkgdir} || return 1
	install -m 644 smart-remove.scm "${pkgdir}/usr/share/gimp/2.0/scripts" # fix
}
