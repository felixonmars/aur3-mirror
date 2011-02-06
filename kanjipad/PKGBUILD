# Contributor: Yildirim Zaynal <asil.jinn@gmail.com>
pkgname=kanjipad
pkgver=2.0.0
pkgrel=7
pkgdesc="KanjiPad is a simple (but snazzy) program which does Japanese handwriting recognition."
url="http://fishsoup.net/software/kanjipad/"
license="GPL"
depends=('gtk2')
makedepends=('automake')
arch=('i686')
source=(http://fishsoup.net/software/kanjipad/$pkgname-$pkgver.tar.gz)
md5sums=('bdfe75534322840b3ff566e0a91c472d')

build() {
  cd $startdir/src/$pkgname-$pkgver
  make || return 1
  make DESTDIR=$startdir/pkg install
}
