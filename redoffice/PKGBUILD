# Contributor: Figo.zhang <figo1802@gmail.com>

pkgname=redoffice
pkgver=5.0
pkgrel=2
pkgdesc="Redoffice Office suite (Chinese verison)"
arch=('i686')
url="http://www.redoffice.com"
license=('GPL')
depends=()
source=(http://202.10.79.86/RO50ForLinBeta.tar.gz)
md5sums=('8b3e6f2cee7d039164ca6864ff3c2912')
conflicts=()
install=redoffice.install

build() {
	cd ${startdir}/src/zh-CN/RO/RedOffice/
	mkdir -p ${pkgdir}/opt;
	for i in *;do ar -xv $i ;tar -xvf data.tar.gz;done;
	#ar -xv desktop-integration/*.deb;
      #tar -xvf data.tar.gz; 
	mv -v {opt/,usr/} ${pkgdir}/ ;
	ln -s /opt/redoffice5.0/program/soffice.bin ${pkgdir}/opt/redoffice5.0/program/redoffice.bin

	cd ${pkgdir}/opt/redoffice5.0/share/xdg/
        for i in *.desktop; do 
        sed -i "s/Categories=RedOffice/Categories=Office/g" $i; done;

	rm ${pkgdir}/usr/share/applications/redoffice5.0-uninstall.desktop
      rm ${pkgdir}/usr/share/applications/redoffice5.0-update.desktop
}

