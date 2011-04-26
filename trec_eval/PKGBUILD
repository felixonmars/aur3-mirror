# Maintainer: Ivan c00kiemon5ter Kanakarakis <ivan.kanak@gmail.com>
# Contributor: Chris Baker <baker.chris.3@gmail.com>
pkgname="trec_eval"
pkgver=9.0
pkgrel=2
pkgdesc="Tool used by the TREC community for evaluating an ad hoc retrieval run"
arch=('any')
url="http://trec.nist.gov/"
license=('custom')
source=("http://trec.nist.gov/${pkgname}/${pkgname}_latest.tar.gz")
sha256sums=('1e6d197293af63b22b52f747d4c7db87227d4ef9cb0d0982d17dac802713b73e')

build() {
  sed -n '2,5p' "$srcdir/$pkgname.$pkgver/${pkgname}.h" > "$srcdir/$pkgname.$pkgver/LICENSE"
  cd "$srcdir/$pkgname.$pkgver"
  make || return 1
}

package() {
  install -D -m755 "$srcdir/$pkgname.$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname" || return 1
  install -D -m644 "$srcdir/$pkgname.$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname" || return 1
}
