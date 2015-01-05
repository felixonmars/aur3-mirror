# Contributor: Jose M. Dana <dana.develop - gmail>
# Original PKGBUILD file by Andrea Agosti <cifvts at gmail>

pkgname=turtlesport
pkgver=1.6
pkgrel=2
pkgdesc="Turtle Sport is a free software developed to communicate with Garmin fitness products (forerunner and edge)"
arch=('i686' 'x86_64')
url="http://turtlesport.sourceforge.net/EN/home.html"
license=('LGPL2.1')
depends=('java-runtime')
optdepends=('google-earth: for viewing your GPS training')
source=(http://downloads.sourceforge.net/$pkgname/${pkgname}-linux-${pkgver}.tar)
md5sums=('87e9a9161b39d45902ee9d2acbc885de')

package() {
	# Create the directory
	install -d $pkgdir/usr/share/java/$pkgname $pkgdir/usr/bin $pkgdir/usr/lib $pkgdir/usr/share/applications $pkgdir/usr/share/icons/hicolor/96x96/apps
	
	# Create the launcher
	echo "exec java -jar /usr/share/java/$pkgname/turtlesport.jar" >> $pkgdir/usr/bin/turtlesport
	chmod 755 $pkgdir/usr/bin/turtlesport

	# Copy .jar and other files
	install -m755 $srcdir/{turtlesport,swingx,swingx-ws,derby,log4j,fit,jfreechart,jcommon}.jar $pkgdir/usr/share/java/$pkgname/
	install -m755 $srcdir/log4J.xml $pkgdir/usr/share/java/$pkgname/log4J.xml
	install -m755 $srcdir/turtleSport.png $pkgdir/usr/share/icons/hicolor/96x96/apps/turtleSport.png

	# Modify the desktop launcher
	sed -e 's_opt/turtlesport_usr/share/icons/hicolor/96x96/apps_' -e 's/\(Sports\)/\1;Other/' <$srcdir/turtlesport.desktop >$pkgdir/usr/share/applications/turtlesport.desktop
}
