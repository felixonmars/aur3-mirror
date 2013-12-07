# Contributors:
#   henning mueller <henning@orgizm.net>
#   Ahmad24, duncant, echoblack, niki, ShadowKyogre, s1gma, test0
#
# Find this package in the AUR:
#   https://aur.archlinux.org/packages/linux-pax-flags
#
# Please report bugs and new flags on GitHub:
#   https://github.com/nning/linux-pax-flags
#

pkgname=linux-pax-flags
pkgdesc='Deactivates PaX flags for several binaries to work with PaX enabled kernels.'
pkgver=2.0.13
pkgrel=5
arch=(any)
url='https://github.com/nning/linux-pax-flags'
license=(GPL3)
depends=(ruby paxctl)
optdepends=('sudo: Run as root automatically.')
source=(
  $pkgname.sh $pkgname.rb $pkgname.8
  android.conf clamav.conf games.conf java.conf kde.conf polkit.conf qemu.conf
  ruby.conf simple.conf skype.conf steam.conf valgrind.conf
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

sha256sums=('8581506830903ffcbb0876e4380d660ff044d9805d68f1432753c5bb99dc0db9'
            '4eaab9347a35c39f13e23866da943b21e4e26bc882b066ef504e4374d9a79311'
            '2020957abcd75d71b7f7dcca49eb3ff5f655eb69a306159eaf2e7d3a60c1ad5c'
            '7031e80b04bbc2a3f720b7d8e1d32bf9c972be0a7baebaa68bcf3cdfde94b45c'
            'bb87f4dce8e20f2ce601bdcb888dd688d8f0e9d0ab367e09c8081daffa15b03a'
            'c1b365817c280a628cfd36eb88e4b51bcc89b8aa263374e0db215b59ce15d821'
            '71afe786955d149fe216ff1a60348562914a6820d3b7f9dc42aa44913062b04e'
            '01ddeec77c605e1d3aa00a1fdc4c3537989468ab78da5f37b893cdbcfe34176c'
            '1f205fddfb427a696fb00221a3007453e25fbbf180ea026c264d23eeac9e1870'
            '2736d0ef20d0127c34e132db38d8993dee3062ba0ac0cdf8d444a8d3665698b8'
            'aa6d27c7a7535b409fcb459f0a7a565d21c325ac9abb9524af509fc50ea34ccf'
            '2fdf86eb57c368b2490395473770b6c0b3e6951d6bb6dfc0b20b22434e47522a'
            '459925589cc1c7b3c4e548c0ab30ae8c8780d093d6ff2bfc3c27e9712b032c9e'
            'ae3b28c66001884bc6338024daf76d3923265411e5632778ad69849b8f81a004'
            'ea003c4201745cd0c4bcf5cec5ca2d0a79cc6b1b04ceaa276ace0ad0287b8c50')
