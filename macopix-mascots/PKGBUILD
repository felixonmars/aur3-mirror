# Contributor: Arnaud Barisain Monrose <dreamteam69@gmail.com>
pkgname=macopix-mascots
pkgver=20080418
pkgrel=1
pkgdesc="Official mascots for macopix"
_basemascoturl="http://rosegray.sakura.ne.jp/macopix/macopix-mascot"
arch=('i686' 'x86_64')
url="http://rosegray.sakura.ne.jp/macopix/dl-e.html"
license=('free-noncomm')
depends=('macopix')
conflicts=()
source=("${_basemascoturl}-cosmos-euc-ja-1.02.tar.gz"
        "${_basemascoturl}-mizuiro-euc-ja-1.02.tar.gz"
        "${_basemascoturl}-pia2-euc-ja-1.02.tar.gz"
        "${_basemascoturl}-tsukihime-euc-ja-1.02.tar.gz"
        "${_basemascoturl}-triangle_heart-euc-ja-1.02.tar.gz"
        "${_basemascoturl}-comic_party-euc-ja-1.02.tar.gz"
        "${_basemascoturl}-kanon-euc-ja-1.02.tar.gz"
        "${_basemascoturl}-one-euc-ja-1.02.tar.gz"
        "${_basemascoturl}-marimite-euc-ja-2.20.tar.gz"
        "${_basemascoturl}-HxB-euc-ja-0.30.tar.gz")
md5sums=('03a6b160cd619c6b296b5fe394c40942'
         '8cb0d25239da9ab62c8fbbce35d2e6d5'
         '2de2f011339f585fc4e4e57b7129fbb8'
         '9e85bb389875d1e937aa7cfa584f7f76'
         'f2767cd12b44dc6cc68be6d89ee3a391'
         '5d7483032bfe0aaccb161bf179f116c7'
         'dbd24ea2495f86e5023ae60345a5ddb7'
         'ac05079eb7fb03aeee504ac4e002da2c'
         '075b229ca16d7778eddd61c1ff1db29f'
         'c2f209dac0dc35566f2ebc14d3a593c5')

build() {
  cd "$srcdir"
  mkdir -p $startdir/pkg/usr/share/macopix/pixmap
  for i in $(find . -name '*.mcpx'); do
    install -D -m777 $i $startdir/pkg/usr/share/macopix/
  done  
  for i in $(find . -name '*.menu'); do
    install -D -m777 $i $startdir/pkg/usr/share/macopix/
  done  
  for i in $(find . -name '*.png'); do
    install -D -m777 $i $startdir/pkg/usr/share/macopix/pixmap/
  done    
}

# vim:set ts=2 sw=2 et:
