# Maintainer: Johannes Löthberg <johannes@kyriasis.com>

pkgname=mps-youtube
pkgver=0.01.32
pkgrel=2
pkgdesc="Terminal based YouTube jukebox with playlist management"
arch=('any')
url='https://github.com/np1/mps-youtube'
license=('GPL3')
depends=('python' 'python-pafy')
optdepends=('mpv: Alternative to mplayer for playback'
			'mplayer: Alternative to mpv for playback')
install=mps-youtube.install
source=('https://github.com/np1/mps-youtube/archive/v0.01.32.tar.gz' 'mps-youtube.install')
md5sums=('e2c7c2428d712fd8f447998d870cd9a7'
         '60f96ac1aa29a2024d2213004636bee8')

package() {
	cd mps-youtube-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1
}
