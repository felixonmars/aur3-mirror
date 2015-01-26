# Maintainer: Daniel Strot (draugur) <strotdaniel@gmail.com>
pkgname=ferret
pkgver=0.7
pkgrel=6
pkgdesc="Free Entity Relationship and Reverse Engineering Tool"
url="http://savannah.gnu.org/projects/ferret/"
arch=('any')
license=('GPL3')
depends=('bash' 'tk' 'tcl')
source=("http://ftp.gnu.org/gnu/ferret/$pkgname-$pkgver.tar.gz")
md5sums=('af76fce0c848fc6fe1294186751d33cc')

package() {
  cd "$srcdir" || exit 1
  
  touch ferret
  echo "#!/usr/bin/bash" > ferret
  echo "cd /usr/share/ferret" >> ferret
  echo "./ferret" >> ferret
  
  install -Dm755 ferret "$pkgdir/usr/bin/$pkgname" || exit 1
  cd "$pkgname-$pkgver" || exit 1
  # remove CVS directories which the author forgot to remove for the release
  find . -depth -type d -name "CVS" -exec rm -fr {} \; || exit 1
  mkdir -p "$pkgdir/usr/share/$pkgname/" || exit 1
  cp -R -t "$pkgdir/usr/share/$pkgname/" ferret gerwinml/ src/ widgets/ || exit 1
}
