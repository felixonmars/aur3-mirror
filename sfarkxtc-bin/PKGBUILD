# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: kfgz <kfgz at interia pl>
# Contributor: Shinlun Hsieh <yngwiexx at yahoo dot com dot tw>
# Contributor: Lone_Wolf <lonewolf at xs4all dot nl>

pkgname=sfarkxtc-bin
pkgver=1.03
pkgrel=1
pkgdesc="Decompressor for sfArk SoundFonts"
arch=('i686' 'x86_64')
url="http://melodymachine.com/sfark.htm"
license=('custom')
depends=('libstdc++5')
[[ "$CARCH" == "x86_64" ]] && \
depends=('lib32-libstdc++5')
provides=('sfarkxtc')
source=(http://falcony.googlecode.com/files/sfarkxtc_lx86.tar.gz license)
md5sums=('3350e57ed3d09e9477d125dfc23e21f1'
         '0aac11e027a3c9f4ead6b1e13874168f')

package() {
  # bin
  install -Dm755 sfarkxtc \
    "$pkgdir/usr/bin/sfarkxtc-bin"

  # license
  install -Dm644 license \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
