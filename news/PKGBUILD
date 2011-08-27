# Maintainer: archtux <antonio.arias99999@gmail.com>

pkgname=news
pkgver=0.5.0
pkgrel=2
pkgdesc="RSS Feed Ticker bar on your desktop as on news TV channels."
arch=('i686' 'x86_64')
url="http://rssfeedticker.free.fr/"
license=('GPL3')
depends=('gtk2' 'libxml2')
source=(http://www.newsrssticker.com/src/news-$pkgver.tar.gz)
md5sums=('664d43eb48c43ce6fd7246159ad7fab5')

build() {
   cd $srcdir/$pkgname-$pkgver

   ./configure --prefix=/usr
   make

   # License
   mkdir -p $pkgdir/usr/share/licenses/news
   install -Dm644 LICENSE $pkgdir/usr/share/licenses/news/LICENSE

   # Images
   mkdir -p $pkgdir/usr/share/icons
   cd ./images
   cp *.png $pkgdir/usr/share/icons

   # Desktop icon
   install -Dm644 news_logo.png $pkgdir/usr/share/pixmaps/news.png
   install -Dm644 $startdir/news.desktop $pkgdir/usr/share/applications/news.desktop

   # Binary
   cd $srcdir/$pkgname-$pkgver/src/news
   install -Dm755 news $pkgdir/usr/bin/news  
}