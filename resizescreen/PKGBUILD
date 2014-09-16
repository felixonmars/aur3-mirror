# Maintainer: Stephen Bell <theredbaron1834@yahoo.com>

pkgname=resizescreen
pkgver=1
pkgrel=1
pkgdesc="A simple wrapper around xrandr --panning/scale to boost virtual screen size. Ideal for netbooks."
arch=('any')
url="https://github.com/theredbaron1834/Scripts"
license=('GPL')
depends=('xorg-xrandr')
source=('git://github.com/theredbaron1834/Scripts.git')
md5sums=('SKIP')


package() {
  cd "$srcdir/Scripts"
  install -Dm755 "$srcdir/Scripts/resizescreen" "$pkgdir/usr/bin/resizescreen"
}
