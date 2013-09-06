pkgname=txt2latex
pkgver=20130905
pkgrel=1
pkgdesc="Assists in translation from ASCII text to LaTeX"
arch=('any')
url='http://ctan.org/pkg/txt2latex'
license=('GPL')
depends=('perl')
source=("http://ctan.unixbrain.com/support/txt2latex/txt2latex")
md5sums=('7157fe46ebf7367153047a6d6a842bdb')

pkgver() {
  date +%Y%m%d
}

package() {
  install -Dm755 "$srcdir/txt2latex" "$pkgdir/usr/bin/txt2latex"
}
