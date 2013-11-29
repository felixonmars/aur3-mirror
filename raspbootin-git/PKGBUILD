# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
_pkgname=raspbootin
pkgname=$_pkgname-git
pkgver=3.49cf35f
pkgrel=1
pkgdesc="Simple boot-over-serial bootloader for the Raspberry Pi"
arch=('i686' 'x86_64')
url="https://github.com/mrvn/raspbootin"
license=('GPL3')
makedepends=('git' 'arm-none-eabi')
provides=($_pkgname)
conflicts=($_pkgname)
source=("${_pkgname}::git+https://github.com/mrvn/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$_pkgname"
  make PREFIX=/usr
}

package() {
  cd "$_pkgname"
  mkdir -p $pkgdir/usr/{bin,share/$_pkgname}

  install -Dm644 README.md $pkgdir/usr/share/$_pkgname
  install -Dm644 raspbootin/kernel.img $pkgdir/usr/share/$_pkgname
  install -Dm755 raspbootcom/raspbootcom $pkgdir/usr/bin
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
} 
# vim:set ts=2 sw=2 et:
