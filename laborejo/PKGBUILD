# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=laborejo
pkgver=0.8
pkgrel=1
pkgdesc="Music Notation Workshop"
arch=(any)
url="http://www.$pkgname.org/"
license=('GPL3')
depends=('pyqt' 'shared-mime-info')
install="$pkgname.install"
optdepends=('lilypond: lilypond support'
            'python-pysmf: MIDI export'
            'python-pyliblo: sessions support'
            'non-session-manager: sessions support'
            'calfbox: playback'
            'jack: JACK output')
source=("https://github.com/nilsgey/Laborejo/tarball/$pkgver"
        "http://laborejo.org/data/_uploaded/wrench-silber.png"
        $pkgname.{desktop,xml})
md5sums=('ff792561cf5a4b3ca4419f45be46d21a'
         '0794e3d9ae73f73db27ec950ad572695'
         '06243d0f699a331dfb04cc79367786e9'
         'ad496fb927d0a4a8956220930b5dcb22')

package() {
  cd "$srcdir/nilsgey-Laborejo-"*

  # data
  install -d "$pkgdir/usr/share/$pkgname"
  cp -a * "$pkgdir/usr/share/$pkgname"

  # launcher
  install -d "$pkgdir/usr/bin"
  ln -s /usr/share/$pkgname/$pkgname-qt \
     "$pkgdir/usr/bin/$pkgname"

  # desktop file
  install -Dm644 ../$pkgname.desktop \
     "$pkgdir/usr/share/applications/$pkgname.desktop"

  # mime
  install -Dm644 ../$pkgname.xml \
     "$pkgdir/usr/share/mime/packages/$pkgname.xml"

  # icon
  install -Dm644 ../wrench-silber.png \
     "$pkgdir/usr/share/icons/$pkgname.png"
}

# vim:set ts=2 sw=2 et:
