# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=laborejo-git
pkgver=0.8.ade254a
pkgrel=1
pkgdesc="Music Notation Workshop"
arch=(any)
url="http://www.laborejo.org/"
license=('GPL')
depends=('pyqt')
optdepends=('lilypond: lilypond support'
            'python-pysmf: MIDI export'
            'python-pyliblo: sessions support'
            'non-session-manager: sessions support'
            'calfbox: playback'
            'jack: JACK output')
makedepends=('git')
provides=("laborejo")
conflicts=("laborejo")
source=("laborejo::git+https://github.com/nilsgey/Laborejo.git"
        "http://laborejo.org/data/_uploaded/wrench-silber.png"
        laborejo.{desktop,xml})
md5sums=('SKIP'
         '0794e3d9ae73f73db27ec950ad572695'
         '06243d0f699a331dfb04cc79367786e9'
         'ad496fb927d0a4a8956220930b5dcb22')

pkgver() {
  cd "$srcdir/laborejo"
  echo `sed -n '/Version/s/=*\(Version \)*//gp' README`.`git describe --always | sed 's|-|.|g'`
}

package() {
  cd "$srcdir/laborejo"

  # data
  install -d "$pkgdir/usr/share/laborejo"
  cp -a * "$pkgdir/usr/share/laborejo"

  # launcher
  install -d "$pkgdir/usr/bin"
  ln -s /usr/share/laborejo/laborejo-qt \
     "$pkgdir/usr/bin/laborejo"

  # desktop file
  install -Dm644 ../laborejo.desktop \
     "$pkgdir/usr/share/applications/laborejo.desktop"

  # mime
  install -Dm644 ../laborejo.xml \
     "$pkgdir/usr/share/mime/packages/laborejo.xml"

  # icon
  install -Dm644 ../wrench-silber.png \
     "$pkgdir/usr/share/icons/laborejo.png"
}

# vim:set ts=2 sw=2 et:
