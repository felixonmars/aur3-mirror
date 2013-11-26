# Maintainer: NiteHogg <keith.b.elliott [at] gmail [dot] com>

# Custom properties used in PKGBUILD and auto-package creation.
_filename_exp=evo-v[#.#].sdz
_force_update=n
_category='games'

pkgname=spring-evolutionrts
pkgver=6.69
pkgrel=1
pkgdesc="A free mod for the Spring engine, Evolution RTS revolves around \
fast thinking and micro-management as well as macro-management gameplay."
arch=(any)
url="http://www.evolutionrts.info"
license=('CCPL')
depends=("spring")
changelog="ChangeLog"
noextract="evo-v6.69.sdz"
source=("http://packages.springrts.com/builds/evo-v6.69.sdz")
md5sums=('dea6e779b10d4c7825e6902346d7dbd2')

package() {
    mkdir -p $pkgdir/usr/share/spring/mods
    install -Dm644 $srcdir/evo-v6.69.sdz $pkgdir/usr/share/spring/mods
}

# vim:set ts=2 sw=2 et:
