# $Id: PKGBUILD 161877 2012-06-16 01:15:20Z ibiru $
# Maintainer : Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

pkgname=firefox-nightly-hg
pkgver=97554
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org, nightly version"
_ffver="16.0a1"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
depends=('gtk2' 'mozilla-common' 'libxt' 'startup-notification' 'mime-types' 'dbus-glib' 'alsa-lib'
         'libnotify' 'desktop-file-utils' 'hicolor-icon-theme'
         'libvpx' 'libevent' 'nss>=3.13.3' 'hunspell' 'sqlite')
makedepends=('unzip' 'zip' 'diffutils' 'python2' 'wireless_tools' 'yasm' 'mesa'
             'autoconf2.13' 'libidl2' 'imake' 'gcc4.6')
optdepends=('wireless_tools: Location detection via available WiFi networks')
replaces=('firefox-hg')
url="http://www.mozilla.org/projects/firefox"
install=firefox.install
options=(!emptydirs)
source=(mozconfig
        firefox-hg.desktop
        vendor.js)
md5sums=('42127413afeadd72c090d2185bd6b7fd'
         'd4954a73cdcf5402ee01bc8840be3e1d'
         '0d053487907de4376d67d8f499c5502b')

_hgroot="http://hg.mozilla.org"
_hgrepo=mozilla-central

build() {
  cd "$srcdir/mozilla-central"
  hg up tip

  cp ../mozconfig .mozconfig

  # Fix PRE_RELEASE_SUFFIX
  sed -i '/^PRE_RELEASE_SUFFIX := ""/s/ ""//' \
    browser/base/Makefile.in

  export CC=gcc-4.6
  export CXX=g++-4.6

  export LDFLAGS="$LDFLAGS -Wl,-rpath,/usr/lib/firefox-$_ffver"
  export PYTHON="/usr/bin/python2"
  export MOZ_MAKE_FLAGS="$MAKEFLAGS"
  unset MAKEFLAGS

  make -f client.mk clean
  make -f client.mk build

  kill $! || true
}

package() {
  cd "$srcdir/mozilla-central"
  make -j1 -f client.mk DESTDIR="$pkgdir" install

  install -m644 ../vendor.js "$pkgdir/usr/lib/firefox-$_ffver/defaults/pref"
  mv "$pkgdir/usr/bin/firefox" "$pkgdir/usr/bin/$pkgname"

  for i in 16 22 24 32 48 256; do
      install -Dm644 browser/branding/official/default$i.png \
        "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
  done

  install -Dm644 browser/branding/nightly/content/icon64.png \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/$pkgname.png"

  install -Dm644 browser/branding/nightly/mozicon128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"

  install -Dm644 ../firefox-hg.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # Use system-provided dictionaries
  rm -rf "$pkgdir"/usr/lib/firefox-$_ffver/{dictionaries,hyphenation}
  ln -s /usr/share/hunspell "$pkgdir/usr/lib/firefox-$_ffver/dictionaries"
  ln -s /usr/share/hyphen "$pkgdir/usr/lib/firefox-$_ffver/hyphenation"

  # We don't want the development stuff
  rm -r "$pkgdir"/usr/{include,lib/firefox-devel-$_ffver,share/idl}
}
