pkgname=mps-youtube
pkgver=0.2.0
pkgrel=2

pkgdesc="Terminal based YouTube jukebox with playlist management"
url='https://github.com/np1/mps-youtube'
arch=('any')
license=('GPL3')

depends=('python' 'python-pafy')
makedepends=('python-setuptools')
optdepends=('mpv: Alternative to mplayer for playback'
            'mplayer: Alternative to mpv for playback'
            'ffmpeg: for transcoding downloaded content'
            'xclip: for copying content to the clipboard')

install=mps-youtube.install
source=("https://github.com/np1/mps-youtube/archive/v$pkgver.tar.gz")

sha256sums=('96d83868dc19a916119772ca00378b2a500a70eaedf9f217c508c673cd1e3f17')

package() {
	cd mps-youtube-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1
}
