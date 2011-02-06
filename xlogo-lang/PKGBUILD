# Contributer: Xavier de Labouret <arch@2-lab.net>
pkgname=xlogo-lang
pkgver=0.9.93
pkgrel=1
pkgdesc="A Logo interpreter written in Java, to teach programming to children with a graphical turtle."
arch=('i686' 'x86_64')
url="http://xlogo.tuxfamily.org/"
license="GPL"
depends=('java-runtime')
source=(http://downloads.tuxfamily.org/xlogo/common/oldies/xlogo-$pkgver.jar xlogo-lang.desktop xlogo-lang.png)
md5sums=('7e0af873b8915b8bf4f3af725992fcfb' 'b8af45443357771a98f673e4ef16674c' 'd65c6b540e3d429a4a97762013fe53c2')

build() {
	mkdir -p $startdir/pkg/usr/bin
	cd $startdir/src
	
	install -D -m644 xlogo-$pkgver.jar $startdir/pkg/usr/share/java/$pkgname/xlogo-$pkgver.jar
	mkdir -p $startdir/pkg/usr/share/pixmaps/
	install -D -m644 xlogo-lang.png $startdir/pkg/usr/share/pixmaps/
	install -D -m644 $startdir/$pkgname.desktop $startdir/pkg/usr/share/applications/$pkgname.desktop

	cd $startdir/pkg/usr/share/java/$pkgname/
	ln -s xlogo-$pkgver.jar xlogo.jar

}

