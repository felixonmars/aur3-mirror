#Maintainer: Jonathan Fine <were.Vire AT gmail DOT com>

pkgname="ycurses"
pkgver=M2
pkgrel=1
pkgdesc="A set of modules that provide an extremely thin binding for the curses library in D."
arch=('any')
url="http://code.google.com/p/ycurses/"
license=('MIT')
source=("http://ycurses.googlecode.com/files/ycursesM2.tar.gz")
md5sums=('29c5baed718386e9d5940b704b6275be')
options=('docs')

build() {
	install -Dm644 $startdir/src/$pkgname/modules/eti.d $startdir/pkg/usr/include/d/eti.d
        install -Dm644 $startdir/src/$pkgname/modules/form.d $startdir/pkg/usr/include/d/form.d
	install -Dm644 $startdir/src/$pkgname/modules/menu.d $startdir/pkg/usr/include/d/memu.d
	install -Dm644 $startdir/src/$pkgname/modules/ncurses.d $startdir/pkg/usr/include/d/ncurses.d
	install -Dm644 $startdir/src/$pkgname/modules/panel.d $startdir/pkg/usr/include/d/panel.d
	
	mkdir -p $startdir/pkg/usr/share/doc/ycurses/candydoc/img/
	mkdir -p $startdir/pkg/usr/share/ycurses/examples
	
	cp -r $startdir/src/$pkgname/docs/*.html $startdir/pkg/usr/share/doc/ycurses/
	cp -r $startdir/src/$pkgname/docs/candydoc/*.{css,js} $startdir/pkg/usr/share/doc/ycurses/candydoc/
	cp -r $startdir/src/$pkgname/docs/candydoc/img/* $startdir/pkg/usr/share/doc/ycurses/candydoc/img/	
	cp -r $startdir/src/$pkgname/examples/* $startdir/pkg/usr/share/ycurses/examples/
}
