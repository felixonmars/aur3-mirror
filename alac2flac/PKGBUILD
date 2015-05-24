# Maintainer: Evan Penner <evaninrussia@gmail.com>
pkgname=alac2flac
pkgver=2015.5.23
pkgrel=1
pkgdesc="Script to convert ALAC to FLAC."
arch=(any)
depends=('php' 'libmp4v2' 'mplayer' 'flac')
license=('custom:cc-by-nc-sa')
url=('http://www.slello.com')
source=(alac2flac)
md5sums=('912f192474b3795fe8e5c4d49d7d1447')

package() {
install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
