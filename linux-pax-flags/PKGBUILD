# Contributors:
#   henning mueller <henning@orgizm.net>

pkgname=linux-pax-flags
pkgdesc='Deactivates PaX flags for several binaries to work with PaX enabled kernels.'
pkgver=2.0.6
pkgrel=1
arch=(any)
url='https://aur.archlinux.org/packages.php?ID=55491'
license=(GPL3)
depends=(ruby paxctl)
source=(
  $pkgname.sh $pkgname.rb $pkgname.8
  clamav.conf games.conf java.conf kde.conf polkit.conf qemu.conf ruby.conf
  simple.conf steam.conf valgrind.conf
)
sha256sums=(
  6a946648999007bee1f48513a7f0ec91977c038ec59bee3ad19cebcdcabd48ac
  01fd9633bc11a5b69f5210929d469233b92889b3163506415471072dc4702a76
  d904705ab409c8bfebfd9afd415201de6152acdd5eb3a23a07c94ae6389bc545
  bb87f4dce8e20f2ce601bdcb888dd688d8f0e9d0ab367e09c8081daffa15b03a
  a31a938b191cb11a27fbb6b1f89ec0f844ab1a1d9a1bbc3cae2fac5b477cec02
  f53647989743d696714549b87baac7509e136acce004d9f452de88cf369d4296
  9dcaaf7a2477cd98b423e641c99c27970dad8a796f8d531cfd8e52c77ce5aae6
  1f205fddfb427a696fb00221a3007453e25fbbf180ea026c264d23eeac9e1870
  2736d0ef20d0127c34e132db38d8993dee3062ba0ac0cdf8d444a8d3665698b8
  2f5c2c17dde807c55c37aea5af06d2d3e7f329555441312846121fd4848307bb
  03f4637bc88c03b1f4b26b202f25b0a631e2bef8fd9b5040b8affb4a406826a5
  e1704c35f059b97d5eb3d34822c57535e18c7a5c276ffa265f0bb6a8f836aada
  ea003c4201745cd0c4bcf5cec5ca2d0a79cc6b1b04ceaa276ace0ad0287b8c50
)

package() {
  install -D -m755 $srcdir/$pkgname.sh $pkgdir/usr/bin/$pkgname
  install -D -m755 $srcdir/$pkgname.rb $pkgdir/usr/bin/$pkgname.rb
  install -D -m644 $srcdir/$pkgname.8  $pkgdir/usr/share/man/man8/$pkgname.8

  for config in $srcdir/*.conf; do
    install -D -m600 $config $pkgdir/usr/share/$pkgname/$(basename $config)
  done

  mkdir -p $pkgdir/etc/pax-flags
}
