# Maintainer: Alexander Koval <a88mail@gmail.com>
pkgname=vizzy-flash-tracer
pkgrel=1
pkgver=3.91
_buildver=3.91
pkgdesc="Vizzy Flash Tracer that shows Flash Player debug content and log"
arch=('i686' 'x86_64')
url="http://code.google.com/p/flash-tracer/"
license=('unknown')
depends=('java-runtime')
source=(http://flash-tracer.googlecode.com/files/Vizzy-linux-3.91.zip 
	vizzy-tracer.desktop
	vizzy-tracer.png
)

build() {
	cd "$srcdir"
	install -d -m755 ${pkgdir}/usr/{bin,share}
	cp -a "Vizzy" "$pkgdir/usr/share/$pkgname"
	chown -R 0:0 $pkgdir/usr/share/$pkgname

	find $pkgdir/usr/share/$pkgname -type d -exec chmod 0777 {} ';'
 	find $pkgdir/usr/share/$pkgname -type f -exec chmod 0644 {} ';'

	chmod +x $pkgdir/usr/share/$pkgname/Vizzy_linux.sh
	chmod +x $pkgdir/usr/share/$pkgname/Vizzy.jar

	touch $pkgdir/usr/bin/vizzy-tracer
	echo "#!/bin/sh" >> $pkgdir/usr/bin/vizzy-tracer
	echo "java -jar /usr/share/vizzy-flash-tracer/Vizzy.jar &" >> $pkgdir/usr/bin/vizzy-tracer
#	echo "exec /usr/share/vizzy-flash-tracer/Vizzy_linux.sh $*" >> $pkgdir/usr/bin/vizzy-tracer.sh
	chmod +x $pkgdir/usr/bin/vizzy-tracer

	install -D -m644 vizzy-tracer.desktop "${pkgdir}/usr/share/applications/vizzy-tracer.desktop" || return 1
	install -D -m644 vizzy-tracer.png "${pkgdir}/usr/share/pixmaps/vizzy-tracer.png" || return 1
}
md5sums=('88af257d57bef4c209a39bba0d8c24e9'
         '32b92f0b38bc586db60d8624f60c9096'
         '64c186d15213e62553e740b83503c643')
