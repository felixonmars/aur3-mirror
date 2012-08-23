# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=cm-grace-bin
pkgver=3.8.0
pkgrel=1
pkgdesc="(Graphical Realtime Algorithmic Composition Environment) is a cross-platform GUI app for algorithmic music composition with CM3."
arch=(i686 x86_64)
url="http://commonmusic.sourceforge.net/"
license=('GPL')
depends=('alsa-lib' 'freetype2' 'libxinerama' 'mesa')
[[ $CARCH == "x86_64" ]] && depends=(${depends[@]/#/lib32-})
optdepends=('jack: jack support')
provides=('cm')
conflicts=('cm')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/project/commonmusic/cm/$pkgver/Grace-$pkgver-ubuntu.zip"
        "http://commonmusic.sourceforge.net/index_files/cmlogobb.png"
        "$pkgname.desktop")
md5sums=('c3e03f132232a55e4164e95b1991906e'
         '94071a8ecb77bc895cd0abe642d1bed7'
         '98b16cd7c87fb524e882fa1679b7dfb5')
package() {
  cd "$srcdir"

  # bin
  install -Dm755 Grace \
    "$pkgdir/usr/bin/cm-grace"

  # icon
  install -Dm644 cmlogobb.png \
    "$pkgdir/usr/share/pixmaps/cm-grace.png"

  # desktop file
  install -Dm644 $pkgname.desktop \
    "$pkgdir/usr/share/applications/cm-grace.desktop"
}

# vim:set ts=2 sw=2 et:
