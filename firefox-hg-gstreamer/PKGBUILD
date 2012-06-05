# Contributor: MutantMonkey <mutantmonkey@gmail.com>
# Contributor: Simon Gomizelj <simongmzlj@gmail.com>

pkgname=firefox-hg-gstreamer
pkgver=95462
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org, latest development version with GStreamer support"
_ffver="15.0a1"
url="http://www.mozilla.org/projects/firefox/"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
depends=('gtk2' 'gcc-libs' 'mozilla-common' 'nss>=3.12.10' 'libxt' 'libxrender'
         'hunspell' 'startup-notification' 'mime-types' 'dbus-glib' 'alsa-lib'
         'libevent' 'sqlite3>=3.7.4' 'libnotify' 'desktop-file-utils' 'libvpx'
         'lcms' 'nspr>=4.8.8' 'libevent' 'libpng' 'cairo')
makedepends=('unzip' 'zip' 'pkg-config' 'diffutils' 'python2' 'wireless_tools' 'yasm'
             'mesa' 'autoconf2.13' 'gconf' 'xorg-server-xvfb')
provides=("firefox=$_ffver")
conflicts=("firefox-hg")
url="http://www.mozilla.org/projects/firefox"
install=firefox.install
source=(mozconfig
        firefox-hg.desktop
        mozilla-firefox-1.0-lang.patch
        system-cairo.patch
        fatal-warnings.patch)
md5sums=('b50c632e239d86b5b53819dc8d4aae09'
         '4022581eb05405b82c489d5ea16b1a17'
         'bd5db57c23c72a02a489592644f18995'
         'c9e9545d6e9a2bd2a614f910bbe4eeda'
         '47b1d12933ecc61874f0d05aef8dc30e')


_hgroot="http://hg.mozilla.org"
_hgrepo=mozilla-central

build() {
  cd "$srcdir/mozilla-central"
  hg revert --all

  cp "$srcdir/mozconfig" .mozconfig
  patch -Np1 -i "$srcdir/mozilla-firefox-1.0-lang.patch"
  patch -Np1 -i "$srcdir/system-cairo.patch"
  patch -Np1 -i "$srcdir/fatal-warnings.patch"

  # Kill @PRE_RELEASE_SUFFIX@ from browser.xul because it
  # gets set to \177 for an unknown reason
  sed -i 's/@PRE_RELEASE_SUFFIX@//g' \
      browser/base/content/browser.xul

  export LDFLAGS="-Wl,-rpath,/usr/lib/firefox-$_ffver -Wl,-O1,--sort-common,--hash-style=gnu,--as-needed"
  export PYTHON="/usr/bin/python2"

  # PGO
  # sed -i '/^NO_PROFILE_GUIDED_OPTIMIZE = 1$/d' \
  #   memory/jemalloc/Makefile.in
  # echo 'LDFLAGS += -lX11 -lXrender' \
  #   >> layout/build/Makefile.in

  # LD_PRELOAD="" /usr/bin/Xvfb -nolisten tcp -extension GLX -screen 0 1280x1024x24 :99 &
  # LD_PRELOAD="" DISPLAY=:99 make -j1 -f client.mk profiledbuild MOZ_MAKE_FLAGS="$MAKEFLAGS"
  # kill $! || true
  make -f client.mk clean
  make -j1 -f client.mk MOZ_MAKE_FLAGS="$MAKEFLAGS"
}

package() {
  cd "$srcdir/mozilla-central"
  make -j1 -f client.mk DESTDIR="$pkgdir" install

  # rm -f "$pkgdir/usr/bin/firefox"
  mv "$pkgdir/usr/bin/firefox" "$pkgdir/usr/bin/firefox-hg"

  # update firefox.sh launcher with proper Firefox version
  # sed -i "s/firefox-hg/firefox-$_ffver/g" "$srcdir/firefox.sh"
  # install -m755 "$srcdir/firefox.sh" "$pkgdir/usr/bin/firefox-hg"

  for i in 16x16 32x32 48x48; do
    install -Dm644 browser/branding/nightly/default${i/x*/}.png \
      "$pkgdir/usr/share/icons/hicolor/$i/apps/firefox-hg.png"
  done

  install -Dm644 browser/branding/nightly/content/icon64.png \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/firefox-hg.png"

  install -Dm644 browser/branding/nightly/mozicon128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/firefox-hg.png"

  install -Dm644 "$srcdir/firefox-hg.desktop" \
    "$pkgdir/usr/share/applications/firefox-hg.desktop"

  # We don't want the development stuff
  rm -r "$pkgdir"/usr/{include,lib/firefox-devel-$_ffver,share/idl}
}
