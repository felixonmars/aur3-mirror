# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=jahplayer
pkgver=0.2.2
pkgrel=1
pkgdesc="A professional grade media player capable of playing uncompressed video and image sequences"
arch=('i686' 'x86_64')
url="http://www.jahshaka.org/"
license=('GPL')
depends=('openlibraries>=0.4.0-2' 'python>=2.5' 'qt')
makedepends=('rpmextract')
source=(http://dl.sourceforge.net/sourceforge/jahshaka/jahplayer-${pkgver}-1.src.rpm \
        jahplayer.desktop \
        jahplayer.sh \
        encoder.sh \
        olib_pkg-config.patch \
        python25.patch)
md5sums=('6eb762636a9d311445ea8497af6da184'
         'a144a556c737c6fa2c15e331d5b3f1e4'
         'f23e3f1f87a61cff5b8e9b5163bd99a0'
         '317556270999fba7f9c12861b19c09ed'
         'd2bc37726b43810c298e9bb0429a5711'
         '62ffb385aaacc93eac2cb016d98198a6')

build() {
  # Extract source tarball from RPM
  rpmextract.sh jahplayer-${pkgver}-1.src.rpm
  tar -xf jahplayer-${pkgver}.tar.gz

  cd ${startdir}/src/jahplayer-${pkgver}/

  patch -Np1 -i ../olib_pkg-config.patch || return 1
  patch -Np1 -i ../python25.patch || return 1

  # Source the QT profile
  [ -f /etc/profile.d/qt.sh ] && source /etc/profile.d/qt.sh

  make LDFLAGS="-Wl,--rpath=/usr/lib/openlibraries-0.4.0" -C jahwidgets || return 1

  install -D -m644 jahwidgets/src/qt3/python/libwrapper_py.so* ${startdir}/pkg/usr/lib/python2.5/site-packages/jahwidgets.so

  install -D -m644 jahwidgets/src/qt3/wrapper/libwrapper.so ${startdir}/pkg/usr/lib/libwrapper.so
  install -m644 jahwidgets/src/qt3/widgets/libwidgets.so* ${startdir}/pkg/usr/lib/libwidgets.so
  install -D -m644 jahwidgets/src/qt3/themes/libthemes.so* ${startdir}/pkg/opt/qt/plugins/styles/libthemes.so

  install -d ${startdir}/pkg/usr/share/jah{player,tools}

  install -m644 jahplayer/*.{py,ui,png,jpg} ${startdir}/pkg/usr/share/jahplayer/
  chmod 755 ${startdir}/pkg/usr/share/jahplayer/jahplayer.py

  install -m644 jahtools/encoder/*.{py,ui,png} ${startdir}/pkg/usr/share/jahtools/encoder/
  chmod 755 ${startdir}/pkg/usr/share/jahtools/encoder/encoder.py

  install -D -m755 ../jahplayer.sh ${startdir}/pkg/usr/bin/jahplayer
  install -D -m755 ../encoder.sh ${startdir}/pkg/usr/bin/encoder

  install -D -m644 ../jahplayer.desktop ${startdir}/pkg/usr/share/applications/jahplayer.desktop
}
