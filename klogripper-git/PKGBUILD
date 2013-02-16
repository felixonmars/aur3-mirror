# Maintainer: Max Rosin <archlinux at maxrosin dot com>
pkgname=klogripper-git
pkgver=20130216
pkgrel=1
pkgdesc="Kernel log ripper, i.e. a union of dmesg and tail -f"
arch=('i686' 'x86_64')
url="http://git.goodpoint.de/?p=klogripper.git;a=summary"
license=('GPL2')
depends=('glibc')
makedepends=('git')

_gitbase="git://git.goodpoint.de/klogripper.git"

build() {
  git clone $_gitbase $pkgname-$pkgver
  cd "$srcdir/$pkgname-$pkgver"
  git checkout ae4fc7ef9d09f0968040906e56b6ba3c68b48f62 
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/bin"
  cp "$srcdir/$pkgname-$pkgver/klogripper" "$pkgdir/usr/bin/klogripper"
}
