pkgname=minitube
pkgver=1.7.1
pkgrel=2
pkgdesc="A native YouTube client in QT. Watch YouTube videos without Flash Player"
arch=('i686' 'x86_64')
url="http://flavio.tordini.org/minitube"
license=('GPL')
depends=('phonon' 'qt>=4.6')
optdepends=('phonon-xine: for xine backend'
            'phonon-gstreamer: for gstreamer backend'
            'gstreamer0.10-plugins: to get all videos to play with phonon-gstreamer'
	    'phonon-vlc: for vlc backend'
            'phonon-mplayer-git: for mplayer backend (from AUR)')
install=minitube.install
source=(http://flavio.tordini.org/files/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('0a0dc5f59dc5343f0928c428220c0cdc52014848399916a0741b999a8730acae')

build() {
        cd "${srcdir}"/${pkgname}
	qmake PREFIX="/usr"
}
package() {
	cd "${srcdir}"/${pkgname}
        make install INSTALL_ROOT="${pkgdir}"
}

