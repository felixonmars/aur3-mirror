# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=vivia
pkgver=0.1.1
pkgrel=4
pkgdesc="A video editing program based on QT4 that offers very user-friendly editing of DV video material"
arch=(i686 x86_64)
url="http://vivia-video.org/"
license="GPL"
depends=('ffmpeg' 'libgl' 'qt4')
makedepends=('nasm')
source=(http://dl.sourceforge.net/sourceforge/vivia/vivia-source-${pkgver}-20061218.tar.bz2 \
        vivia.desktop \
	vivia_strings.patch)
md5sums=('2a0b9788ce2f0977d52a6ed695df966b' '9e28e05c614581fdde298db2747dfad7'\
         '669818949f586ebeb91defbc0e838c3c')

build() {
  cd ${startdir}/src/${pkgname}/src/

  # Minor modifications of strings
  patch -Np2 -i ${startdir}/src/vivia_strings.patch || return 1

  # Source QT4 profile
  [ -f /etc/profile.d/qt4.sh ] && source /etc/profile.d/qt4.sh

  ${QTDIR}/bin/qmake CONFIG+=distffmpeg
  make || return 1

  # Install vivia binary
  install -D -m755 vivia ${startdir}/pkg/usr/bin/vivia

  # Install menu shortcut and icon
  install -D -m644 ${startdir}/src/vivia.desktop ${startdir}/pkg/usr/share/applications/vivia.desktop
  install -D -m644 images/appicon64.png ${startdir}/pkg/usr/share/pixmaps/vivia.png
}
