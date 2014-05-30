# Maintainer: Johannes Löthberg <johannes@kyriasis.com>

pkgname=mps-youtube
pkgver=0.01.46
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
sha256sums=('f2e1287ac5f54b576eb695cd6e8dd1ebb3f642943ca335ca545b6d4108d59397')

package() {
	cd mps-youtube-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1
}
