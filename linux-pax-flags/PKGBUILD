# Contributors:
#   henning mueller <henning@orgizm.net>

pkgname=linux-pax-flags
pkgdesc='Deactivates PaX flags for several binaries to work with PaX enabled kernels.'
pkgver=2.0.1
pkgrel=1
arch=(any)
url='https://aur.archlinux.org/packages.php?ID=55491'
license=(GPL3)
depends=(ruby paxctl)
source=(
  $pkgname.sh
  $pkgname.rb
  clamav.conf
  games.conf
  java.conf
  polkit.conf
  qemu.conf
  simple.conf
  steam.conf
  valgrind.conf
)
sha256sums=(
  8c275d489eba44960699be6064fd5ca75db599afccd9411c489ae1112fed3d23
  4b58966de32475026645b6411e07c287d4d6f2339f1bc50754f5b3ed2c3147ad
  d59c776bfc3f45e4058f36088520a21b92e2c0b6fd886844443c308a67592335
  9bf238512e276dd2e34bed37760afaa10235afa477a0f0c3a59913999c723967
  95d49a8b0b682a77cf41f2bec3e7ff01df30308af27e74a25386142a5d5cc1e3
  5dbc16f447c0c8b73fdc153ae7c0dddd16ea1479ca7c93cff829944d416ef861
  8d31a0c296ad2a3d5be8eb21d7716423553c1458f30163bb27453f54793ab2d2
  36fa2ddd9066f1e9867d0479ee23cb8e1f8ffdc5d3250b31c7e48015d9837e17
  1f21f2c09f92e6ff1a340ca08633c0bf47d544fba53ffa59793663ec625f3be1
  94b64139cad2b55e09770b992d80a8e8bb6d0326cc5a9ec31b9b9a07e4091b25
)

package() {
  install -D -m755 $srcdir/$pkgname.sh $pkgdir/usr/bin/$pkgname
  install -D -m755 $srcdir/$pkgname.rb $pkgdir/usr/bin/$pkgname.rb

  for config in $srcdir/*.conf; do
    install -D -m600 $config $pkgdir/usr/share/$pkgname/$(basename $config)
  done

  mkdir -p $pkgdir/etc/pax-flags
}
