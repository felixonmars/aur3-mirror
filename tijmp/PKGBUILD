# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: Road Tang <roadtang_AT_gmail.com>
pkgname=tijmp
pkgver=0.8
pkgrel=1
pkgdesc="TIJmp is a memory profiler for java, similar to JMP. TIJmp is made for java/6 and later," 
arch=(i686)
url="http://www.khelekore.org/jmp/tijmp"
license=('GPL')
groups=()
depends=('java-environment>=6')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=tijmp.install
source=($url/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('dedbb52127ee44f593be9f75648b3786')
#generate with 'makepkg -g'

build() {
  cd "$startdir/src/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$startdir/pkg" install
}

# vim:set ts=2 sw=2 et:
