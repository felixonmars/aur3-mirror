# Maintainer: Alex Peltzer <alex dot peltzer at gmail dot com>

pkgname=soapdenovo2
pkgver=240
pkgrel=1
pkgdesc="A novel short-read assembly method that can build a de novo draft assembly for the human-sized genomes. This is version 2 of the tool."
arch=("i686" "x86_64")
url="http://soap.genomics.org.cn/soapdenovo.html"
license=("GPL3")
depends=()
source=("http://downloads.sourceforge.net/project/soapdenovo2/SOAPdenovo2/bin/r240/SOAPdenovo2-bin-LINUX-generic-r240.tgz")
md5sums=("d5ffea0b8d436d3de049664ebe4e3b7e")

package() {
	mkdir -p ${pkgdir}/usr/bin
        cd ${srcdir}/SOAPdenovo2-bin-LINUX-generic-r${pkgver}
	install -Dm755 SOAPdenovo-127mer ${pkgdir}/usr/bin/SOAPdenovo-127mer
	install -Dm755 SOAPdenovo-63mer ${pkgdir}/usr/bin/SOAPdenovo-63mer
	install -Dm644 MANUAL ${pkgdir}/usr/share/SOAPdenovo/MANUAL 
}


