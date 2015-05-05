# Maintainer : blaale (contact me via https://github.com/blaale)
# Contributor: Ionut Biru <ibiru@archlinuxorg
# Contributor: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>
# Contributor: Anders Bostrom <anders.bostrom@home.se>

# NOTE: Modified version of /var/abs/extra/thunderbird/PKGBUILD

pkgname=thunderbird-ubuntu
pkgver=31.6.0
pkgrel=2
pkgdesc="Standalone Mail/News reader with global menu support and libnotify integration"
arch=('i686' 'x86_64')
license=('MPL' 'GPL')
url="http://www.mozilla.org/thunderbird/"
depends=('alsa-lib' 'dbus-glib' 'desktop-file-utils' 'gtk2' 'hicolor-icon-theme' 'hunspell' 'libevent' 'libvpx' 'libxt' 'mime-types' 'mozilla-common' 'nss' 'sqlite' 'startup-notification')
makedepends=('unzip' 'zip' 'python2' 'wireless_tools' 'yasm' 'mesa' 'libpulse')
optdepends=('libcanberra: for sound support')
provides=("thunderbird=${pkgver}")
conflicts=('thunderbird')
install=thunderbird.install
source=(https://ftp.mozilla.org/pub/mozilla.org/thunderbird/releases/$pkgver/source/thunderbird-$pkgver.source.tar.bz2
        mozconfig
        thunderbird.desktop
        thunderbird-install-dir.patch
        vendor.js
        rhbz-966424.patch
        revert-removal-of-native-notifications.patch
        unity-menubar.patch)
options=(!emptydirs)
sha256sums=('ccbf8cbb740bc1b30ecf4fe39aab226607f9a41e23a07e994c508a90e8b70508'
            '7021a0907ebaffec7cad2928a773d8a0763a9790b9b97b58f72fad52e981296b'
            '3fba13d88aeb003ab0811ef739463858172ce0662a1c7d62835df3d83ddbb8fb'
            '9049ab3f9600a1592a54c41a166c76e046c393e1cfe7c4e769155b7317d197ee'
            'e4ea8e6788163d9f8db8f1f40023db3ea0a1358f9a4510169f2d4c4fe6a887ed'
            '746cb474c5a2c26fc474256e430e035e604b71b27df1003d4af85018fa263f4a'
            '3a83f10b22b6d0629aad3c09621f0234891971bb67f63695c1bf763f9541a9a9'
            '964236d3cb2355dc6f8b87661ea1372c738c751325b363d4aa7f669cc5665755')
#validpgpkeys=('2B90598A745E992F315E22C58AB132963A06537A')

prepare() {
  cd comm-esr31
  patch -Np1 -i "$srcdir/thunderbird-install-dir.patch"

  cp "$srcdir/mozconfig" .mozconfig

  # https://bugs.archlinux.org/task/41689
  patch -Np1 -d mozilla -i ../../rhbz-966424.patch

  # patch the unity global menu in
  patch -Np1 -i ../unity-menubar.patch

  # revert the removal of native notifications
  patch -Np1 -i ../revert-removal-of-native-notifications.patch

  # configure script misdetects the preprocessor without an optimization level
  # https://bugs.archlinux.org/task/34644
  sed -i '/ac_cpp=/s/$CPPFLAGS/& -O2/' mozilla/configure
}

build() {
  cd comm-esr31

  export LDFLAGS="$LDFLAGS -Wl,-rpath,/usr/lib/thunderbird"
  export PYTHON="/usr/bin/python2"

  make -j1 -f client.mk build MOZ_MAKE_FLAGS="$MAKEFLAGS"
}

package() {
  cd comm-esr31
  make -j1 -f client.mk DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir"/vendor.js "$pkgdir/usr/lib/thunderbird/defaults/preferences/vendor.js"

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
