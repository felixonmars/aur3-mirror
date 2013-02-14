# Contributors:
#   henning mueller <henning@orgizm.net>

pkgname=linux-pax-flags
pkgdesc='Deactivates PaX flags for several binaries to work with PaX enabled kernels.'
pkgver=2.0.4
pkgrel=2
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
  kde.conf
  polkit.conf
  qemu.conf
  ruby.conf
  simple.conf
  steam.conf
  valgrind.conf
)
sha256sums=(
  6a946648999007bee1f48513a7f0ec91977c038ec59bee3ad19cebcdcabd48ac
  4b58966de32475026645b6411e07c287d4d6f2339f1bc50754f5b3ed2c3147ad
  d59c776bfc3f45e4058f36088520a21b92e2c0b6fd886844443c308a67592335
  9bf238512e276dd2e34bed37760afaa10235afa477a0f0c3a59913999c723967
  95d49a8b0b682a77cf41f2bec3e7ff01df30308af27e74a25386142a5d5cc1e3
  d43bb5c5c8f18f565eb41993ed198d910a1d2fcf0d4c1c0db889dd38fa59e144
  5dbc16f447c0c8b73fdc153ae7c0dddd16ea1479ca7c93cff829944d416ef861
  8d31a0c296ad2a3d5be8eb21d7716423553c1458f30163bb27453f54793ab2d2
  a8a7307dc640c1d7c9b17f6e6ed2dab53b89ffe7b3e432b1ced71a67fc182df4
  44ba6a9c4d8af908424f5027afc4f2e93634d16ffda54fd5cfb27aaf06ac4cfb
  467bf43ba9dcafb2e76eeb2a6cd5364e6e73f64e33c3487c7ecdbd7aedb756fa
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
