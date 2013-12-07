# Maintainer:
# Contributor: Adria <swiftscythe@gmail.com>
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>
# Contributor: Daenyth <Daenyth+Arch AT gmail DOT com>
# Contributor: Juan M Martínez <jm--at--guide42.com>

pkgname=skype2-staticqt
pkgver=2.2.0.35
pkgrel=1
arch=('x86_64' 'i686')
pkgdesc="P2P software for high-quality voice communication with its own Qt libraries"
url="http://www.skype.com/"
license=('custom')
options=('!strip')
install=skype.install
conflicts=('skype', 'skype-staticqt', 'skype2')
if [ "$CARCH" = "x86_64" ]
then
  depends=(xdg-utils hicolor-icon-theme lib32-libxss lib32-libxv lib32-libsm lib32-libxi lib32-libxrandr lib32-fontconfig lib32-glib2 lib32-libtiff)
  optdepends=('lib32-v4l-utils: webcam support'
            'lib32-libcanberra: XDG sound support'
            'lib32-alsa-lib: ALSA support'
            'lib32-libpulse: PulseAudio support')
else
  depends=(xdg-utils hicolor-icon-theme libxss libxv libsm libxi libxrandr fontconfig glib2 libtiff)
  optdepends=('v4l-utils: webcam support'
            'libcanberra: XDG sound support'
            'alsa-lib: ALSA support'
            'libpulse: PulseAudio support')
fi
provides=(skype)
replaces=(skype)

source=(http://download.skype.com/linux/skype_static-$pkgver.tar.bz2 PERMISSION)
sha256sums=('4f5bf7f2029fcd90d6d5f8477ac3e9a87fac9fd4cb08c0634747c435e985167d'
            '20b2755151bd24ae0f759a565744faea95942e6729f9d02e83bf2b633e9306fd')

package() {
  cd "$srcdir/skype_static-$pkgver"

  # Executable
  install -D skype "$pkgdir/usr/bin/skype"

  # Data
  mkdir -p "$pkgdir"/usr/share/skype/{avatars,lang,sounds}
  install -m 644 avatars/* "$pkgdir/usr/share/skype/avatars"
  install -m 644 lang/*    "$pkgdir/usr/share/skype/lang"
  install -m 644 sounds/*  "$pkgdir/usr/share/skype/sounds"

  # DBus Service
  install -Dm 644 skype.conf \
    "$pkgdir/etc/dbus-1/system.d/skype.conf"

  # Icons
  for _i in 16 32 48; do
    install -Dm 644 icons/SkypeBlue_${_i}x${_i}.png \
      "$pkgdir/usr/share/icons/hicolor/${_i}x${_i}/skype.png"
  done
  install -Dm 644 icons/SkypeBlue_48x48.png \
    "$pkgdir/usr/share/pixmaps/skype.png"

  # Desktop file
  install -Dm 644 skype.desktop \
    "$pkgdir/usr/share/applications/skype.desktop"

  # License
  install -Dm 644 LICENSE \
    "$pkgdir/usr/share/licenses/skype/LICENSE"
  install -Dm 644 "$srcdir/PERMISSION" \
    "$pkgdir/usr/share/licenses/skype/PERMISSION"
}
