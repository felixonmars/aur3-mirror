# Creator: Tom Boshoven <tomboshoven@gmail.com>

pkgname=dod-you-have-to-name-the-expansion-pack
pkgver=1
pkgrel=0
pkgdesc="You Have To Name The Expansion Pack: Expansion for Dungeons of Dredmor"
arch=(i686 x86_64)
url="http://www.gaslampgames.com/"
license=(unknown)
depends=(dungeons-of-dredmor)
# From a post on the DoD forums.
# There is no official standalone release, but use of this url is allowed by the devs.
source=('http://db.tt/ooC7yQou')
md5sums=('98378af6124c6ce2898eed34bd6bd22a')
PKGEXT='.pkg.tar'

_filename="DoD - YHTNtEP.rar"
_gamedir="/opt/dredmor"

build() {
  install -d "${pkgdir}${_gamedir}"
  cd "${srcdir}"
  cp -Rv "expansion2" "${pkgdir}${_gamedir}"
}
