# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=ihu
pkgver=0.6.0
pkgrel=1
pkgdesc="I Hear U is a VoIP application that creates an audio stream between two computers easily"
arch=('i686' 'x86_64')
url="http://ihu.sourceforge.net/"
license=('GPL')
depends=('alsa-lib' 'gmp' 'qt3' 'speex')
makedepends=('soundtouch')
source=(http://downloads.sourceforge.net/sourceforge/ihu/ihu-${pkgver}.tar.gz \
        ihu.desktop \
        ihu.1)
md5sums=('ab567c5d2d9f83788ec95f08098ebe58'
         'ab8afc11d6d71b5497cb4c8996340ddb'
         'df7e3be9e98ba0eaba5e70d70d964ed9')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}/

  # Source the QT3 profile
  source /etc/profile.d/qt3.sh

  ./configure --prefix=/usr --disable-debug --disable-jack
  make || return 1
  make DESTDIR=${startdir}/pkg install

  # Install icon and shortcut
  install -D -m644 icon/ihu.png ${startdir}/pkg/usr/share/pixmaps/ihu.png
  install -D -m644 ${startdir}/src/ihu.desktop ${startdir}/pkg/usr/share/applications/ihu.desktop

  # Install manpage
  install -D -m644 ${startdir}/src/ihu.1 ${startdir}/pkg/usr/share/man/man1/ihu.1
}

# vim:set ts=2 sw=2 et:
