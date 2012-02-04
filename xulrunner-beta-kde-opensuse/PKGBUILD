# Contributor: Weng Xuetian <wengxt@gmail.com>

pkgname=xulrunner-beta-kde-opensuse
pkgver=2.0rc2
_ffoxver=4.0rc2
pkgrel=1
pkgdesc="Mozilla Runtime Environment with OpenSUSE patch, integrate better with KDE"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
depends=('gtk2' 'gcc-libs' 'libidl2' 'mozilla-common' 'nss' 'libxt' 'hunspell' 'startup-notification' 'mime-types' 'dbus-glib' 'alsa-lib' 'libevent' 'sqlite3>=3.7.4' 'kmozillahelper>=0.6' 'libproxy' 'libnotify' 'cairo>=1.10.2-2')
makedepends=('zip' 'pkg-config' 'diffutils' 'python2' 'wireless_tools' 'autoconf2.13' 'yasm')
optdepends=('wireless_tools: Location aware browsing')
provides=("xulrunner=${pkgver}")
conflicts=('xulrunner' 'xulrunner-kde-opensuse')
url="http://wiki.mozilla.org/XUL:Xul_Runner"
source=(http://releases.mozilla.org/pub/mozilla.org/firefox/releases/${_ffoxver}/source/firefox-${_ffoxver}.source.tar.bz2
        mozconfig
        mozilla-pkgconfig.patch
        fix-mozilla-launcher.patch
        xulrunner-version.patch
        mozilla-nongnome-proxies.patch
        mozilla-kde.patch
        idldir.patch
        mozilla-prefer_plugin_pref.patch
)

md5sums=('060ad2571e781ca72971c4dcdeb79cff'
         '568a188ca8f5f22004d40d8455226e1a'
         '02c23dc4ebd88e445533314716331818'
         '63eee2d1da3b43c9d604f2253f242f40'
         '613efcc9460dc3024e5a39c922d68cd0'
         'ea37f26534d1bab452da7945695e2b32'
         '20b534be0e395963126c002576cc0a81'
         '54aace328c9b95d9549dd01e75422fb4'
         '4960e7906d864a36317be2681ce75f6e')

build() {
  cd "${srcdir}/mozilla-2.0"
  cp "${srcdir}/mozconfig" .mozconfig

  rm -f toolkit/xre/nsKDEUtils.cpp \
        toolkit/xre/nsKDEUtils.h \
        uriloader/exthandler/unix/nsCommonRegistry.cpp \
        uriloader/exthandler/unix/nsCommonRegistry.h \
        uriloader/exthandler/unix/nsKDERegistry.cpp \
        uriloader/exthandler/unix/nsKDERegistry.h \
        toolkit/content/widgets/dialog-kde.xml \
        toolkit/content/widgets/preferences-kde.xml \

  msg "patch idldir"
  patch -Np0 -i "${srcdir}/idldir.patch" || return 1

  msg "patch mozilla-nongnome-proxies"
  patch -Np0 -i "${srcdir}/mozilla-nongnome-proxies.patch" || return 1

  msg "patch mozilla-kde"
  patch -Np1 -i "${srcdir}/mozilla-kde.patch" || return 1

  #fix libdir/sdkdir - fedora
  msg "patch mozilla-pkgconfig"
  patch -Np1 -i "${srcdir}/mozilla-pkgconfig.patch"

  #Fix stub launcher - archlinux
  msg "patch fix-mozilla-launcher"
  patch -Np0 -i "${srcdir}/fix-mozilla-launcher.patch"

  #Force installation to the same path for every version
  msg "patch xulrunner-version.patch"
  patch -Np1 -i "${srcdir}/xulrunner-version.patch"

  unset CFLAGS
  unset CXXFLAGS

  make -j1 -f client.mk build MOZ_MAKE_FLAGS="$MAKEFLAGS"
}

package() {
  cd "${srcdir}/mozilla-2.0"
  make -j1 DESTDIR="${pkgdir}" -C build install

  #Remove included dictionaries, add symlink to system myspell path.
  #Note: this will cause file conflicts when users have installed dictionaries in the old location
  rm -rf "${pkgdir}/usr/lib/xulrunner-2.0/dictionaries"
  ln -sf /usr/share/myspell/dicts "${pkgdir}/usr/lib/xulrunner-2.0/dictionaries"

  # add xulrunner library path to ld.so.conf
  install -d ${pkgdir}/etc/ld.so.conf.d
  echo "/usr/lib/xulrunner-2.0" > ${pkgdir}/etc/ld.so.conf.d/xulrunner.conf
}