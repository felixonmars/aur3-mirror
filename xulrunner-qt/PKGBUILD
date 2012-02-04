# $Id: PKGBUILD 73185 2010-03-23 20:11:01Z ibiru $
# Contributor: Alexander Baldeck <alexander@archlinux.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>
pkgname=xulrunner-qt
pkgver=1.9.2.3
_ffoxver=3.6.3
pkgrel=2
pkgdesc="Mozilla Runtime Environment"
arch=(i686 x86_64)
license=('MPL' 'GPL' 'LGPL')
depends=('gcc-libs>=4.4.3' 'libidl2>=0.8.13' 'mozilla-common' 'nss>=3.12.6' 'libxt' 'hunspell>=1.2.8' 'startup-notification>=0.10' 'mime-types' 'dbus-glib>=0.82' 'alsa-lib>=1.0.21.a')
makedepends=('zip' 'pkgconfig' 'diffutils' 'qt' 'python' 'wireless_tools' 'autoconf2.13')
optdepends=('wireless_tools: Location aware browsing'
            'python: pyxpcom')
provides=(gecko-sdk)
replaces=(gecko-sdk)
url="http://wiki.mozilla.org/XUL:Xul_Runner"
source=(http://releases.mozilla.org/pub/mozilla.org/firefox/releases/${_ffoxver}/source/firefox-${_ffoxver}.source.tar.bz2
        mozconfig
        firefox-qt.patch
        mozilla-pkgconfig.patch
        fix-mozilla-launcher.patch
        mozilla-ps-pdf-simplify-operators.patch
        xulrunner-version.patch
        xulrunner-png14.patch
        enable-x86_64-tracemonkey.patch
        startup-notification.patch)

md5sums=('5e4541ab23084b7b14ba228291ce2688'
         'c6ea05a012f365bf1f2f2570b6bd913d'
         '17d375f9e00c192b5ed314216a18695e'
         '2d2d7143a4e0bfe71149a51f8dbbab2f'
         '63eee2d1da3b43c9d604f2253f242f40'
         '13dca58c04e62a8916691c63c5c492a0'
         '4e97eddd85db64d23c6d3ea9ebf13432'
         '3bd0566180ad2daa32743b3ce58b2095'
         'cbd938cd1fb8210cd8a2c41833489af9'
         '5876c45f85dc3d8989a9d2d098dc9f15')

build() {
  cd "${srcdir}/mozilla-1.9.2"
  cp "${srcdir}/mozconfig" .mozconfig

  patch -Np1 -i "${srcdir}/firefox-qt.patch"

  #Upstream patch. Still not applied to 1.9.2
  patch -Np1 -i "${srcdir}/mozilla-ps-pdf-simplify-operators.patch"

  #fix libdir/sdkdir - fedora
  patch -Np1 -i "${srcdir}/mozilla-pkgconfig.patch"

  #Fix stub launcher - archlinux
  patch -Np0 -i "${srcdir}/fix-mozilla-launcher.patch"

  #Force installation to the same path for every version
  patch -Np1 -i "${srcdir}/xulrunner-version.patch"

  #Fix compile with libpng 1.4
  patch -Np0 -i "${srcdir}/xulrunner-png14.patch"

  #Tracemonkey for x86_64
  patch -Np0 -i "${srcdir}/enable-x86_64-tracemonkey.patch"

  #https://bug534845.bugzilla.mozilla.org/attachment.cgi?id=417666
  #https://bugzilla.mozilla.org/show_bug.cgi?id=534845
  patch -Np1 -i "${srcdir}/startup-notification.patch"

  unset CFLAGS
  unset CXXFLAGS

  make -j1 -f client.mk build MOZ_MAKE_FLAGS="$MAKEFLAGS" || return 1
  make -j1 DESTDIR="${pkgdir}" install || return 1

  #Remove included dictionaries, add symlink to system myspell path.
  #Note: this will cause file conflicts when users have installed dictionaries in the old location
  rm -rf "${pkgdir}/opt/ffqt/lib/xulrunner-1.9.2/dictionaries"
  ln -sf /usr/share/myspell "${pkgdir}/opt/ffqt/lib/xulrunner-1.9.2/dictionaries"

  # add xulrunner library path to ld.so.conf
  install -d ${pkgdir}/etc/ld.so.conf.d
  echo "/opt/ffqt/lib/xulrunner-qt-1.9.2" > ${pkgdir}/etc/ld.so.conf.d/xulrunner-qt.conf
}
