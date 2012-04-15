# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=universal-streamer
pkgver=0.2.5
pkgrel=1
pkgdesc="A command line tool to stream videos from embed flash players with MPlayer"
arch=('any')
url="http://i54.tinypic.com/9jkahh.jpg"
license=('GPL')
depends=('mplayer' 'perl-libwww')
source="http://trizen.googlecode.com/files/$pkgname-$pkgver.tar.gz"
md5sums=('1aa71bec4b54866b4a4469789e0ce806')

package() {
  install -Dm 755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
