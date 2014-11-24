# Maintainer: Mohammadreza Abdollahzadeh <morealaz@gmail.com>
pkgname=perldoc-html
pkgver=5.20.1
pkgrel=1
pkgdesc="Core documentation for Perl in HTML formats."
arch=('any')
url="http://perldoc.perl.org"
license=('GPL' 'PerlArtistic')
conflicts=(perldoc-html-pdf)
source=("http://perldoc.perl.org/perldoc-html.tar.gz")
md5sums=('daeaa7c09239485cd0ded936de27d5ab')

package() {
  install -dm755 "$pkgdir/usr/share/doc/perldoc"
  cp -dpr --no-preserve=ownership "$srcdir/perldoc-html/"* "$pkgdir/usr/share/doc/perldoc/"
}
