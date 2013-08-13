# Maintainer: Evan Teitelman <teitelmanevan@gmail.com>

pkgname=sm-git
pkgver=b5b696b
pkgrel=1
pkgdesc="S{cripting,ystem,tack} Management (SM) Framework (Core)"
arch=('i686' 'x86_64')
url="https://bdsm.beginrescueend.com/"
license=("Apache License, Version 2.0")
depends=("zsh")
makedepends=("git")
provides=('sm')
conflicts=('bdsm' 'sm')
source=('git+https://github.com/sm/sm')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/sm"
  git describe --always | sed 's|-|.|g'
}

package() {
  cd "$srcdir/sm"

  # Note: This install file downloads sources.
  ./install DESTROOT "$pkgdir/" --prefix=/usr/share

  # This references '$pkgdir' instead of the install location.
  rm -rf "$pkgdir/etc/profile.d"

  # Fix bin location.
  mv "$pkgdir/usr/share/sm/bin"  "$pkgdir/usr"
}
