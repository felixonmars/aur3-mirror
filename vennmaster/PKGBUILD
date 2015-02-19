# Contributor: florianbw <florian.bw@gmail.com>

pkgname=vennmaster
pkgver=0.38.2
pkgrel=1
pkgdesc='A tool for drawing area proportional Venn/Euler diagrams.'
arch=('any')
url='http://www.informatik.uni-ulm.de/ni/staff/HKestler/vennm/doc.html'
license=('CCPL:by-nc')
depends=('java-runtime-common')
source=("https://github.com/sysbio-ulm/VennMaster/releases/download/v0.38.2/VennMaster_${pkgver}.zip"
        'vennmaster.desktop'
        'vennmaster.ico::https://raw.githubusercontent.com/sysbio-bioinf/VennMaster/master/doc/pic/favicon.ico'
        'vennmaster')
md5sums=('5a5813199c176c612236d1a3625e959f'
         '5f15454146d7ac6a8d26e57adddf788d'
         'ec133a33231d5a590bddb4ed63e43f39'
         '631b365fa896355fba90cb066a94cbb6')

package() {
    cd $srcdir
	install -d ${pkgdir}/usr/share/java/vennmaster/
	install -d ${pkgdir}/usr/share/{applications,pixmaps}
	install -d ${pkgdir}/usr/bin

	cp -r VennMaster_${pkgver}/* ${pkgdir}/usr/share/java/vennmaster/
	chmod 755 ${pkgdir}/usr/share/java/vennmaster/venn.sh 
	install -D -m755 vennmaster ${pkgdir}/usr/bin/
	install -D -m644 vennmaster.ico ${pkgdir}/usr/share/pixmaps
	install -D -m644 vennmaster.desktop ${pkgdir}/usr/share/applications
}
