# Maintainer: Tai Chi Minh Ralph Eastwood <tcmreastwood@gmail.com>

_pkgname=ffts
pkgname=$_pkgname-git
pkgver=r127.537b2d9
pkgrel=1
pkgdesc="The Fastest Fourier Transform in the South"
arch=('i686' 'x86_64')
url="http://anthonix.com/ffts"
license=('BSD')
groups=()
depends=()
makedepends=('git')
provides=('ffts' 'ffts-git')
conflicts=('ffts' 'ffts-git')
replaces=()
backup=()
options=()
install=
source=($_pkgname::git://github.com/anthonix/ffts.git)
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  ./configure --enable-sse --enable-single --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" install
  install -D -m664 COPYRIGHT "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
