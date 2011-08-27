# Contributor: wizzomafizzo@gmail.com
# Contributor: Daenyth

pkgname=crawl
pkgver=4.0.0beta26
pkgrel=6
pkgdesc="Linley's Dungeon Crawl roguelike"
url="http://www.dungeoncrawl.org/"
arch=('i686' 'x86_64')
license=('custom:crawl')
depends=('ncurses')
source=(ftp://ftp.dungeoncrawl.org/dev/4.0.x/src/dc400b26-src.tbz2
        crawlpatch.diff
        gcc44.patch
        crawl)

md5sums=('807810185ff93f06bd4e169067644d8f'
         'c9e5d02c1ebeb1455987765ec5fad183'
         '75be5ff5d169f7436f46d6e0f5940603'
         '9fb0d3724bb950b7860aed610953966d')

build() {
  cd $srcdir/dc400b26-src

  #Patch and build the package
  patch -p1 -i $srcdir/crawlpatch.diff || return 1
  patch -p2 -i $srcdir/gcc44.patch     || return 1
  cd source && make all                || return 1

  #Install the package data
  cd $srcdir/dc400b26-src
  install -m 755 -D source/crawl $pkgdir/usr/share/crawl/crawl
  install -m 644 -D docs/crawl.6 $pkgdir/usr/man/man6/crawl.6
  install -m 777 -d $pkgdir/usr/share/crawl/save

  #Install the license
  install -m 644 -D licence.txt $pkgdir/usr/share/licenses/crawl/COPYING

  #Install the bin file
  install -m 755 -D $srcdir/crawl $pkgdir/usr/bin/crawl

}

# vim:set ts=2 sw=2 et:
