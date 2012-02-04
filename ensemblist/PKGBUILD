#contributor: Jacek Poplawski <jacekpoplawski@gmail.com> 

pkgname=ensemblist
pkgver=040126
pkgrel=2
arch=('i686')
license=('GPL')
pkgdesc="Construction solid geometry game"
url="http://www.nongnu.org/ensemblist/index_en.html"
depends=('freeglut' 'libpng' 'libmikmod' 'libxmu')
source=(http://download.savannah.nongnu.org/releases/ensemblist/ensemblist-040126.tar.gz)
md5sums=('67f42488b7b502bb5f4840ad130bcd72')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make
	install -d ${pkgdir}/usr/{bin,share/${pkgname}}
	cp -R ${srcdir}/${pkgname}-${pkgver}/datas/* ${pkgdir}/usr/share/${pkgname}
	install ${srcdir}/${pkgname}-${pkgver}/${pkgname} ${pkgdir}/usr/share/${pkgname}
	echo -e "#!/bin/bash\n\ncd /usr/share/ensemblist\n./ensemblist" >> ${pkgdir}/usr/bin/ensemblist
	chmod 755 ${pkgdir}/usr/bin/ensemblist
}


