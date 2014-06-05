# perlawk

pkgname=gvm
_pkgname=vm
pkgver=1.7
pkgrel=1
pkgdesc="Machine virtuelle pour le projet de compilation/Virtual machine for the project of compilation: with GUI and console version."
url="https://www.lri.fr/~mandel/projet-compilation/vm"
arch=('x86_64' 'i686')
license=('GPL')
depends=('ocaml' 'lablgtk2')
source=("https://www.lri.fr/~mandel/projet-compilation/vm/$_pkgname-$pkgver.tar.gz")

build() {
  cd "$_pkgname-$pkgver"
  ./configure --prefix=/usr 
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/bin"
  cp gvm vm "$pkgdir/usr/bin"
}

md5sums=('bc2b51f4606d3991a50975ce193d3de8')
