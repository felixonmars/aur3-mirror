# Maintainer leper <blubblub@mail.ru>

pkgname=smokinguns-data
pkgver=1.1
pkgrel=1
pkgdesc='A semi-realistic simulation of the "old west" great atmosphere built on id Tech 3. (data files)'
url="http://www.smokin-guns.org"
arch=('any')
# See http://forum.smokin-guns.org/viewtopic.php?f=33&t=3172#p24334
license=('custom')
depends=()
makedepends=()
source=('http://www.smokin-guns.org/downloads/Smokin_Guns_1.1.zip')
md5sums=('f6eac64fa534fa9ff121dda5fd2dba44')

package() {
  cd "$srcdir/Smokin' Guns $pkgver"
  install -d "$pkgdir/usr/share/${pkgname%%-*}/baseq3"
  install -m 644 baseq3/* "$pkgdir/usr/share/${pkgname%%-*}/baseq3"
  install -d "$pkgdir/usr/share/${pkgname%%-*}/smokinguns"
  install -m 644 smokinguns/* "$pkgdir/usr/share/smokinguns/smokinguns"
}

# vim:set ts=2 sw=2 et:
