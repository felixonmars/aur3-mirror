# Maintainer: Daniel Mendler <mail at daniel-mendler.de>
# Contributor: Daniel Mendler <mail at daniel-mendler.de>
pkgname=pacgem
pkgver=0.9.6
pkgrel=1
pkgdesc="Install Ruby Gems as Arch Linux packages"
arch=('any')
url="http://github.com/minad/pacgem"
license=('GPL')
depends=('ruby')
source=('pacgem' 'pacgem.8')
sha256sums=('84aa89cfa0f35ac7d5ccabd075b87f257f2c620351cbe5934db952608a8caa5a'
            '1a0205c77391b6ae2503a6d8027e2fb45dac49e39676c899dfd156ddf4ec5769')
conflicts=('pacgem-git')

package() {
  install -D -m755 $srcdir/pacgem $pkgdir/usr/bin/pacgem
  install -D -m644 $srcdir/pacgem.8 $pkgdir/usr/share/man/man8/pacgem.8
}
