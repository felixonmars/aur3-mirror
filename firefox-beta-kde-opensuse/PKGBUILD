# Contributor: Weng Xuetian <wengxt@gmail.com>

pkgname=firefox-beta-kde-opensuse
pkgver=5.0b3
pkgrel=1
#_xulver=2.0rc2
pkgdesc="Standalone web browser from mozilla.org with OpenSUSE patch, integrate better with KDE"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
depends=('gtk2' 'gcc-libs' 'libidl2' 'mozilla-common' 'nss' 'libxt' 'libxrender' 'hunspell' 'startup-notification' 'mime-types' 'dbus-glib' 'alsa-lib' 'libevent' 'sqlite3>=3.7.4' 'libnotify' 'libproxy' 'kmozillahelper>=0.6' 'desktop-file-utils' 'cairo>=1.10.2-2')
makedepends=('zip' 'pkg-config' 'diffutils' 'python2' 'wireless_tools' 'autoconf2.13' 'yasm')
provides=("firefox=${pkgver}")
conflicts=('firefox' 'firefox-kde-opensuse')
replaces=('firefox3')
install=firefox.install
url="http://www.mozilla.org/projects/firefox"
source=(http://releases.mozilla.org/pub/mozilla.org/firefox/releases/${pkgver}/source/firefox-${pkgver}.source.tar.bz2
        mozconfig
        firefox.desktop
        mozilla-firefox-1.0-lang.patch
        firefox-version.patch
        kde.js
        firefox-cross-desktop.patch
        firefox-kde.patch
        firefox-browser-css.patch
        firefox-kde-114.patch
        mozilla-nongnome-proxies.patch
        mozilla-kde.patch
)


build() {
  cd "${srcdir}/mozilla-beta"
  patch -Np1 -i "${srcdir}/mozilla-firefox-1.0-lang.patch"
  patch -Np1 -i "${srcdir}/firefox-version.patch"

  rm -f browser/components/shell/src/nsKDEShellService.cpp \
        browser/components/shell/src/nsKDEShellService.h \
        browser/components/shell/src/nsUnixShellService.cpp \
        browser/components/shell/src/nsUnixShellService.h \
        browser/base/content/browser-kde.xul
  rm -f toolkit/xre/nsKDEUtils.cpp \
        toolkit/xre/nsKDEUtils.h \
        uriloader/exthandler/unix/nsCommonRegistry.cpp \
        uriloader/exthandler/unix/nsCommonRegistry.h \
        uriloader/exthandler/unix/nsKDERegistry.cpp \
        uriloader/exthandler/unix/nsKDERegistry.h \
        toolkit/content/widgets/dialog-kde.xml \
        toolkit/content/widgets/preferences-kde.xml

  install -m 644 "${srcdir}/kde.js" browser/app/profile/kde.js
  patch -Np1 -i "${srcdir}/firefox-cross-desktop.patch" || return 1
  patch -Np1 -i "${srcdir}/firefox-kde.patch" || return 1
  patch -Np1 -i "${srcdir}/firefox-browser-css.patch" || return 1
  patch -Np1 -i "${srcdir}/firefox-kde-114.patch" || return 1
  patch -Np1 -i "${srcdir}/mozilla-nongnome-proxies.patch" || return 1
  patch -Np1 -i "${srcdir}/mozilla-kde.patch" || return 1

  cp "${srcdir}/mozconfig" .mozconfig
  unset CFLAGS
  unset CXXFLAGS

  export LDFLAGS="-Wl,-rpath,/usr/lib/firefox-5.0"

  make -j1 -f client.mk build MOZ_MAKE_FLAGS="${MAKEFLAGS}"
}

package() {
  cd "${srcdir}/mozilla-beta"
  make -j1 DESTDIR="${pkgdir}" -f client.mk install

  install -m755 -d ${pkgdir}/usr/share/{applications,pixmaps}
  install -m644 ${srcdir}/mozilla-beta/other-licenses/branding/firefox/default48.png ${pkgdir}/usr/share/pixmaps/firefox.png || return 1
  install -m644 ${srcdir}/firefox.desktop ${pkgdir}/usr/share/applications/
}
md5sums=('080194e72c8610b16e94bb6f27e39c48'
         '6e5f7e7bab86c587bc2b0c1589e6d8eb'
         'ba96924ece1d77453e462429037a2ce5'
         'bd5db57c23c72a02a489592644f18995'
         '04fba1e213625e3a370c03ef96c43be2'
         '75df0f88cc7a7fa7d522459e4ff82cc5'
         'ef2ec32d2c98fbbdc0304801a3d6413d'
         'd6948a2255828ebea9d4018b72096d8b'
         '36868e98e05c27c9cb5b982d386b6dea'
         '038666a4be4e56c1ea25265fa4a12dd2'
         'ea37f26534d1bab452da7945695e2b32'
         'd3fd5711ec5f3f616c5068a273549b80')
