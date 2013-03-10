# $Id$

pkgname=smokinguns-custom_mappack1
_originalpkgrel=1
pkgver=1.1_${_originalpkgrel}
pkgrel=1
pkgdesc="Smokin' Guns custom map pack"
url="http://forum.smokin-guns.org/viewtopic.php?f=33&t=3185"
arch=('any')
license=('custom')
depends=('smokinguns')
source=(
"http://dansh.org/deb/main/smokinguns-custom_mappack1_${pkgver/_/-}_all.deb"
)
md5sums=(
'0b3f52b2c6dc2f8851f694057d1e8be4'
)
sha1sums=(
'6b8e88b7784c15cbe7cb915e6df68fe66826a2c0'
)
sha256sums=(
'c27006f4a86a13e101c80e337ba21693832e0ef78565d038f6ed20c0459118b2'
)
sha384sums=(
'be15bc857e34810948f8ee0552e7249893f08e974323159caef26ba5e2bc1ede97531b037e0961258f5a7aa5bf170fb4'
)
sha512sums=(
'c5c112d8ff660364f3d0f9fce733fd7f9b4caf36ca26a906e4f823c0de9c1427915dc65e996ef404def8fafd011cc1deb29cf81e6ad7b021f947d47f3267f937'
)

package() {
  cd "$srcdir"
  bsdtar -xf data.tar.gz
  install -d "$pkgdir/usr/share/smokinguns/smokinguns/"
  install -m644 usr/share/games/smokinguns/smokinguns/* "$pkgdir/usr/share/smokinguns/smokinguns/"
}

# vim:set ts=2 sw=2 et:
