pkgname=mediacrush-cli
pkgver=1.0.0
pkgrel=1
pkgdesc="Upload media files to https://mediacru.sh"
arch=('any')
url="https://github.com/MediaCrush/MediaCrush-cli"
license=(MIT)
depends=('bash' 'curl')
makedepends=('asciidoc')
source=(https://github.com/MediaCrush/MediaCrush-cli/archive/$pkgver.tar.gz)
md5sums=('b3f30e468b716c54380928e2d9595dad')

build() { 
  cd "MediaCrush-cli-$pkgver"
  a2x --doctype manpage --format manpage mediacrush.1.txt
}

package() {
  cd "$srcdir/MediaCrush-cli-$pkgver"
  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/share/man/man1/
  cp mediacrush $pkgdir/usr/bin/
  cp mediacrush.1 $pkgdir/usr/share/man/man1/mediacrush.1
}
