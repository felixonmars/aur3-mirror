# Contributor: Tomohiro Takezawa <khabus {at} gmail.com>

pkgname=migemo
pkgver=0.40
pkgrel=1
pkgdesc="Japanese incremental search with Romaji on Emacsen"
arch=('i686' 'x86_64')
url="http://0xcc.net/migemo/"
license=('GPL2')
groups=('editors')
depends=('emacs' 'ruby' 'ruby-bsearch' 'ruby-romkan')
source=("http://0xcc.net/migemo/$pkgname-$pkgver.tar.gz")
md5sums=('7021c45096b6816fccf16f8389324a91')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}
