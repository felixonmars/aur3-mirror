pkgname=mps-youtube
pkgver=0.2.1
pkgrel=2

pkgdesc="Terminal based YouTube jukebox with playlist management"
url='https://github.com/np1/mps-youtube'
arch=('any')
license=('GPL3')

depends=('python' 'python-setuptools' 'python-pafy')
optdepends=('mpv: Alternative to mplayer for playback'
            'mplayer: Alternative to mpv for playback'
            'ffmpeg: for transcoding downloaded content'
            'xclip: for copying content to the clipboard')

install=mps-youtube.install
source=("https://github.com/np1/mps-youtube/archive/v$pkgver.tar.gz")

sha256sums=('858db8a0c075bcb7f3bab22fbace7e0ce4d1eba142a2d26e8d71ae3503d23249')

package() {
	cd mps-youtube-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1
}
