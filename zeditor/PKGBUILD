# Contributor: Eric Forgeot < http://ifiction.free.fr >
pkgname=zeditor
pkgver=0.5
pkgrel=1
pkgdesc="An editor for the creation of tutorials (.tuto) used on the Site du Zéro"
arch=(i686 x86_64)
url="http://www.foxycode.net/zeditor/"
license=('gpl')
depends=('xulrunner')
source=(http://www.foxycode.net/zeditor/trunks/0-5/${pkgname}-0-5-ff.tar.gz)
md5sums=('ad6197948ceaf951e5d40ca913a8c0b0')


build() {
	mkdir -p $pkgdir/usr/share/${pkgname}
	mkdir -p $pkgdir/usr/bin/
	cp -r $srcdir/zEditor/* $pkgdir/usr/share/${pkgname}
	
	echo "xulrunner /usr/share/zeditor/application.ini" > $pkgdir/usr/bin/zeditor

    chmod +x $pkgdir/usr/bin/zeditor
	
#desktop icons
	mkdir -p $pkgdir/usr/share/pixmaps
	mkdir -p $pkgdir/usr/share/applications

	cp $srcdir/zEditor/chrome/icons/default/zozoreditor.xpm $pkgdir/usr/share/pixmaps/$pkgname.xpm
	
	install -D -m644 $srcdir/../$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	}


