# Maintainer: Robson Cardoso dos Santos <cardoso.rcs@gmail.com>
# Contributor: Ivan c00kiemon5ter Kanakarakis <ivan.kanak@gmail.com>

pkgname="markdown"
pkgver=1.0.1
pkgrel=5
pkgdesc="Text to (X)HTML conversion tool for web writers."
arch=('any')
url="http://daringfireball.net/projects/markdown/"
license=('BSD')
depends=('perl')
source=("http://daringfireball.net/projects/downloads/Markdown_${pkgver}.zip")
sha256sums=('6520e9b6a58c5555e381b6223d66feddee67f675ed312ec19e9cee1b92bc0137')

build() {
  # Handling the manpage
  pod2man "$srcdir/Markdown_$pkgver/Markdown.pl" > "$srcdir/Markdown_$pkgver/$pkgname.1"
}

package() {
  install -Dm755 "$srcdir/Markdown_$pkgver/Markdown.pl" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "$srcdir/Markdown_$pkgver/License.text" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "$srcdir/Markdown_$pkgver/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
}
