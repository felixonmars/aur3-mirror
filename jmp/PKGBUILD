# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: Road Tang <roadtang_AT_gmail.com>
pkgname=jmp
pkgver=0.51.1
pkgrel=1
pkgdesc="JMP is a profiler for java that can be used to trace objects usage and method timings"
arch=(i686 x86_64)
url="http://www.khelekore.org/jmp"
license=('GPL')
groups=()
depends=('jdk<=5' 'gtk')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=($url/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('067f03c8449e2388acf5eb800a55024b')
 #generate with 'makepkg -g'

build() {
  cd "$startdir/src/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$startdir/pkg" install
}

# vim:set ts=2 sw=2 et:
