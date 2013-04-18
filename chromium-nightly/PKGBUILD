# $Id$
# Maintainer: Benoît Zugmeyer
# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=chromium-nightly
_realname=chromium-nightly
_displayname="Chromium Nightly"
pkgver=LATEST
pkgrel=2
pkgdesc="The open-source project behind Google Chrome, nightly binary"
arch=('i686' 'x86_64')
url="http://www.chromium.org/"
license=('BSD')
depends=('gtk2' 'nss' 'alsa-lib' 'xdg-utils' 'bzip2' 'libevent' 'libxss'
         'libgcrypt' 'ttf-font' 'udev' 'dbus' 'flac' 'opus' 'libwebp'
         'speech-dispatcher' 'pciutils' 'desktop-file-utils'
         'hicolor-icon-theme')
makedepends=()
optdepends=('kdebase-kdialog: needed for file dialogs in KDE')
backup=("etc/$_realname/default")
install=chromium.install

_arch='Linux'
[ "$CARCH" = 'x86_64' ] && _arch='Linux_x64'
_pkgver=$(curl -s "http://commondatastorage.googleapis.com/chromium-browser-continuous/$_arch/LAST_CHANGE")

source=("http://commondatastorage.googleapis.com/chromium-browser-continuous/$_arch/$_pkgver/chrome-linux.zip"
        chromium.desktop
        chromium.default
        chromium.sh
        LICENSE)
sha256sums=('SKIP'
            '09bfac44104f4ccda4c228053f689c947b3e97da9a4ab6fa34ce061ee83d0322'
            '478340d5760a9bd6c549e19b1b5d1c5b4933ebf5f8cfb2b3e2d70d07443fe232'
            '4999fded897af692f4974f0a3e3bbb215193519918a1fa9b31ed51e74a2dccb9'
            'c9a5bd7c8cc1267ddacdc5228c68ecd811cf6d74286e9141bc80d8af2eb1a025')
PKGEXT='.pkg.tar'


pkgver() {
  echo "$_pkgver"
}

build() {
  cd "$srcdir/chrome-linux"

  # Fix rights
  chmod -R go=u-w .

  sed -i 's/libudev.so.0/libudev.so.1/' chrome

  # Rebrand
  sed -i "s/^Name=.*/Name=$_displayname/" "$srcdir/chromium.desktop"
  sed -i "s/^Exec=.*/Exec=$_realname %U/" "$srcdir/chromium.desktop"
  sed -i "s/^Icon=.*/Icon=$_realname/" "$srcdir/chromium.desktop"

  sed -i 's/\bchromium\([ \/]\)/'"$_realname"'\1/g' "$srcdir/chromium.sh"
}

package() {
  cd "$srcdir/chrome-linux"

  install -D chrome "$pkgdir/usr/lib/$_realname/$_realname"

  # Precompiled version does not define the sandbox path, so we can't use it
  #install -Dm4755 -o root -g root chrome_sandbox \
  #  "$pkgdir/usr/lib/chromium/chromium-sandbox"

  cp {*.pak,libffmpegsumo.so,nacl_helper{,_bootstrap}} \
    {libppGoogleNaClPluginChrome.so,nacl_irt_*.nexe} \
    "$pkgdir/usr/lib/$_realname/"

  if [[ $CARCH == i686 ]]; then
    rm "$pkgdir/usr/lib/$_realname/nacl_irt_x86_64.nexe"
  fi

  # Allow users to override command-line options
  install -Dm644 "$srcdir/chromium.default" "$pkgdir/etc/$_realname/default"

  cp -a locales "$pkgdir/usr/lib/$_realname/"

  install -Dm644 chrome.1 "$pkgdir/usr/share/man/man1/$_realname.1"

  install -Dm644 "$srcdir/chromium.desktop" \
    "$pkgdir/usr/share/applications/$_realname.desktop"


  install -Dm644 "product_logo_48.png" \
    "$pkgdir/usr/share/icons/hicolor/48x48/apps/$_realname.png"

  install -D "$srcdir/chromium.sh" "$pkgdir/usr/bin/$_realname"

  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_realname/LICENSE"
}

# vim:set ts=2 sw=2 et:
