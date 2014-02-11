# Maintainer: Johannes Löthberg <johannes@kyriasis.com>

pkgname=pms-youtube-git
pkgver=0.01.10.r0.g87bb816
pkgrel=1
pkgdesc="Terminal based YouTube jukebox with playlist management"
arch=('any')
url='https://github.com/np1/pms-youtube'
license=('GPL3')
depends=('python' 'python-pafy-git')
optdepends=('mpv: Alternative to mplayer for playback'
			'mplayer: Alternative to mpv for playback')
conflicts=('pms-youtube')
install=pms-youtube-git.install
source=('git+https://github.com/np1/pms-youtube.git' 'pms-youtube-git.install')
md5sums=('SKIP'
		 '7c2994cd8ba7ad43aa02e01679980c34')

pkgver() {
	cd pms-youtube
	git describe --tags --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
	cd pms-youtube
	python setup.py install --root="$pkgdir" --optimize=1
}

# vim: set ts=4 sts=4 sw=4 noet:
