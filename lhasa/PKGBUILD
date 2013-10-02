# Maintainer: speps <speps at aur dot archlinux dot org>

_auth=fragglet
pkgname=lhasa
pkgver=0.2.0
pkgrel=1
pkgdesc="Free Software LHA implementation"
arch=(i686 x86_64)
url="http://fragglet.github.com/lhasa/"
license=('custom:ISC')
depends=('glibc')
makedepends=('libtool')
provides=('lha')
conflicts=('lha')
options=('!libtool')
source=("https://github.com/$_auth/$pkgname/tarball/v$pkgver")
md5sums=('befaa756b2e9ab9440c39acb8f0e46e1')

build() {
  cd "$srcdir/$_auth-$pkgname-"*
  ./autogen.sh --prefix=/usr \
               --enable-static=no
  make
}

package() {
  cd "$srcdir/$_auth-$pkgname-"*
  make DESTDIR="$pkgdir/" install

  # license
  install -Dm644 COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
