# Contributor: Guillem Rieu <guillemr@gmx.net>

pkgname=eclipse-ocaide
pkgver=1.2.8
_helpver=1.2.5
pkgrel=1
pkgdesc="OCaml Plugin for Eclipse"
arch=(i686 x86_64)
url="http://www.algo-prog.info/ocaide/"
license='custom:"CeCILL-B"'
depends=('eclipse>=3.5')
source=(http://www.algo-prog.info/ocaide/plugins/Ocaml_$pkgver.jar \
  http://www.algo-prog.info/ocaide/plugins/Ocaml.help_${_helpver}.jar COPYING)
md5sums=('1ee8f1403119bbef2cc54370a7b1a176' 'deceba0bb050930c78b7bccca4db749b'\
         '954ef1db8c756379d01ac7d3f0051279')

build() {
  cd $srcdir

  mkdir -p $pkgdir/usr/share/eclipse/plugins/ || return 1
  install -m644 Ocaml_$pkgver.jar Ocaml.help_${_helpver}.jar \
    $pkgdir/usr/share/eclipse/plugins/ || return 1
  install -D -m644 COPYING \
    $pkgdir/usr/share/licenses/$pkgname/COPYING || return 1
}
