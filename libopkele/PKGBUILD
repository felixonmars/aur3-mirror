pkgname=libopkele
pkgver=2.0.4
pkgrel=1
pkgdesc="libopkele is a c++ implementation of an OpenID decentralized identity system."
arch=('i686' 'x86_64')
url="http://kin.klever.net/libopkele/"
license=('custom')
groups=()
depends=('tidyhtml' 'pcre' 'curl' 'expat')
makedepends=('pkgconfig')
provides=()
conflicts=()
replaces=()
backup=()
options=(libtool)
install=
source=(http://kin.klever.net/dist/${pkgname}-${pkgver}.tar.bz2 
  fix-ftbfs-gcc4.7.diff)
noextract=()
sha256sums=('102e22431e4ec6f1f0baacb6b1b036476f5e5a83400f2174807a090a14f4dc67'
            'dca672502790c26828020ce942a6e6c40c8cb3b84cd94f987223b0b175445ab2')


build() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -p1 < ../fix-ftbfs-gcc4.7.diff
  ./configure --prefix=/usr \
    --disable-konforka \
    --disable-doxygen
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -D -m644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}

# vim:set ts=2 sw=2 et:
