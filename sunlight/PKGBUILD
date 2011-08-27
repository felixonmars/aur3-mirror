pkgname=sunlight
pkgver=0.0.11
pkgrel=1
pkgdesc="A simple but useful application which retrieve an image from the internet and set it as a wallpaper every 30 minutes. "
arch=('i686' 'x86_64')
url="http://realtimesunlightwallpaper.weebly.com"
license=('other')
depends=()
makedepends=()
source=(http://launchpad.net/realtimesunlightwallpaper/trunk/v$pkgver/+download/$pkgname-$pkgver.tar.gz)

md5sums=('a4340d408b6b7472571f9efa8fea2249')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make || return 1
  
  mkdir -p $pkgdir/usr/share/
  cp -R sunlight $pkgdir/usr/share/
  install -Dm755 $pkgname-$pkgver $pkgdir/usr/bin/sunlight
}

