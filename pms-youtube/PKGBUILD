# Maintainer: Johannes Löthberg <johannes@kyriasis.com>

pkgname=pms-youtube
pkgver=0.01.11
pkgrel=2
pkgdesc="Terminal based YouTube jukebox with playlist management"
arch=('any')
url='https://github.com/np1/pms-youtube'
license=('GPL3')
depends=('python' 'python-pafy')
optdepends=('mpv: Alternative to mplayer for playback'
			'mplayer: Alternative to mpv for playback')
install=pms-youtube.install
source=('https://github.com/np1/pms-youtube/archive/v0.01.11.tar.gz' 'pms-youtube.install')
md5sums=('be219e38380beef0b4bf5af78b7f0ba1'
         '60f96ac1aa29a2024d2213004636bee8')

package() {
	cd pms-youtube-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1
}
