# Contributor: Eric Forgeot < http://ifiction.free.fr >
pkgname=qapote
pkgver=0.6
pkgrel=1
pkgdesc="Create PDF reports and document from a source code similar to LaTeX"
arch=(i686 x86_64)
url="http://qapote.tuxfamily.org"
license=('gpl')
depends=('qt')
source=(http://download.tuxfamily.org/qapote/${pkgname}_${pkgver}-src.tar.gz)

md5sums=('e349ed228d93ae2ea937c49ec76afd40')


build() {
  cd $srcdir/${pkgname}
    qmake || return 1
	make || return 1
	
	mkdir -p $pkgdir/usr/share/$pkgname
	mkdir -p $pkgdir/usr/bin
	
	cp -fr $srcdir/${pkgname}/help $pkgdir/usr/share/$pkgname
	cp -fr $srcdir/${pkgname}/test-example $pkgdir/usr/share/$pkgname
	cp -fr $srcdir/${pkgname}/bin $pkgdir/usr/share/$pkgname
	cp -fr $srcdir/${pkgname}/bin $pkgdir/usr/share/$pkgname
	

	echo "cd /usr/share/qapote/bin/
sh qapote-editor.sh" > $pkgdir/usr/bin/$pkgname
  	chmod +x $pkgdir/usr/bin/$pkgname

	echo "cd /usr/share/qapote/bin/
sh qapote-viewer.sh" > $pkgdir/usr/bin/$pkgname-viewer
  	chmod +x $pkgdir/usr/bin/$pkgname-viewer
	
	#desktop icons
	mkdir -p $pkgdir/usr/share/pixmaps
	mkdir -p $pkgdir/usr/share/applications

	cp $srcdir/${pkgname}/logo/qapote.png $pkgdir/usr/share/pixmaps/$pkgname.png
	
	install -D -m644 $srcdir/../$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	
}

