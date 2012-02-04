#Contributor:figo.zhang <figo1802@gmail.com>

pkgname=umfg
pkgver=1.0.1
pkgrel=1
pkgdesc="ipmsg in China"
arch=('i686')
url="http://www.ipmsg.org.cn/"
license=('custom')
makedepends=()
depends=('qt' 'libjpeg')
conflicts=()
provides=('')

source=(http://www.ipmsg.org.cn/linux/UMFG_Linux_NeedQT.tar.gz umfg.png)
md5sums=(2ee5d520969142027648b6a5a6981ff6
         469671e977618b8598b05c2b07091661)



build() {
	cd $srcdir
	mkdir -p ${startdir}/pkg/opt/UMFG;
	cp -R $srcdir/QIpmsg ${startdir}/pkg/opt/UMFG ;

	mkdir -p $pkgdir/usr/share/umfg
	install -m 644 $srcdir/umfg.png $pkgdir/usr/share/umfg/

	chmod 777 -R ${startdir}/pkg/opt/UMFG/;

	mkdir -p $pkgdir/usr/share/applications
echo "[Desktop Entry]
Type=Application
Version=1.0.1
Name=UM IpMSG
Name[zh_CN]=·É¸ë´«Êé
Comment=UM IpMSG
Icon=/usr/share/umfg/umfg.png
Exec=/opt/UMFG/QIpmsg
Categories=Application;Network;
Terminal=false
Path=/opt/QSheng-stock" > $pkgdir/usr/share/applications/UMFG_linux.desktop
  chmod 755 $pkgdir/usr/share/applications/UMFG_linux.desktop


        

}

