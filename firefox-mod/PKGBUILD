# Maintainer : megadriver <megadriver at gmx dot com>
# Based on firefox from [extra] and Heftig's aurora

pkgname=firefox-mod
pkgver=21.0
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org (with GStreamer support and other customizations)"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
url="http://www.mozilla.org/projects/firefox"
depends=('gtk2' 'mozilla-common' 'libxt' 'startup-notification' 'mime-types' 'dbus-glib' 'alsa-lib' 'libevent'
         'nss' 'hunspell' 'sqlite' 'libnotify' 'desktop-file-utils' 'hicolor-icon-theme' 'gstreamer0.10-base')
makedepends=('unzip' 'zip' 'diffutils' 'python2' 'yasm' 'mesa')
optdepends=('networkmanager: Location detection via available WiFi networks'
            'gstreamer0.10-base-plugins: Vorbis decoding and Ogg demuxing'
            'gstreamer0.10-bad-plugins: AAC, VP8 and Opus decoding'
            'gstreamer0.10-good-plugins: WebM and MP4 demuxing'
            'gstreamer0.10-ugly-plugins: H.264 decoding')
install=firefox.install
conflicts=(firefox)
provides=(firefox)
options=('!emptydirs' '!makeflags')
source=(https://ftp.mozilla.org/pub/mozilla.org/firefox/releases/$pkgver/source/firefox-$pkgver.source.tar.bz2
        mozconfig firefox.desktop firefox-install-dir.patch vendor.js shared-libs.patch firefox-20.0.1-fixed-loading-icon.png)
md5sums=('6e2510e9466b280c367de0e4c05a8840'
         '2c010a69bd6e370bccfaab3a493ef7e0'
         '6174396b4788deffa399db3f6f010a94'
         '150ac0fb3ac7b2114c8e8851a9e0516c'
         '0272d707b5bf66eddbe58b21f56b4f8a'
         '52e52f840a49eb1d14be1c0065b03a93'
         '6e335a517c68488941340ee1c23f97b0')

prepare() {
  cd mozilla-release

  cp ../mozconfig .mozconfig
  patch -Np1 -i ../firefox-install-dir.patch
  patch -Np1 -i ../shared-libs.patch

  # Fix PRE_RELEASE_SUFFIX
  sed -i '/^PRE_RELEASE_SUFFIX := ""/s/ ""//' browser/base/Makefile.in

  mkdir "$srcdir/path"

  # WebRTC build tries to execute "python" and expects Python 2
  ln -s /usr/bin/python2 "$srcdir/path/python"

  # Configure script misdetects the preprocessor without an optimization level
  # https://bugs.archlinux.org/task/34644
  sed -i '/ac_cpp=/s/$CPPFLAGS/& -O2/' configure

  # Fix tab loading icon (flickers with libpng 1.6)
  # https://bugzilla.mozilla.org/show_bug.cgi?id=841734
  cp "$srcdir/firefox-20.0.1-fixed-loading-icon.png" browser/themes/gnomestripe/tabbrowser/loading.png
}

build() {
  cd mozilla-release

  export PATH="$srcdir/path:$PATH"
  export LDFLAGS="$LDFLAGS -Wl,-rpath,/usr/lib/firefox"
  export PYTHON="/usr/bin/python2"

  make -f client.mk build
}

package() {
  cd mozilla-release
  make -f client.mk DESTDIR="$pkgdir" install

  install -Dm644 ../vendor.js "$pkgdir/usr/lib/firefox/browser/defaults/preferences/vendor.js"

  for i in 16 22 24 32 48 256; do
      install -Dm644 browser/branding/official/default$i.png "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/firefox.png"
  done
  install -Dm644 browser/branding/official/content/icon64.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/firefox.png"
  install -Dm644 browser/branding/official/mozicon128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/firefox.png"
  install -Dm644 browser/branding/official/content/about-logo.png "$pkgdir/usr/share/icons/hicolor/210x210/apps/firefox.png"

  install -Dm644 ../firefox.desktop "$pkgdir/usr/share/applications/firefox.desktop"

  # Use system-provided dictionaries
  rm -rf "$pkgdir"/usr/lib/firefox/{dictionaries,hyphenation}
  ln -s /usr/share/hunspell "$pkgdir/usr/lib/firefox/dictionaries"
  ln -s /usr/share/hyphen "$pkgdir/usr/lib/firefox/hyphenation"

  # We don't want the development stuff
  rm -r "$pkgdir"/usr/{include,lib/firefox-devel,share/idl}

  # Workaround for now
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -sf firefox "$pkgdir/usr/lib/firefox/firefox-bin"
}
