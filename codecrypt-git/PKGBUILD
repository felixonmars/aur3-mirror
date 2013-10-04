# Maintainer: Daniel Golle <daniel.golle@gmail.com>
# Contributor: Daniel Golle <daniel.golle@gmail.com>

pkgname=codecrypt-git
_gitname=codecrypt
pkgver=302.dae56da
pkgrel=1
pkgdesc="post-quantum cryptography encryption and signing tool (ccr)"
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('crypto++' 'gmp')
makedepends=('git' 'intltool')
url="http://e-x-a.org/codecrypt/"
source=("git://github.com/exaexa/codecrypt.git"
	cryptopp-instead-of-crypto.patch
	link-against-pthread.patch )
md5sums=('SKIP'
        '913c09e380bf0a00aff5a357ed96351d'
        'fe0cf956d6dc416a3b0694f21e9be2c2')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir"

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  msg2 "Patching..."
  patch -Nup1 -i ../cryptopp-instead-of-crypto.patch
  patch -Nup1 -i ../link-against-pthread.patch
  msg2 "Starting build..."
  ./autogen.sh
  ./configure \
   --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir" install
}

# vim: set ft=sh ts=2 sw=2 et:
