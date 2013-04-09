# Maintainer: OrdinaryMagician <saniukeokusainaya@gmail.com>
pkgname=nasu-git
pkgver=20130409
pkgrel=1
pkgdesc="A standalone version of the minigame from Yume Nikki"
arch=('x86_64' 'i686')
url="https://github.com/OrdinaryMagician/nasu"
license=('custom:MULSv2')
depends=('sdl' 'sdl_image' 'sdl_mixer' 'sdl_ttf' 'sdl_gfx')
makedepends=('git' 'make')
source=("git://github.com/OrdinaryMagician/nasu.git")
md5sums=("SKIP")
_gitname="nasu"

pkgver()
{
  date -u +%Y%m%d
}

build()
{
  cd "${srcdir}/${_gitname}"
  make -f makefile.linux
}

package()
{
  cd "${srcdir}/${_gitname}"
  install -dm755 "${pkgdir}/usr/share/games/nasu"
  install -Dm644 -t "${pkgdir}/usr/share/games/nasu" gamedata/*
  install -Dm755 nasu "${pkgdir}/usr/bin/nasu"
  # MULS license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/nasu/LICENSE"
}
