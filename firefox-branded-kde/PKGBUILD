# Contributor: Jose Alcalá <gskbyte - - gmail - com>

pkgname=firefox-branded-kde
pkgver=3.5.7
pkgrel=1
_xulver=1.9.1.7
pkgdesc="Standalone web browser from mozilla.org, modified for a better integration with KDE."
arch=(i686 x86_64)
license=('MPL' 'GPL' 'LGPL')
depends=("xulrunner>=${_xulver}" 'desktop-file-utils' 'gtk-qt-engine' 'kgtk')
makedepends=('zip' 'pkgconfig' 'diffutils' 'libgnomeui>=2.24.1' 'python')
optdepends=('qtcurve-gtk2 and qtcurve-kde4: a good theme for Qt and Gtk integration.'
            'oxygen-molecule-theme: Gtk Theme that (greatly) emulates Oxygen theme'
            'oxygenrefit2-icon-theme: Oxygen icons in Gtk/GNOME apps')
replaces=('firefox' 'firefox3' 'firefox3-branded' 'firefox-branded')
conflicts=('firefox' 'firefox3' 'firefox3-branded' 'firefox-branded')
provides=("firefox=${pkgver}")
install=firefox.install
url="http://www.mozilla.org/projects/firefox"
source=(http://releases.mozilla.org/pub/mozilla.org/firefox/releases/${pkgver}/source/firefox-${pkgver}.source.tar.bz2
        https://addons.mozilla.org/firefox/downloads/latest/12196/platform:2/addon-12196-latest.xpi
        mozconfig
        firefox.desktop
        firefox-safe.desktop
        mozilla-firefox-1.0-lang.patch
        browser-defaulturls.patch
        firefox-version.patch
        )
md5sums=('82e6f568ddeaae52e85aa089277f5d14'
         '4eed1edac2230f53e4f803c7754e8bf5'
         '372a79e9447aa2d4d00140d4c98b1273'
         '720078eb4547792dcc44b4a110cf6fbf'
         '5e68cabfcf3c021806b326f664ac505e'
         'bd5db57c23c72a02a489592644f18995'
         '346d74ec560e7bbf453c02ff21f4b868'
         '1dd9a10df0b9e4cf332eadc326d78e07'
         )

build() {
  cd "${srcdir}/mozilla-1.9.1"
  patch -Np1 -i "${srcdir}/mozilla-firefox-1.0-lang.patch" || return 1
  patch -Np0 -i "${srcdir}/browser-defaulturls.patch" || return 1
  patch -Np1 -i "${srcdir}/firefox-version.patch" || return 1

  cp "${srcdir}/mozconfig" .mozconfig

  export LDFLAGS="-Wl,-rpath,/usr/lib/firefox-3.5"

  make -f client.mk build MOZ_MAKE_FLAGS="${MAKEFLAGS}" || return 1
  make DESTDIR="${pkgdir}" install || return 1

  rm -f ${pkgdir}/usr/lib/firefox-3.5/libjemalloc.so

  install -m755 -d ${pkgdir}/usr/share/applications
  install -m755 -d ${pkgdir}/usr/share/pixmaps
  install -m644 ${srcdir}/mozilla-1.9.1/other-licenses/branding/firefox/default48.png ${pkgdir}/usr/share/pixmaps/firefox.png || return 1
  install -m644 ${srcdir}/firefox.desktop ${pkgdir}/usr/share/applications/ || return 1
  install -m644 ${srcdir}/firefox-safe.desktop ${pkgdir}/usr/share/applications/ || return 1

  # install PlasmaNotify extension
  install -m755 -d ${pkgdir}/usr/lib/firefox-3.5/extensions/plasmanotify@andreas-demmer.de/
  cp -R ${srcdir}/chrome ${pkgdir}/usr/lib/firefox-3.5/extensions/plasmanotify@andreas-demmer.de/ || return 1
  cp -R ${srcdir}/defaults ${pkgdir}/usr/lib/firefox-3.5/extensions/plasmanotify@andreas-demmer.de/ || return 1
  chmod -R 755 ${pkgdir}/usr/lib/firefox-3.5/extensions/plasmanotify@andreas-demmer.de// || return 1
  install -m755 ${srcdir}/install.rdf ${pkgdir}/usr/lib/firefox-3.5/extensions/plasmanotify@andreas-demmer.de/ || return 1
  install -m755 ${srcdir}/chrome.manifest ${pkgdir}/usr/lib/firefox-3.5/extensions/plasmanotify@andreas-demmer.de/ || return 1
}

