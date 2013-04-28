# Maintainer: Army
_pkgname=tinyalsa
pkgname=$_pkgname-git
pkgver=20121214.77
pkgrel=1
pkgdesc="Tiny library to interface with ALSA in the Linux kernel"
arch=('i686' 'x86_64')
url="https://github.com/tinyalsa/tinyalsa"
license=('GPL')
depends=('glibc')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+git://github.com/tinyalsa/tinyalsa.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo "$(git log -1 --format="%cd" --date=short | sed 's|-||g').$(git rev-list --count master)"
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 "tinycap" "$pkgdir/usr/bin/tinycap"
  install -Dm755 "tinymix" "$pkgdir/usr/bin/tinymix"
  install -Dm755 "tinypcminfo" "$pkgdir/usr/bin/tinypcminfo"
  install -Dm755 "tinyplay" "$pkgdir/usr/bin/tinyplay"
  install -Dm644 "libtinyalsa.so" "$pkgdir/usr/lib/libtinyalsa.so"
}

# vim:set ts=2 sw=2 et:
