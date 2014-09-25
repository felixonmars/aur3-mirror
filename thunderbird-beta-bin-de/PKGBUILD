# Maintainer: thebastl
# Contributor: Det
# Based on [extra]'s thunderbird

pkgname=thunderbird-beta-bin-de
#_basever=33.0
#_rc=1
pkgver=33.0b1
pkgrel=1
pkgdesc="Standalone Mail/News reader - Bleeding edge binary version"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'MPL')
url="https://www.mozilla.org/thunderbird"
depends=('alsa-lib' 'cairo' 'dbus-glib' 'desktop-file-utils' 'fontconfig' 'freetype2' 'gtk-update-icon-cache'
         'gtk2' 'hicolor-icon-theme' 'libnotify' 'libpng' 'libvpx' 'libxt' 'mime-types' 'nss' 'pixman'
         'sqlite' 'startup-notification')
optdepends=('libcanberra: for sound support')
provides=("thunderbird=$pkgver")
conflicts=('thunderbird-beta')
install=$pkgname.install
_arch=x86_64  # Workaround for mkaurball: https://bugs.archlinux.org/task/40711
[[ $CARCH = i686 ]] && _arch=i686
#source=("https://ftp.mozilla.org/pub/mozilla.org/thunderbird/candidates/$_basever-candidates/build$_rc/linux-$_arch/de/thunderbird-$_basever.tar.bz2
source=("https://ftp.mozilla.org/pub/mozilla.org/thunderbird/releases/$pkgver/linux-$_arch/de/thunderbird-$pkgver.tar.bz2"
        "$pkgname.desktop"
        "$pkgname-safe.desktop"
        'vendor.js')
md5sums=(`curl -sL ${source/li*}/MD5SUMS | grep linux-$_arch/de | grep tar | cut -d ' ' -f1`
         'de0794211bbb3d6a4cc73e5190a88d13'  # thunderbird-beta-bin-de.desktop
         '877828d9ea305c9a8446fe2af04aafea'  # thunderbird-beta-bin-de-safe.desktop
         '5a53179d14ae9631b7afe5e4d0fc0b25') # vendor.js

package() {
  msg2 "Creating directories"
  # Create directories
  install -d "$pkgdir"/{usr/{bin,share/applications},opt}

  msg2 "Moving stuff in place"
  # Install
  cp -r thunderbird/ "$pkgdir"/opt/$pkgname-$pkgver
  install -m644 vendor.js "$pkgdir"/opt/$pkgname-$pkgver/defaults/pref/

  # /usr/bin symlink
  ln -s /opt/$pkgname-$pkgver/thunderbird "$pkgdir"/usr/bin/thunderbird-beta-de

  # Desktop
  install -m644 *.desktop "$pkgdir"/usr/share/applications/

  # Icons
  for i in 16 22 24 32 48 256; do
    install -d "$pkgdir"/usr/share/icons/hicolor/${i}x$i/apps/
    ln -s /opt/$pkgname-$pkgver/chrome/icons/default/default$i.png \
          "$pkgdir"/usr/share/icons/hicolor/${i}x$i/apps/$pkgname.png
  done
}