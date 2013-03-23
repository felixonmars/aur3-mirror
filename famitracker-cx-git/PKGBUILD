# Maintainer: Carlos Solis <csolisr@riseup.net>
pkgname=famitracker-cx-git
pkgver=20130322
pkgrel=1
pkgdesc="NES/Famicom music tracker for Linux (GIT version)"
arch=('i686' 'x86_64')
url="http://code.google.com/p/famitracker-cx/"
license=('GPL')
source=('famitracker-cx.desktop')
depends=('qt4' 'boost' 'ncurses' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('cmake')
optdepends=('alsa-lib: For ALSA output support' 'jack: For JACK output support')
install='famitracker-cx.install'
md5sums=('9fefb364b1548e52a7ecf26ce29b3c98')
_gitroot='http://code.google.com/p/famitracker-cx/'
_gitname='famitracker-cx'

build() {
  cd "$srcdir"
  msg "Connecting to GIT server..."
  if [ -d "$_gitname" ] ; then
    cd "$_gitname" && git pull origin
    cd "${srcdir}"
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi
  msg "GIT checkout done or server timeout"
  cd "${srcdir}/$_gitname"
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DQT_QMAKE_EXECUTABLE=qmake-qt4 .
}

package() {
  cd "${srcdir}/$_gitname"
  install -d ${pkgdir}/usr/share/applications/
  install -d ${pkgdir}/usr/share/icons/hicolor/128x128/apps/
  install -m644 ${srcdir}/famitracker-cx.desktop ${pkgdir}/usr/share/applications/
  install -m644 ${srcdir}/$_gitname/src/qt-gui/res/famitracker.png ${pkgdir}/usr/share/icons/hicolor/128x128/apps/famitracker.png
  make all install DESTDIR="${pkgdir}"
}
