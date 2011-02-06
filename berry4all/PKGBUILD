# Packager: Alexander Winkler <mail at winkler-alexander dot de>
pkgname=berry4all
pkgver=0.3l
pkgrel=3
pkgdesc="Berry4All: tethering your Blackberry. Formerly known as BBTether."
arch=('i686' 'x86_64')
url="http://www.berry4all.com/"
license=('Artistic License')
depends=('python' 'libusb' 'pyusb' 'wxpython')
source=("http://bitbucket.org/tcolar/berry4all/downloads/bbtether-$pkgver.tgz" "berry4all.desktop")
md5sums=('9dc1d0c86613a3e0f8b744a9b8ee43f1' '973bf8de0e7b230d202f84836e50db30')

build() {
	install -d $pkgdir/{opt,usr/bin/}
	cp -R "$srcdir/bbtether" "$pkgdir/opt/"
	#ln -s $pkgdir/opt/bbtether/berry4all.sh $pkgdir/usr/bin/berry4all
	echo "#!/bin/bash" > $pkgdir/usr/bin/berry4all
	echo "cd /opt/bbtether/" >> $pkgdir/usr/bin/berry4all
	echo "./berry4all.sh" >> $pkgdir/usr/bin/berry4all
	chmod 755 $pkgdir/usr/bin/berry4all

	install -D -m 644 "$srcdir/bbtether/img/berry4all.png" "$pkgdir/usr/share/pixmaps/berry4all.png"
	install -D -m 644 "$srcdir/berry4all.desktop" "$pkgdir/usr/share/applications/berry4all.desktop"
}
