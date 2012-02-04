# Contributor: Eric Forgeot < http://ifiction.free.fr >
pkgname=fargoal
pkgver=1
pkgrel=5
pkgdesc="Sword of Fargoal is a simple to play roguelike game where you have to explore the undergrounds and fight monsters."
arch=(i686 x86_64)
url="http://fargoal.com/"
license=('freeware')
depends=('allegro4')
makedepends=('gzip')
source=(http://downloads.sourceforge.net/sourceforge/squidfighter/fargoal/20040630/fargoal20040629.zip)
md5sums=('a72efd5f9b83d7932497721d08306ce6')


build() {
  cd $srcdir/${pkgname}/src/
    # remove the problematic sin in y = text_height (font) * (sin (-v * AL_PI * 2) + v);
	#sed -i -e "s/(sin/(/g" credits.c
	#Fix the makefile
	#sed -i -e "s/LDLIBS :=/LDLIBS := -lm/g" Makefile
	 
    make || return 1
	
	mkdir -p $pkgdir/usr/share/$pkgname
	mkdir -p $pkgdir/usr/bin
	
	cp $srcdir/${pkgname}/sword $pkgdir/usr/share/${pkgname}/
	cp -fr $srcdir/${pkgname}/gfx $pkgdir/usr/share/${pkgname}/
	cp -fr $srcdir/${pkgname}/sfx $pkgdir/usr/share/${pkgname}/
	cp -fr $srcdir/${pkgname}/data $pkgdir/usr/share/${pkgname}/
	chmod 777 $pkgdir/usr/share/${pkgname}/data
	cp -fr $srcdir/${pkgname}/agreement.txt $pkgdir/usr/share/${pkgname}/
	cp -fr $srcdir/${pkgname}/readme.html $pkgdir/usr/share/${pkgname}/

	echo "cd /usr/share/fargoal/
./sword" > $pkgdir/usr/bin/${pkgname}
	
	ln -s $pkgdir/usr/bin/${pkgname} $pkgdir/usr/bin/sword-of-${pkgname}
	
	chmod +x $pkgdir/usr/bin/${pkgname}
	chmod +x $pkgdir/usr/bin/sword-of-${pkgname}

	
	#desktop icons
	mkdir -p $pkgdir/usr/share/pixmaps
	mkdir -p $pkgdir/usr/share/applications

	cp $srcdir/../${pkgname}.png $pkgdir/usr/share/pixmaps/$pkgname.png
	
	install -D -m644 $srcdir/../$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

}

