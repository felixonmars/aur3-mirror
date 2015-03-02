# Maintainer: Fincer <fincer89@hotmail.com>

pkgname=pdftk-qgui
pkgver=0.1.9
pkgrel=2
pkgdesc="GUI for Pdftk (Qt4)"
arch=('i686' 'x86_64')
url="http://qt-apps.org/content/show.php/PdfTk-QGUI?content=93043"
license="GPL"
depends=('qt4')
options=('!makeflags')
source=('http://suslic-2012.narod.ru/files/pdftk-qgui_0.1.9-2_src.tar.gz'
'pdftk-qgui.png')
sha1sums=('033988eb6270213df1d7116f2577060a0e08217a'
          '5022e4b23294e24da5449baae80c940a9b06a8ba')
   
build() {
	cd "$srcdir/${pkgname}_$pkgver-${pkgrel}_src/"

	if [ -f /usr/bin/qmake-qt4 ] && [ ! -f /usr/bin/qmake ]; then
	    qmake-qt4 src.pro
	elif [ -f /usr/bin/qmake ]; then
	    qmake src.pro
	else
	    echo "Error! qmake or qmake-qt4 executable not found in /usr/bin/. Stop."
	    echo
	    exit 0
	fi
	make
}

printf "[Desktop Entry]\nEncoding=UTF-8\nName=PdfTk-QGUI\nGenericName=\nComment=GUI for Pdftk\nExec=pdftk-qgui\nIcon=pdftk-qgui\nTerminal=false\nType=Application\nCategories=Office;Utility;\nStartupNotify=true\n" > pdftk-qgui.desktop

package() {
	mkdir -p $pkgdir/usr/bin/
	mkdir -p $pkgdir/usr/share/applications/
	mkdir -p $pkgdir/usr/share/pixmaps
	install -m 755 $srcdir/${pkgname}_$pkgver-${pkgrel}_src/bin/pdftk-qgui $pkgdir/usr/bin/
	
        install $startdir/$pkgname.desktop "$pkgdir/usr/share/applications/"
        install $startdir/$pkgname.png "$pkgdir/usr/share/pixmaps/" 
}
