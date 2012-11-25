# Maintainer: rwd https://bbs.archlinux.org/profile.php?id=22878
pkgname=acdcontrol
pkgver=0.4
pkgrel=2
pkgdesc="Apple Cinema Display backlight control"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/acdcontrol/"
license=('GPL')
depends=(gcc-libs)
source=(
    "http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz/download"
    "product_id.diff"
    )
md5sums=(
    "13393bac07dc7fb88638c701cade2833"
    "e29182d48170ca14f0a60e38a1fda7c6"
    )
build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -uN acdcontrol.cpp ../product_id.diff || return 1
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m 755 acdcontrol "$pkgdir/usr/bin/acdcontrol"
}

# vim:set ts=2 sw=2 et:
