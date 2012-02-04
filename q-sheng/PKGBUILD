#Contributor:figo.zhang <figo1802@gmail.com>

pkgname=q-sheng
pkgver=1.51
pkgrel=1
pkgdesc="q-sheng stock software in China"
arch=('i686')
url="http://www.q-sheng.com"
license=('custom')
makedepends=()
depends=()
conflicts=()
provides=('')

source=(http://www.q-sheng.com/product/q-sheng_x86.tar.gz)
md5sums=(7af5b8129d5563d79641bfd563d53c87)



build() {
	cd $srcdir
	mkdir -p ${startdir}/pkg/opt/QSheng-stock;
	cp -R $srcdir/Q-Sheng_x86/* ${startdir}/pkg/opt/QSheng-stock ;
	chmod 777 -R ${startdir}/pkg/opt/QSheng-stock/;

	mkdir -p $pkgdir/usr/share/applications
echo "[Desktop Entry]
Type=Application
Version=1.0.1
Name=QShengStock
Name[zh_CN]=È«Ê¤¹ÉÆ±Èí¼þ
Comment=QShengStock
Icon=/opt/QSheng-stock/Launcher.png
Exec=/opt/QSheng-stock/Launcher
Categories=Application;Network;
Terminal=false
Path=/opt/QSheng-stock" > $pkgdir/usr/share/applications/QSheng-stock.desktop
  chmod 755 $pkgdir/usr/share/applications/QSheng-stock.desktop


        

}

