# Maintainer: Joey Dumont <joey.dumont@gmail.com>
# Contributor: Peter Garceau (rockychimp@gmail.com)
# Contributer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributer: Ivan Sichmann Freitas <ivansichfreitas@gmail.com>

pkgname=latexmk
pkgver=431
pkgrel=1
arch=('any')
pkgdesc="A perl script with a make-like functionality for latex documents."
url="http://www.phys.psu.edu/~collins/software/latexmk-jcc/versions.html"
license=('GPL2')
depends=('perl')
source=(http://www.phys.psu.edu/~collins/software/latexmk-jcc/$pkgname-$pkgver.zip)
md5sums=('13b8027df82642ae43045882920775b6')

build() {
  install -Dm755 latexmk.pl $pkgdir/usr/bin/latexmk-$pkgver
  install -Dm644 latexmk.1 -p \
    $pkgdir/usr/share/man/man1/latexmk-$pkgver.1
  install -d $pkgdir/usr/share/$pkgname
  echo "\$pscmd = 'ps -aeg';" > \
    $pkgdir/usr/share/$pkgname/LatexMk
  echo "\$pid_position = 1;" >> \
    $pkgdir/usr/share/$pkgname/LatexMk
  install -d $pkgdir/usr/share/doc/$pkgname
  for _i in example_rcfiles extra-scripts
  do
    cp -r ${_i} $pkgdir/usr/share/doc/$pkgname
  done
  rm $pkgdir/usr/share/doc/$pkgname/extra-scripts/*.bat
}
