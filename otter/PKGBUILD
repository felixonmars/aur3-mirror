# Maintainer: Peter Lewis <pete@muddygoat.org>
# Contributor: Schnouki <thomas.jost@gmail.com>

pkgname=otter
pkgver=3.3f
pkgrel=2
pkgdesc="Otter is an automated theorem prover for first-order and equational logic, and Mace2 searches for finite models and counterexamples."
url="http://www.cs.unm.edu/~mccune/otter/"
license="custom:otter"
depends=()
arch=('i686' 'x86_64')
source=("http://www.cs.unm.edu/~mccune/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('795711b307cc1316e08d3d4f46c998c9')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make all
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Copy license file
  install -Dm 644 Legal "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Don't use "make install" which needs csh
  cd bin
  for f in *; do
    install -Dm 755 "$f" "$pkgdir/usr/bin/$f"
  done
}
