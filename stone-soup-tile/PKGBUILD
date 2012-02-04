# Contributor: KillaB <xGenoBlast@gmail.com>
# Contributor: Nathan Jones <nathanj@insightbb.com>
# Contributor: Mael Clerambault <mael@clerambault.fr>
# Contributor: Forgeot Eric <http://ifiction.free.fr>

pkgname=stone-soup-tile
pkgver=0.8.1
pkgrel=1
pkgdesc="Community maintained variant of Linley's Dungeon Crawl (tile & ncurses version)"
arch=('i686' 'x86_64' 'ppc')
url="http://crawl.develz.org"
depends=(lua libpng libx11 ncurses sdl_image)
makedepends=(gcc bison flex pkg-config)
license=('custom')
conflicts=('stone-soup')
source=(http://downloads.sourceforge.net/sourceforge/crawl-ref/stone_soup-$pkgver-nodeps.tar.bz2 stone-soup-tile.desktop)

md5sums=('7ddeb1ff048401e55af0d1c11038f937'
         'c1104107beaad57531e825a7d26c7914')


build() {
  cd $srcdir/stone_soup-$pkgver/source
  cp -r $srcdir/stone_soup-$pkgver/source $srcdir/stone_soup-$pkgver/source-tiles

  cd $srcdir/stone_soup-$pkgver/source-tiles
  make TILES=y DATADIR=/usr/share/$pkgname SAVEDIR='~/.stone-soup' || return 1

  cd $srcdir/stone_soup-$pkgver/source
  make DATADIR=/usr/share/$pkgname SAVEDIR='~/.stone-soup' || return 1

  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/share/$pkgname/
  cp $srcdir/stone_soup-$pkgver/source-tiles/crawl $pkgdir/usr/bin/stone-soup-tiles
  cp $srcdir/stone_soup-$pkgver/source/crawl $pkgdir/usr/bin/stone-soup
  cp -r $srcdir/stone_soup-$pkgver/{docs,settings} $pkgdir/usr/share/$pkgname/
  cp -r $srcdir/stone_soup-$pkgver/source-tiles/dat $pkgdir/usr/share/$pkgname/

  mkdir -p $pkgdir/usr/share/pixmaps
  mkdir -p $pkgdir/usr/share/applications
  mkdir -p $pkgdir/usr/share/licenses/$pkgname/

  cp $srcdir/stone_soup-$pkgver/licence.txt $pkgdir/usr/share/licenses/$pkgname/
  cp $srcdir/stone_soup-$pkgver/source/dat/tiles/stone_soup_icon-32x32.png $pkgdir/usr/share/pixmaps/$pkgname.png  
  cp $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/
}


