# Maintainer: Peter Slizik <peter.slizik (at) gmail.com>

# The name 'gpp' has already been taken by 'GNOME Photo Printer'
# in AUR, so we need to choose another name.

pkgname=gpp-preprocessor
pkgver=2.24
pkgrel=1
pkgdesc="A general-purpose preprocessor with customizable syntax"
arch=('i686' 'x86_64')
url="http://en.nothingisreal.com/wiki/GPP"
license=('GPL')
depends=('glibc')
conflicts=('gpp')  # We want the binary to have the name 'gpp'
# Note: standard $pkgname-$pkgver.tar.bz2 idiom won't work, as we've chosen
#       a different package name.
source=(http://files.nothingisreal.com/software/gpp/gpp-$pkgver.tar.bz2)
md5sums=('f04c2a23312ab3d0c462c7972d1c6aa6')

build() {
  cd "$srcdir/gpp-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/gpp-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
