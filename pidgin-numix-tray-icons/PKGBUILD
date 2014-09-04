# Maintainer: DeadSurgeon42 <deadsurgeon42 at gmail dot com>
# Based on the pidgin-elementary-tray-icons PKGBUILD by Adria Arrufat <swiftscythe at gmail dot com>

pkgname=pidgin-numix-tray-icons
pkgver=1.0
pkgrel=1
pkgdesc="Numix styled tray icon theme for Pidgin"
arch=('any')
url="http://sourceforge.net/projects/numix-pidgin-tray-icons/"
license=('GPL')
source=(http://downloads.sourceforge.net/project/numix-pidgin-tray-icons/numix-pidgin-tray-icons-v.$pkgver.zip)
md5sums=('6909aa7b12d48104e9efa9d769e34e1f')
makedepends=()
install=$pkgname-$pkgver-$pkgrel.install
depends=('pidgin')

build() {
  mkdir -p "$pkgdir/usr/share/pixmaps/pidgin/tray/hicolor/16x16/status/new/"
  mkdir -p "$pkgdir/usr/share/pixmaps/pidgin/tray/hicolor/22x22/status/new/"
  mkdir -p "$pkgdir/usr/share/pixmaps/pidgin/tray/hicolor/32x32/status/new/"
  mkdir -p "$pkgdir/usr/share/pixmaps/pidgin/tray/hicolor/48x48/status/new/"
   
  cp -Rf $srcdir/16x16/status/* "$pkgdir/usr/share/pixmaps/pidgin/tray/hicolor/16x16/status/new/"
  cp -Rf $srcdir/22x22/status/* "$pkgdir/usr/share/pixmaps/pidgin/tray/hicolor/22x22/status/new/"
  cp -Rf $srcdir/32x32/status/* "$pkgdir/usr/share/pixmaps/pidgin/tray/hicolor/32x32/status/new/"
  cp -Rf $srcdir/48x48/status/* "$pkgdir/usr/share/pixmaps/pidgin/tray/hicolor/48x48/status/new/"

  mv $pkgdir/usr/share/pixmaps/pidgin/tray/hicolor/16x16/status/new/pidgin-tray-mail.png $pkgdir/usr/share/pixmaps/pidgin/tray/hicolor/16x16/status/new/pidgin-tray-email.png
  mv $pkgdir/usr/share/pixmaps/pidgin/tray/hicolor/22x22/status/new/pidgin-tray-mail.png $pkgdir/usr/share/pixmaps/pidgin/tray/hicolor/22x22/status/new/pidgin-tray-email.png
  mv $pkgdir/usr/share/pixmaps/pidgin/tray/hicolor/32x32/status/new/pidgin-tray-mail.png $pkgdir/usr/share/pixmaps/pidgin/tray/hicolor/32x32/status/new/pidgin-tray-email.png
  mv $pkgdir/usr/share/pixmaps/pidgin/tray/hicolor/48x48/status/new/pidgin-tray-mail.png $pkgdir/usr/share/pixmaps/pidgin/tray/hicolor/48x48/status/new/pidgin-tray-email.png
}

