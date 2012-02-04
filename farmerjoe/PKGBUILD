# Contributor: John Gerritse <reaphsharc@gmail.com>
pkgname=farmerjoe
pkgver=0.1.3
pkgrel=2
pkgdesc="Farmerjoe is a distributed rendering system for Blender."
arch=('i686')
url="http://farmerjoe.info/"
license=('GPL2')
depends=('blender' 'imagemagick')
install=$pkgname.install
source=(http://farmerjoe.info/$pkgname/$pkgver/Farmerjoe_$pkgver.zip $pkgname.patch)
md5sums=('1b976bd992778c3c1daeef2366e8bcb0'
         '47bce801ea84260fd7a7bb532b9701b6')

build() {
  cd "$startdir/src/Farmerjoe_$pkgver"
  patch -p0 -i "$startdir/src/farmerjoe.patch" ||return 1
  install -Dm755 "Farmerjoe.linux" "$startdir/pkg/opt/farmerjoe/farmerjoe"
  install -Dm644 "Farmerjoe.conf" "$startdir/pkg/opt/farmerjoe/Farmerjoe.conf"
  install -Dm644 "README.html" "$startdir/pkg/usr/share/doc/farmerjoe/README.html"
  install -Dm644 "bin/farmerjoe_bucket.py" "$startdir/pkg/usr/share/blender/scripts/farmerjoe_bucket.py"
  install -Dm644 "bin/farmerjoe_submit.py" "$startdir/pkg/usr/share/blender/scripts/farmerjoe_submit.py"

}

# vim:set ts=2 sw=2 et:
