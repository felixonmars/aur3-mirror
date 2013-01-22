# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: astaroth <astaroth_@web.de>

pkgname=jad
pkgver=1.5.8e
pkgrel=4
pkgdesc='Java decompiler'
license=('custom')
arch=('x86_64' 'i686')
makedepends=('curl')
url="http://www.varaneckas.com/jad"
source=("http://www.varaneckas.com/$pkgname/${pkgname}${pkgver//./}.linux.static.zip")
sha256sums=('2878e19fc1fdd725b516f538a57b02aaec1b2d1e4b106d550230381ffa9c0c81')

build() {
  curl -o jad.html http://www.varaneckas.com/jad
  grep '<code>' jad.html -A18 | sed 's:<code>::' | sed 's:</code>::' > LICENSE
}

package() {
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/LICENSE"
  install -Dm644 Readme.txt "$pkgdir/usr/share/doc/$pkgname/README"
}

# vim:set ts=2 sw=2 et:
