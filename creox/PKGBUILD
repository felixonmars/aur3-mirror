# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=creox
pkgver=0.2.2rc2
pkgrel=6
pkgdesc="Real-time sound processor using the JACK audio server"
arch=(i686 x86_64)
url="http://zyzstar.kosoru.com/?creox"
license="GPL"
depends=('jack-audio-connection-kit' 'kdelibs')
source=(http://zyzstar.kosoru.com/projects/creox/downloads/${pkgname}-${pkgver}.tar.bz2 \
        ${pkgname}-${pkgver}-cerrno.patch)
md5sums=('11d87ad6d47274fdf3f3236f5e09d6fd' '33eadebcf72839695345f9598a8ca8e5')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}/

  patch -Np1 -i ../${pkgname}-${pkgver}-cerrno.patch || return 1

  # Source the KDE and QT profiles
  [ -f /etc/profile.d/kde.sh ] && source /etc/profile.d/kde.sh
  [ -f /etc/profile.d/qt.sh ] && source /etc/profile.d/qt.sh

  ./configure --prefix=/opt/kde --disable-debug
  make || return 1
  make DESTDIR=${startdir}/pkg install

  # Add Categories to menu shortcut
  sed -e '/Name=creox/ aCategories=Qt;KDE;AudioVideo;Audio;' \
      -i ${startdir}/pkg/opt/kde/share/applnk/Applications/creox.desktop
}
