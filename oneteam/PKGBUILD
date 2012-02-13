# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=oneteam
pkgver=0.999.990
pkgrel=1
pkgdesc="Entreprise multi-network instant messaging client"
arch=('i686' 'x86_64')
url="http://oneteam.im/"
license=('GPL2' 'MPL')
depends=('gnome-vfs' 'libpulse' 'libxss' 'libnotify' 'xulrunner' 'cairo' 'gtk2' 'gcc-libs')
options=(!strip)
install='oneteam.install'
source=('oneteam.desktop')
sha256sums=('c13ba8d6a014d7e0731edd221def9c8dc1b334d36a86516c4ea11d0f7b9500b6')

if [ "$CARCH" = "i686" ]; then
  source+=("https://download.process-one.net/$pkgname/release-installers/$pkgname.tar.bz2")
  sha256sums+=('291035e0df52cfddfb09184d4887732579c4e7c578e4277cd981fc7ece6a9637')
elif [ "$CARCH" = "x86_64" ]; then
  source+=("https://download.process-one.net/$pkgname/release-installers/${pkgname}64.tar.bz2")
  sha256sums+=('4b040965a56d16e8b14e71a3163bacca2ed74fdb79d07f32a5cffccb9855ee42')
fi

package() {
  mkdir -p "$pkgdir/usr/lib"
  cp -a "$srcdir/$pkgname" "$pkgdir/usr/lib/"

  mkdir -p "$pkgdir/usr/bin"
  ln -s /usr/lib/oneteam/oneteam "$pkgdir/usr/bin/oneteam"

  install -D -m 0644 "$srcdir/$pkgname/chrome/icons/default/oneteam.png" "$pkgdir/usr/share/pixmaps/oneteam.png"
  install -D -m 0644 "$srcdir/oneteam.desktop" "$pkgdir/usr/share/applications/oneteam.desktop"
}

# vim:set ts=2 sw=2 et:
