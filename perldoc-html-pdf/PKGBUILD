# Maintainer: Mohammadreza Abdollahzadeh <morealaz@gmail.com>
pkgname=perldoc-html-pdf
pkgver=5.20.1
pkgrel=1
pkgdesc="Core documentation for Perl in HTML and PDF formats."
arch=('any')
url="http://perldoc.perl.org"
license=('GPL' 'PerlArtistic')
conflicts=(perldoc-html)
replaces=(perldoc-html)
source=("http://perldoc.perl.org/perldoc.tar.gz")
md5sums=('7629f7ccd323fb513cda23fc0c95e11b')

package() {
  install -dm755 "$pkgdir/usr/share/doc"
  cp -dpr --no-preserve=ownership "$srcdir/perldoc" "$pkgdir/usr/share/doc/"
}
