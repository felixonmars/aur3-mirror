# Maintainer: 謝致邦 <Yeking@Red54.com>

pkgname=yozooffice-bin
pkgver=2013
pkgrel=1
pkgdesc='Yozo(永中, Yongzhong) office 2013 personal with built-in JRE'
arch=('i686' 'x86_64')
url='http://www.yozosoft.com/person/'
depends=('libxtst')
makedepends=('binutils')
license=('custom')
conflicts=('yozooffice')
install=yozooffice-bin.install
if [ "$CARCH" = "i686" ]; then
	source=('http://www.yozosoft.com/download!download.do?productname=2013grbdeb&ipad=dx'
		'yozooffice-bin.install')
	md5sums=('89ceb560e87f765c8ec378794bda130e'
		'9035740dcfe685e30ffe7c23a1681f07')
elif [ "$CARCH" = "x86_64" ]; then
	source=('http://www.yozosoft.com/download!download.do?productname=2013grbdeb64&ipad=dx'
		'yozooffice-bin.install')
	md5sums=('b556476d4ee5ed50c9444062ab9493ae'
		'9035740dcfe685e30ffe7c23a1681f07')
fi
unpackP=$pkgdir/usr/local/Yozosoft/Yozo_Office/Jre/bin/unpack200
libP=$pkgdir/usr/local/Yozosoft/Yozo_Office/Jre/lib

package() {
	cd $pkgdir
	tar -xf $srcdir/data.tar.gz
	echo "unpack jar packages, wait a while."
	$unpackP -r $libP/rt.pack.gz $libP/rt.jar
	$unpackP -r $libP/jsse.pack.gz $libP/jsse.jar
	$unpackP -r $libP/charsets.pack.gz $libP/charsets.jar
	$unpackP -r $libP/plugin.pack.gz $libP/plugin.jar
	$unpackP -r $libP/javaws.pack.gz $libP/javaws.jar
	$unpackP -r $libP/deploy.pack.gz $libP/deploy.jar
	$unpackP -r $libP/resources.pack.gz $libP/resources.jar
	$unpackP -r $libP/ext/localedata.pack.gz $libP/ext/localedata.jar
	$unpackP -r $libP/ext/bcprov-jdk14-124.pack.gz $libP/ext/bcprov-jdk14-124.jar
	$unpackP -r $libP/ext/jai_core.pack.gz $libP/ext/jai_core.jar
	$unpackP -r $libP/ext/tools.pack.gz $libP/ext/tools.jar
	$unpackP -r $libP/ext/ojdbc14.pack.gz $libP/ext/ojdbc14.jar
	$unpackP -r $libP/ext/mysql-connector-java-5.1.18-bin.pack.gz $libP/ext/mysql-connector-java-5.1.18-bin.jar
	$unpackP -r $libP/ext/swt.pack.gz $libP/ext/swt.jar
	$unpackP -r $libP/ext/DJNativeSwing-SWT.pack.gz $libP/ext/DJNativeSwing-SWT.jar
	$unpackP -r $libP/ext/jhall.pack.gz $libP/ext/jhall.jar
	$unpackP -r $libP/ext/bcel-5.1.pack.gz $libP/ext/bcel-5.1.jar
	$unpackP -r $pkgdir/usr/local/Yozosoft/Yozo_Office/Yozo_Office.pack.gz $pkgdir/usr/local/Yozosoft/Yozo_Office/Yozo_Office.jar
}
