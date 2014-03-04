# Maintainer: Johannes Löthberg <johannes@kyriasis.com>

pkgname=mps-youtube
pkgver=0.01.37
pkgrel=1
pkgdesc="Terminal based YouTube jukebox with playlist management"
arch=('any')
url='https://github.com/np1/mps-youtube'
license=('GPL3')
depends=('python' 'python-pafy')
optdepends=('mpv: Alternative to mplayer for playback'
			'mplayer: Alternative to mpv for playback')
install=mps-youtube.install
source=("https://github.com/np1/mps-youtube/archive/v$pkgver.tar.gz")
md5sums=('8946464242ba06583c50f662dc52c96e')

package() {
	cd mps-youtube-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1
}
