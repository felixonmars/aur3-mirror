# Maintainer: kiooeht <kiooeht at gmail dot com>

pkgname=consoletube
pkgver=1.1
pkgrel=1
pkgdesc="Play Youtube videos in VLC"
arch=('any')
url="http://bogh.us/code/consoletube/"
license=('unknown')
depends=('lynx' 'vlc>=2.0.1')
source=(http://bogh.us/code/consoletube/consoletube)

md5sums=('f52a168b20a64d2437f6dc1b26c1981d')

package() {
    cd $srcdir
    install -D -m 755 consoletube $pkgdir/usr/bin/consoletube
}
