# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=zelda-roth_en
pkgver=6.11
pkgrel=2
pkgdesc="'Zelda: Return of the Hylian' is a fan-made Zelda Game (english version)"
url="http://www.zeldaroth.fr/"
arch=('i686' 'x86_64')
depends=('sdl_gfx' 'sdl_mixer' 'sdl_image')
makedepends=('imagemagick')
conflicts=("zelda-roth_fr")
license=('unknown')
source=("http://www.zeldaroth.fr/us/files/ROTH/Linux/ZeldaROTH_US-src-linux.zip"
        "zelda-roth-datafolders.patch"
        "zelda-roth.desktop")
sha256sums=('9919a7fb0d2781f6323bfa27a7929fea68f4b0f26786ba9b6880b1f6a3e6f684'
            'b98ef94303ffc6226727be4d1b12a2b9edd23459e0be1f9f476ac2593e9e331b'
            'e0caa0d6b3ae5f822ee60baf3a1405831934afab9d25c513994308c2aa119cc0')

prepare() {
  # use user's $HOME for saves and load data from /usr/share/zolb
  patch -Np0 < zelda-roth-datafolders.patch

  # create an icon
  cd ZeldaROTH_US-src-linux/src/data/images/logos
  convert fond.png -thumbnail '48x48' -background black -gravity center -extent 48x48 "$srcdir"/zelda-roth.png
}

build () {
  make -C ZeldaROTH_US-src-linux/src
}

package () {
  cd ZeldaROTH_US-src-linux/src

  install -Dm755 ZeldaROTH_US "$pkgdir"/usr/bin/zelda-roth
  ln -s zelda-roth "$pkgdir"/usr/bin/zroth
  
  install -d "$pkgdir"/usr/share/zelda-roth
  cp -rup data/{images,map,music,sound} "$pkgdir"/usr/share/zelda-roth

  install -Dm644 "$srcdir/"zelda-roth.png "$pkgdir"/usr/share/pixmaps/zelda-roth.png
  install -Dm644 "$srcdir/"zelda-roth.desktop "$pkgdir"/usr/share/applications/zelda-roth.desktop
}
