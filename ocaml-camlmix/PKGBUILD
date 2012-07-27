# Maintainer: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Guillem Rieu <guillemr@gmx.net>

pkgname=ocaml-camlmix
_pkgname=${pkgname/ocaml-/}
pkgver=1.3.0
pkgrel=4
pkgdesc='A template system for OCaml.'
arch=('i686' 'x86_64')
url='http://mjambon.com/camlmix/'
license=('BSD')
depends=('glibc')
makedepends=('ocaml')
source=(http://martin.jambon.free.fr/$_pkgname/$_pkgname-$pkgver.tar.bz2)
md5sums=('fc15733c6fe98865de42935563a960d1')
options=(!makeflags)

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  make || return 1
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  mkdir -p $pkgdir/usr/bin  # Damn those Makefiles!
  env PREFIX=$pkgdir/usr make install || return 1
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
