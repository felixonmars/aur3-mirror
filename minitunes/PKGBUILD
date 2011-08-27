# Maintainer: dieghen89 <dieghen89@gmail.com>

pkgname=minitunes
pkgver=1.0
pkgrel=1
pkgdesc="Just another music player, only better"
arch=('i686' 'x86_64')
url="http://flavio.tordini.org/minitunes"
license=('GPL3')
depends=('qt>=4.5' 'desktop-file-utils' 'hicolor-icon-theme' 'phonon' 'taglib' 'sqlite3')
optdepends=('gstreamer0.10-plugins: for gstreamer backend'
            'phonon-gstreamer: gstreamer backend'
            'phonon-mplayer-git: mplayer backend'
            'phonon-vlc: vlc backend'
            'phonon-xine: xine backend')
conflicts=($pkgname-git)
source=(http://flavio.tordini.org/files/minitunes/${pkgname}-${pkgver}.tar.gz)
md5sums=('af75ec3a42fc02a10d4c530bbd149a8d')

build() {
  cd ${srcdir}/${pkgname}
  qmake PREFIX=/usr
}

package() {
  cd ${srcdir}/${pkgname}
  make INSTALL_ROOT=${pkgdir} install
  install -Dm644 ${srcdir}/${pkgname}/data/128x128/${pkgname}.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
}
