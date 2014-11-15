# Maintainer: Dieter Hsu <dieterplex@gmail.com>

pkgbase=sysd
pkgname=$pkgbase-git
pkgver=0.5.0
pkgrel=3
pkgdesc="sysd: The daemon who supplies firsthand system data"
url="https://github.com/hacking-thursday/$pkgbase/"
arch=('x86_64' 'i686')
license=('Apache')
depends=('go')
makedepends=('make' 'patch' 'git')
options=('!strip' '!emptydirs')
source=("git+https://github.com/hacking-thursday/sysd.git#branch=devel")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgbase"
  git describe --tags --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgbase"
  msg2 'prepare vendor libs..'
  ./configure
  msg2 'build sysd..'
  make build
}

package() {
  cd "$srcdir/$pkgbase"
  install -Dm755 "$pkgbase/$pkgbase" "$pkgdir/usr/sbin/$pkgbase"
  local uidir="$pkgdir/usr/share/$pkgbase/"
  mkdir -p "$uidir"
  cp -a "mods/ui/files" "$uidir/webui"
}

# vim:set ts=2 sw=2 et:
