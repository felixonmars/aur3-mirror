# Mantainer: Franco Tortoriello
# based on the seamonkey and firefox packages from community and extra

# Profile-guided optimizatons (takes longer to compile)
_pgo=n

pkgname=seamonkey-kde
pkgver=2.19
pkgrel=1
pkgdesc='SeaMonkey internet suite with OpenSUSE patches for better KDE integration'
arch=(i686 x86_64)
url='http://www.seamonkey-project.org'
license=(MPL GPL LGPL)
depends=(gtk2 hicolor-icon-theme libevent mime-types mozilla-common nss
	 startup-notification kmozillahelper)
makedepends=(unzip zip mesa python2 yasm autoconf2.13)
[ $_pgo = y ] && makedepends+=(xorg-server-xvfb)
optdepends=('networkmanager: Location detection via available WiFi networks')
provides=("seamonkey=$pkgver")
conflicts=(seamonkey)
options=(!emptydirs)
install=seamonkey.install
#_patchurl=https://api.opensuse.org/public/source/mozilla:Factory
source=(http://ftp.mozilla.org/pub/mozilla.org/seamonkey/releases/$pkgver/source/seamonkey-$pkgver.source.tar.bz2
	seamonkey.desktop mozconfig vendor.js system-cairo.patch
	# seamonkey opensuse patches
	mozilla-nongnome-proxies.patch
	# firefox opensuse patches
	mozilla-kde.patch firefox-browser-css.patch firefox-kde.patch
	kde.js)
md5sums=('233587b605261349405330005c91b2fe'
	 '8a0cd54ed487e8603d852ee1749a30a9'
	 'a0fe28e00b0e24b44cbaeed42cbe13ee'
	 '1ae0a752e723b3e52b52f93620b5679c'
	 '183d71a79c0f02eaa1b52b8c71690883'
	 '28f61de31540e20522aefdbe88a83fa8'
	 '03f4c78952c3e3d1cc80b3fd2f2346fd'
	 '10f157ef904c650cd69eec1c7779fdf5'
	 '2221965e4bd5f913cf33814b8b4973c6'
	 '75df0f88cc7a7fa7d522459e4ff82cc5')

prepare() {
  cd "$srcdir/comm-release/mozilla"

  patch -Np1 -i "$srcdir/mozilla-nongnome-proxies.patch"
  patch -Np1 -i "$srcdir/mozilla-kde.patch"
  patch -Np1 -i "$srcdir/firefox-browser-css.patch"
  patch -Np1 -i "$srcdir/firefox-kde.patch"

  cd ..
  patch -Np1 -i "$srcdir/system-cairo.patch"

  # Change install dir
  sed -e 's/-$(MOZ_APP_VERSION)//g' -i \
	{.,mozilla{,/js/src}}/config/baseconfig.mk

  # Don't exit with error when some files are missing
  # which we install later
  sed '/^MOZ_PKG_FATAL_WARNINGS/s@= 1@= 0@' \
      -i suite/installer/Makefile.in

  # Fix PRE_RELEASE_SUFFIX
  sed '/^PRE_RELEASE_SUFFIX := ""/s/ ""//' \
    -i mozilla/browser/base/Makefile.in

  # Disable libmozgnome
  sed -e '/MOZ_ENABLE_GNOME_COMPONENT/s@=1@=0@' \
      -i {.,mozilla}/configure{,.in}

  cp "$srcdir/mozconfig" .mozconfig
}

build() {
  cd "$srcdir/comm-release"

  export LDFLAGS="$LDFLAGS -Wl,-rpath,/usr/lib/seamonkey"
  export MOZ_MAKE_FLAGS="$MAKEFLAGS"
  unset MAKEFLAGS
  export CFLAGS="$CFLAGS $CPPFLAGS"
  export CXXFLAGS="$CXXFLAGS $CPPFLAGS"
  unset CPPFLAGS

  # Use Python 2
  export PYTHON="/usr/bin/python2"
  mkdir "$srcdir/path"
  ln -s /usr/bin/python2 "$srcdir/path/python"
  export PATH="$srcdir/path:$PATH"

  if [ $_pgo = y ]; then

    msg2 "PGO enabled"
    export DISPLAY=:99
    Xvfb -nolisten tcp -extension GLX -screen 0 1280x1024x24 $DISPLAY &
    _fail=0

    make -f client.mk build MOZ_PGO=1 || _fail=1

    kill $! || true
    return $_fail

  else

    make -f client.mk build

  fi
}

package() {
  cd "$srcdir/comm-release"

  msg2 "If you have a Mozilla based browser installed, you may need to uninstall it"
  msg2 "before packaging."

  make -f client.mk DESTDIR="$pkgdir" install
  install -d "$pkgdir/usr/lib/seamonkey/defaults/preferences"
  install -m644 "$srcdir"/{vendor,kde}.js \
	"$pkgdir/usr/lib/seamonkey/defaults/preferences/"

  # Use system-provided dictionaries
  rm -r "$pkgdir"/usr/lib/seamonkey/dictionaries
  ln -s /usr/share/hunspell "$pkgdir/usr/lib/seamonkey/dictionaries"
  ln -s /usr/share/hyphen "$pkgdir/usr/lib/seamonkey/hyphenation"

  # Desktop files
  install -Dm644 suite/branding/nightly/icons/gtk/seamonkey.png \
	"$pkgdir/usr/share/pixmaps/seamonkey.png"
  install -Dm644 "$srcdir/seamonkey.desktop" \
	"$pkgdir/usr/share/applications/seamonkey.desktop"

  # man page
  install -Dm644 obj-$CHOST/mozilla/dist/man/man1/seamonkey.1 \
	"$pkgdir/usr/share/man/man1/seamonkey.1"

  # Remove development stuff
  rm -r "$pkgdir"/usr/{include,lib/seamonkey-devel,share/idl}

  # Remove a reference to srcdir
  sed -e "\|$srcdir|d" -i \
	"$pkgdir/usr/lib/seamonkey/defaults/pref/channel-prefs.js"

  msg2 "The lightning, calendar-timezones and gdata-provider extensions are in"
  msg2 "$srcdir/comm-release/obj-$CHOST/mozilla/dist/xpi-stage"
  msg2 "You can install them manually from there"
}

