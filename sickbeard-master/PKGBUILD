# Maintainer: Jon Eyolfson <jon@eyl.io>

pkgname=sickbeard-master
pkgver=r3652.577fdba
pkgrel=1
pkgdesc="PVR & episode guide that downloads and manages all your TV shows"
arch=('any')
url="http://sickbeard.com/"
license=('GPL3')
depends=('python2' 'python2-cheetah')
makedepends=('git')
conflicts=('sickbeard' 'sickbeard-git')
source=("$pkgname::git://github.com/midgetspy/Sick-Beard.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  echo "$(git rev-parse HEAD)" > 'version.txt'
  rm -f -r 'tests'
  rm -f 'CONTRIBUTING.md'
  rm -f 'COPYING.txt'
  rm -f 'init.'*
  rm -f 'readme.md'
  sed -i 's/env python/env python2/g' 'SickBeard.py'
  sed -i 's/env python/env python2/g' 'autoProcessTV/sabToSickBeard.py'
  sed -i 's/env python/env python2/g' 'autoProcessTV/hellaToSickBeard.py'
}

package() {
  mkdir -p "$pkgdir/opt/sickbeard"
  cp -r "$srcdir/$pkgname/"* "$pkgdir/opt/sickbeard"
  find "$pkgdir/opt" -type d -exec chmod 755 {} \;
  find "$pkgdir/opt" -type f -exec chmod 644 {} \;
  chmod 755 "$pkgdir/opt/sickbeard/SickBeard.py"
  chmod 755 "$pkgdir/opt/sickbeard/autoProcessTV/sabToSickBeard.py"
  chmod 755 "$pkgdir/opt/sickbeard/autoProcessTV/hellaToSickBeard.py"
}
