# Maintainer: Justin Hill <bigfoot_30045 at yahoo dot com>

pkgname=platinumarts-sandbox
pkgver=2.6.1
pkgrel=1
pkgdesc="A free and open source 3D game design program for kids and adults."
arch=('i686' 'x86_64')
url="http://sandboxgamemaker.com/"
license=('GPL')
groups=()
depends=('sdl' 'sdl_image' 'sdl_mixer' 'zlib')
makedepends=('unzip')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
noextract=()
source=(http://sandboxgamemaker.com/sandbox/PlatinumArtsSandbox${pkgver}Multiplatform.zip
        pasandbox.desktop)
md5sums=('1128473500d02346145219e7a9aaa682'
         '709edf8dea868e8dedde022323d9473a')

build() {
  cd $pkgdir
  mkdir -p usr/share/applications
  cd $srcdir
  cp -r PlatinumArtsSandbox${pkgver} $pkgdir/usr/share
  install -D -m 0644 "pasandbox.desktop" "$pkgdir/usr/share/applications/pasandbox.desktop"
}

