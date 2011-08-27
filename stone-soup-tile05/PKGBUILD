# Contributor: KillaB <xGenoBlast@gmail.com>
# Contributor: Nathan Jones <nathanj@insightbb.com>
# Contributor: Forgeot Eric <http://ifiction.free.fr>

pkgname=stone-soup-tile05
pkgver=0.5.2
pkgrel=1
pkgdesc="Community maintained variant of Linley's Dungeon Crawl (tile & ncurses version), 0.5.2 branch"
arch=('i686' 'x86_64' 'ppc')
url="http://crawl-ref.sourceforge.net/"
depends=(lua libpng libx11 ncurses sdl_image)
makedepends=(gcc bison flex)
license=('custom')
conflicts=('stone-soup' 'crawl')
source=(http://downloads.sourceforge.net/sourceforge/crawl-ref/stone_soup-$pkgver-src.tbz2)
md5sums=('48aca99f320b70c880363ddaca7da89a')

build() {
	cd $srcdir/stone_soup-$pkgver-src/source


	make -f makefile_tiles.unix || return 1
	
	mv $srcdir/stone_soup-$pkgver-src/source/crawl $srcdir/stone_soup-$pkgver-src/source/crawl-tiles05
	
	make clean || return 1
	make -f makefile.unix || return 1

	mv $srcdir/stone_soup-$pkgver-src/source/crawl $srcdir/stone_soup-$pkgver-src/source/crawl05
		
	mkdir -p $pkgdir/usr/share/stone-soup05/morgue
	mkdir -p $pkgdir/usr/share/stone-soup05/saves
	chmod 777 $pkgdir/usr/share/stone-soup05/morgue                  
	chmod 777 $pkgdir/usr/share/stone-soup05/saves  
	cp -r $srcdir/stone_soup-$pkgver-src/source/dat $pkgdir/usr/share/stone-soup05/
	cp -r $srcdir/stone_soup-$pkgver-src/source/crawl-tiles05 $pkgdir/usr/share/stone-soup05/
	cp -r $srcdir/stone_soup-$pkgver-src/source/crawl05 $pkgdir/usr/share/stone-soup05/
	cp -r $srcdir/stone_soup-$pkgver-src/licence.txt $pkgdir/usr/share/stone-soup05/
	
	mkdir -p $pkgdir/usr/share/stone-soup05/settings
	cp -r ../settings/* $pkgdir/usr/share/stone-soup05/settings/
	mkdir -p $pkgdir/usr/share/stone-soup05/docs
	cp -r ../docs/*.txt $pkgdir/usr/share/stone-soup05/docs
	
	
	#links to /usr/bin/
	mkdir -p $pkgdir/usr/bin/
	
	echo "cd /usr/share/stone-soup05/
./crawl05" > $pkgdir/usr/bin/crawl05

	echo "cd /usr/share/stone-soup05/
./crawl-tiles05" > $pkgdir/usr/bin/crawl-tiles05
	
	ln -s /usr/bin/crawl05 $pkgdir/usr/bin/stone-soup05
	ln -s /usr/bin/crawl-tiles05 $pkgdir/usr/bin/stone-soup-tiles05
	
	chmod +x $pkgdir/usr/bin/crawl05
	chmod +x $pkgdir/usr/bin/crawl-tiles05
	
	
	#desktop icons
	mkdir -p $pkgdir/usr/share/pixmaps
	mkdir -p $pkgdir/usr/share/applications

	cp -r $srcdir/stone_soup-$pkgver-src/source/dat/tiles/stone_soup_icon-32x32.png $pkgdir/usr/share/pixmaps/stone-soup05.png
	
	install -D -m644 $srcdir/../stone-soup05.desktop $pkgdir/usr/share/applications/stone-soup05.desktop
}

