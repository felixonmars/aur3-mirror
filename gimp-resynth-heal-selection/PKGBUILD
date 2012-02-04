pkgname=gimp-resynth-heal-selection
pkgver=0.16
pkgrel=4
pkgdesc="Resynthesizer plugin for The Gimp. With 'Heal selection' fix."
arch=('i686' 'x86_64')
license=("GPL2")
url="http://www.logarithmic.net/pfh/resynthesizer"
depends=('gimp')
provides=('gimp-resynth')
conflicts=('gimp-resynth')
source=("http://www.logarithmic.net/pfh-files/resynthesizer/resynthesizer-$pkgver.tar.gz"
	"http://registry.gimp.org/files/smart-remove.scm")

md5sums=('097b3a21803fe02e47b8b8649af48144'
	 '92aa7e9ac6b2bda43ac4c14346345296')

build() {
	cd "${srcdir}/resynthesizer-${pkgver}/"
	make || return 1
	
	install -d "${pkgdir}"/usr/{lib/gimp/2.0/plug-ins,share/gimp/2.0/scripts}
	install -m 755 resynth "${pkgdir}/usr/lib/gimp/2.0/plug-ins"
	#install -m 644 smart-remove.scm "${pkgdir}/usr/share/gimp/2.0/scripts" # old
	install -m 644 ../smart-remove.scm "${pkgdir}/usr/share/gimp/2.0/scripts" # fix
	install -m 644 smart-enlarge.scm "${pkgdir}/usr/share/gimp/2.0/scripts"
}
