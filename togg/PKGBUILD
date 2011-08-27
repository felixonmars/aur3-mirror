# Maintainer:  TDY <tdy@gmx.com>
# Contributor: Christoph Zeiler <rabyte__gmail>

pkgname=togg
pkgver=0.2.1
pkgrel=1
pkgdesc="A simple Ogg Vorbis tag editor that allows for easy mass-tagging of audio files"
arch=('any')
url="http://togg.googlecode.com/"
license=('GPL')
depends=('vorbis-tools')
source=(http://togg.googlecode.com/files/togg-$pkgver.tar.bz2)
md5sums=('2380ba539cf288fee910e48451409bea')

build() {
  cd "$srcdir/togg-$pkgver"
  sed -i 's#tempfile#mktemp#' togg
  install -Dm755 togg "$pkgdir/usr/bin/togg"
  install -Dm644 togg.1 "$pkgdir/usr/share/man/man1/togg.1"
}
