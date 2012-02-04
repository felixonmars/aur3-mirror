# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: Bráulio Barros de Oliveira <brauliobo@gmail.com>

_pkg=NaturalDocs
pkgname=naturaldocs
pkgver=1.52
pkgrel=1
pkgdesc="Documentation generator with a natural syntax."
arch=('any')
url="http://www.naturaldocs.org/"
license=('GPL')
depends=('perl')
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/$_pkg-$pkgver.zip")
md5sums=('68e3982acae57b6befdf9e75b420fd80')

package() {
  cd "$srcdir"

  install -d "$pkgdir"/usr/{bin,share/{perl5,doc}/$pkgname}

  # datas
  cp -a [^HLN]* $_pkg "$pkgdir/usr/share/perl5/$pkgname"

  # docs
  cp -a Help/* "$pkgdir/usr/share/doc/$pkgname"

  # executable
  echo -e "#!/bin/bash\nperl /usr/share/perl5/$pkgname/$_pkg \$@" >\
  "$pkgdir/usr/bin/$pkgname" && chmod 755 "$pkgdir/usr/bin/$pkgname"
}
