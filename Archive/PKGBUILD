# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=jahshaka
pkgver=2.0
pkgrel=6
pkgdesc="Video and film compositing, editing, and special effects system that uses OpenGL & OpenML hardware rendering"
arch=(i686 x86_64)
url="http://www.jahshaka.org/"
license="GPL"
depends=('openlibraries' 'qt')
source=(http://dl.sourceforge.net/sourceforge/jahshakafx/${pkgname}.tar.gz \
        jahshaka.desktop)
md5sums=('55d81452c6ede254bb78139659530a54' '4e924583f7fbe83286908a79051ba307')

build() {
  cd ${startdir}/src/${pkgname}/

  # Source the QT profile
  [ -f /etc/profile.d/qt.sh ] && source /etc/profile.d/qt.sh

  ./configure --prefix=/usr --enable-openalframework --disable-debug
  make || return 1
  make INSTALL_ROOT=${startdir}/pkg install

  # Install menu shortcut
  install -D -m644 ../jahshaka.desktop ${startdir}/pkg/usr/share/applications/jahshaka.desktop

  # Remove jahplayer files
  rm -R ${startdir}/pkg/usr/share/jahshaka/Pixmaps/jahplayer
}
