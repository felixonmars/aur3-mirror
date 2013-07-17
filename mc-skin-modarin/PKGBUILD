# Maintainer: lava <lava.mailbox@gmail.com>

pkgname=mc-skin-modarin
pkgver=1.2
pkgrel=2
pkgdesc='256-color skin for Midnight Commander'
arch=(any)
license=('GPL')
url=('https://www.midnight-commander.org/ticket/2737')
depends=('mc<4.8.9-1')
optdepends=('mc-skin-modarin-debian: Debian variant of the skin with thin lines')
source=("http://www.midnight-commander.org/raw-attachment/ticket/2737/modarin-$pkgver.tar.gz")
md5sums=('c35d57ad0a4d681ab3bf9b3cc4414ade')

package() {
    cd $srcdir
    mkdir -p $pkgdir/usr/share/mc/skins
    cp $srcdir/modarin-$pkgver/* $pkgdir/usr/share/mc/skins/
}

