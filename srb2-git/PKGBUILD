# Maintainer: 404
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=srb2-git
pkgver=2.1.11.r1.gb1e1163
_patchver=${pkgver%.r*}
pkgrel=1
pkgdesc='A 3D Sonic fan game based off of Doom Legacy (aka "Sonic Robo Blast 2", development version)'
arch=('i686' 'x86_64')
license=('GPL')
url='http://www.srb2.org'
depends=('sdl2_mixer' 'libpng' 'srb2-data')
makedepends=('mesa' 'glu')
[ "$CARCH" == "i686" ] && makedepends+=('nasm')
conflicts=('srb2')
provides=('srb2')
source=("git+https://github.com/STJr/SRB2.git"
        "http://rosenthalcastle.org/srb2/SRB2-v${_patchver//./}-patch.zip"
        "https://raw.githubusercontent.com/STJr/SRB2/src/sdl/SDL_icon.xpm"
        "srb2.desktop"
        "srb2-opengl.desktop")
sha256sums=('SKIP'
            'SKIP'
            '25b73393baa18ac60782c3b4172c1d4345649322e420bbfe284e542445987d3f'
            'ac9fa63f29ad9413797da8c6f0a4f76fa6f4dd0710d1e84a457a8c42cf6df4f9'
            'f696bab390d2b1028bf2f5c5d4d838c0981dc211cec4c4a8f349b7ec0580e701')

pkgver() {
  cd SRB2
  git describe --long | sed -r 's/^SRB2_release_//;s/-/.r/;s/-/./'
}

prepare() {
  # abort due to makepkg quirk
  if [ ! -f SRB2-v${_patchver//./}-patch.zip ]; then
    msg2 "The \$pkgver changed due to a new tag in the repository, however makepkg does not"
    msg2 "update variables in the source array, so you are missing the latest patch data."
    msg2 "Please invoke makepkg again, it will then download the latest data."
    exit 1
  fi

  # disable Animated PNG saving support, allows build with libpng16
  sed 's|#define USE_APNG|/* & */|' -i SRB2/src/m_misc.c
}

build() {
  [ "$CARCH" == "x86_64" ] && IS64BIT="64" || IS64BIT=""
  # do not upx binary, do not use version script, show warnings, be verbose
  make -C SRB2/src LINUX$IS64BIT=1 NOUPX=1 NOVERSION=1 WARNINGMODE=1 ECHO=1
}

package() {
  [ "$CARCH" == "x86_64" ] && IS64BIT="64" || IS64BIT=""
  install -Dm755 SRB2/bin/Linux$IS64BIT/Release/lsdl2srb2 "$pkgdir"/usr/bin/srb2

  # data patch
  install -Dm644 patch.dta "$pkgdir"/usr/share/games/SRB2/patch.dta

  # icon + .desktop
  install -Dm644 SDL_icon.xpm "$pkgdir"/usr/share/pixmaps/srb2.xpm
  install -Dm644 srb2.desktop "$pkgdir"/usr/share/applications/srb2.desktop
  install -m644 srb2-opengl.desktop "$pkgdir"/usr/share/applications
}
