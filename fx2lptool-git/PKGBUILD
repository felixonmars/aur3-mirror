# Maintainer: Andreas Wagner <andreas.wagner@lowfatcomputing.org>
_pkgname=fx2lptool
pkgname=$_pkgname-git
pkgver=20.1cfac1a
pkgrel=1
pkgdesc="Tool to manipulate Cypress EZ-USB FX2LP devices. Namely, it lets you easily change the USB vendor/product IDs stored in the devices' EEPROM."
arch=('x86_64' 'i686')
url="https://github.com/DrMcCoy/FX2LPTool"
license=('GPL2')
groups=()
depends=()
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
replaces=()
backup=()
options=()
install=
source=("${pkgname}::git+https://github.com/DrMcCoy/FX2LPTool.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$pkgname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"

  #software
  make DESTDIR=$pkgdir install

  # docs
  install -Dm644 README.md $pkgdir/usr/share/doc/$_pkgname/README.md
  install -Dm644 TODO $pkgdir/usr/share/doc/$_pkgname/TODO

  #licensing
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$_pkgname/COPYING
}

# vim:set ts=2 sw=2 et:
