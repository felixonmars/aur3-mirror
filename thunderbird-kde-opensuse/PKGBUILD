# Maintainer: FadeMind <fademind@gmail.com>
# Contributor:  AlmAck <almack@chakra-project.org>
# Contributor:  Gui||aume <michaudg@gmail.com>

pkgname=thunderbird-kde-opensuse
pkgver=31.4.0
pkgrel=1
provides=(thunderbird=${pkgver})
conficts=(thunderbird)
replaces=(thunderbird)
pkgdesc="Standalone Mail/News reader from mozilla.org with OpenSUSE patch, integrate better with KDE. PKGBUILD from ChakraOS.org."
arch=('x86_64')
license=('MPL' 'GPL')
url="http://www.mozilla.org/thunderbird/"
depends=('alsa-lib' 'dbus-glib' 'desktop-file-utils' 'gtk2' 'hicolor-icon-theme' 'hunspell' 'libevent' 'libvpx' 'libxt' 'mime-types' 'mozilla-common' 'nss' 'sqlite3' 'startup-notification' 'nspr' 'kdelibs')
makedepends=('unzip' 'zip' 'pkg-config' 'python2' 'wireless_tools' 'yasm' 'mesa' 'autoconf2.13' 
             'gstreamer0.10-base-plugins' 'xorg-server-xvfb')
optdepends=('thunderbird-i18n: for multilanguage support'
	    'libcanberra: for sound support')
install=thunderbird.install
# For patch look here: https://build.opensuse.org/package/show?project=openSUSE:Factory&package=MozillaThunderbird
source=(ftp://ftp.mozilla.org/pub/mozilla.org/thunderbird/releases/$pkgver/source/thunderbird-$pkgver.source.tar.bz2
        mozconfig
        thunderbird.desktop
        thunderbird-install-dir.patch
        mozilla-kde.patch
        mozilla-nongnome-proxies.patch
        vendor.js
        kde.js
        rhbz-966424.patch)
options=(!emptydirs)

prepare(){
  cd comm-esr*
  patch -Np1 -i "$srcdir/thunderbird-install-dir.patch"
  
  pushd mozilla
  patch -Np1 -i "$srcdir/mozilla-nongnome-proxies.patch"
  patch -Np1 -i "$srcdir/mozilla-kde.patch"
  popd
  
  cp "$srcdir/mozconfig" .mozconfig
  
  # https://bugs.archlinux.org/task/41689
  patch -Np1 -d mozilla -i ../../rhbz-966424.patch

  # configure script misdetects the preprocessor without an optimization level
  # https://bugs.archlinux.org/task/34644
  sed -i '/ac_cpp=/s/$CPPFLAGS/& -O2/' mozilla/configure
}
         
build() {
  cd comm-esr* 
  export LDFLAGS="$LDFLAGS -Wl,-rpath,/usr/lib/thunderbird"
  export PYTHON="/usr/bin/python2"

  # Normal Build
  #make -j1 -f client.mk build MOZ_MAKE_FLAGS="$MAKEFLAGS"
  
  # Set up PGO
  export DISPLAY=:99
  Xvfb -nolisten tcp -extension GLX -screen 0 1280x1024x24 $DISPLAY &

  # Build
  if ! make -f client.mk build MOZ_MAKE_FLAGS="$MAKEFLAGS" MOZ_PGO=1; then
    kill $!
    return 1
  fi

  # Kill leftovers
  kill $! || true
}

package() {
  cd comm-esr*
  make -f client.mk DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir"/vendor.js "$pkgdir/usr/lib/thunderbird/defaults/preferences/vendor.js"
  install -Dm644 "$srcdir"/kde.js "$pkgdir/usr/lib/thunderbird/defaults/preferences/kde.js"

  for i in 16x16 22x22 24x24 32x32 48x48 256x256; do
      install -Dm644 other-licenses/branding/thunderbird/mailicon${i/x*/}.png \
          "$pkgdir/usr/share/icons/hicolor/$i/apps/thunderbird.png"
  done

  install -Dm644 "$srcdir/thunderbird.desktop" \
      "$pkgdir/usr/share/applications/thunderbird.desktop"

  rm -rf "$pkgdir"/usr/lib/thunderbird/{dictionaries,hyphenation}
  ln -sf /usr/share/hunspell "$pkgdir/usr/lib/thunderbird/dictionaries"
  ln -sf /usr/share/hyphen "$pkgdir/usr/lib/thunderbird/hyphenation"
  
  # We don't want the development stuff
  rm -r "$pkgdir"/usr/{include,lib/thunderbird-devel-*,share/idl}
}

sha256sums=('3e4b6cb5934b7a8e51a673044e0691eb7cd88a08415494673cd7eadb35cd90c3'
            '02b397a42b27d0bee58541ac1dac257e3c4ababd40f10e0a9152657a6307ce03'
            'b4371b9021fd5f65a1f546fca36c6c326a00ef0f57b448e86a33656ac7f780a8'
            '9049ab3f9600a1592a54c41a166c76e046c393e1cfe7c4e769155b7317d197ee'
            '9f2df55dd5c718e361c66b520b3304024e6d316e9cc0db0ddbffa926868188ae'
            '894466f17f1304d53656e88597f415cb17cd337acd371fae5f9e8a087f339ed4'
            'e4ea8e6788163d9f8db8f1f40023db3ea0a1358f9a4510169f2d4c4fe6a887ed'
            '0850a8a8dea9003c67a8ee1fa5eb19a6599eaad9f2ad09db753b74dc5048fdbc'
            '746cb474c5a2c26fc474256e430e035e604b71b27df1003d4af85018fa263f4a')
