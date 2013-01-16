# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>

pkgname=finomaton
pkgver=1.0
pkgrel=2
pkgdesc="A tool for drawing finite state machines (automata) and similar graphs"
arch=('any')
url="http://stud4.tuwien.ac.at/~e0225855/finomaton/finomaton.html"
license=('GPL')
depends=('tk>=8.3')
source=(http://stud4.tuwien.ac.at/~e0225855/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('da19eaf547b703f5d9d703a852b946f1')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -dm755 "$pkgdir/usr/share/$pkgname/examples"
  install -cm644 examples/* "$pkgdir/usr/share/$pkgname/examples"
  install -Dm755 $pkgname.tcl "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
