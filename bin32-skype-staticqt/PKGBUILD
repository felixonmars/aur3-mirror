# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>
# Maintainer: Daenyth <Daenyth+Arch AT gmail DOT com>

pkgname=bin32-skype-staticqt
_pkgname=skype
pkgver=2.2.0.35
pkgrel=3
arch=(x86_64)
pkgdesc="P2P software for high-quality voice communication with its own Qt libraries. For x86_64 only"
url="http://www.skype.com/"
license=('custom')
options=('!strip')
install=skype.install
conflicts=('skype')
depends=(xdg-utils hicolor-icon-theme lib32-{alsa-lib,libxss,libxv,libsm,libxi,libxrandr,fontconfig,glib2})
optdepends=('lib32-v4l-utils: webcam support'
            'lib32-libcanberra: XDG sound support'
            'lib32-libpulse: PulseAudio support')
provides=(skype)
replaces=(skype)

source=(http://download.skype.com/linux/skype_static-$pkgver.tar.bz2 PERMISSION)
md5sums=('d948b8f04ad27b92297a99bcacc7b00b'
         '26e1772379d4d4df9471b6ed660a6d97')

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
    "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm 644 "$srcdir/PERMISSION" \
    "$pkgdir/usr/share/licenses/$_pkgname/PERMISSION"
}
