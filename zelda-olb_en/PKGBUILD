# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=zelda-olb_en
pkgver=3.6
pkgrel=2
pkgdesc="'Zelda: Oni Link Begins' is the sequel of 'Zelda: Return of the Hylian', a fan-made Zelda game (english version)"
url="http://www.zeldaroth.fr/"
arch=('i686' 'x86_64')
depends=('sdl_gfx' 'sdl_mixer' 'sdl_image')
makedepends=("imagemagick")
conflicts=("zelda-olb_fr")
license=('unknown')
source=("http://www.zeldaroth.fr/us/files/OLB/Linux/ZeldaOLB_US-src-linux.zip"
        "zelda-olb-datafolders.patch"
        "zelda-olb.desktop")
sha256sums=('57b48f3e9e7432283e71a54f02106f93b859b0012c41b78b5be8e88086ae4bd6'
            '62cc84b690c5b5fb640cff6bc87251324fa424542725dc32c8a8f209f1921d1d'
            'd000453cd0abc8841033bdf79d00d7c65f592fb32379d261c5c0ed7250288569')

prepare() {
  # use user's $HOME for saves and load data from /usr/share/zolb
  patch -Np0 < zelda-olb-datafolders.patch

  # create an icon
  cd ZeldaOLB_US-src-linux/src/data/images/logos
  convert fond.png -thumbnail '48x48' -background black -gravity center -extent 48x48 "$srcdir"/zelda-olb.png
}

build() {
  make -C ZeldaOLB_US-src-linux/src
}

package() {
  cd ZeldaOLB_US-src-linux/src

  install -Dm755 ZeldaOLB "$pkgdir"/usr/bin/zelda-olb
  ln -s zelda-olb "$pkgdir"/usr/bin/zolb
  
  install -d "$pkgdir"/usr/share/zelda-olb
  cp -rup data/{images,map,music,sound} "$pkgdir"/usr/share/zelda-olb

  install -Dm644 "$srcdir/"zelda-olb.png "$pkgdir"/usr/share/pixmaps/zelda-olb.png
  install -Dm644 "$srcdir/"zelda-olb.desktop "$pkgdir"/usr/share/applications/zelda-olb.desktop
}
