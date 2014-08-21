# Maintainer: Mathieu Clabaut <mathieu@clabaut.net>
pkgname=rmtoo
pkgver=23
pkgrel=3
pkgdesc="free and open source requirements management tool."
arch=('any')
url="http://www.flonatel.de/projekte/rmtoo/"
license=('GPL')
depends=('python2' 'python2-scipy' 'texlive-latexextra' 'texlive-latex3' 'graphviz' 'gnuplot')
source=(http://downloads.sourceforge.net/rmtoo/$pkgver/$pkgname-$pkgver.tar.gz)

package() {
  install -m755 -d $pkgdir/opt/rmtoo
  cp -r $srcdir/$pkgname-$pkgver/* $pkgdir/opt/rmtoo/ || return 1
  sed -i -e 's;env python;env python2;' $pkgdir/opt/rmtoo/bin/*
}
md5sums=('eaa452646e89c96d2188af5eb891ce98')
