# Contributor: Jan Stępień <jstepien@users.sourceforge.net>
pkgname=diamondback-ruby
pkgver=0.20090726
pkgrel=1
pkgdesc="a tool that augments Ruby with a static type system"
url="http://www.cs.umd.edu/projects/PL/druby/"
license=('GPL2')
arch=('x86_64' 'i686')
source=(
  http://www.cs.umd.edu/projects/PL/druby/releases/$pkgname-$pkgver/$pkgname-$pkgver.tar.bz2
  config.patch
)
sha256sums=(
  b5bd88c3b7c06a6eabddaa0c1ec8b69a5c2ae8ae32458bacd353d454c7fdd8a4
  74f3d21c57039939f7b2d6bd11913bb7275696d97fb5bd987f519f62bef90d3e
)
makedepends=(omake ocaml-ocamlgraph ocaml-findlib ocaml-getopt ocaml-ounit)
depends=(syck ruby)

build() {
  cd $srcdir/$pkgname-$pkgver
  patch -Np1 -i $srcdir/../config.patch
  rm -f stubs/1.9.1 && ln -s 1.8 stubs/1.9.1
  omake --config PREFIX=/usr DESTDIR=$pkgdir install
}
