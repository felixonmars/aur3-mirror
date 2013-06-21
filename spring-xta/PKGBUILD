# Maintainer: NiteHogg <keith.b.elliott [at] gmail [dot] com>

# Custom properties used in PKGBUILD and auto-package creation.
_name="XTA"
_rooturl="http://springfiles.com/sites/default/files/downloads/spring/games/"
_prefix=xtapev
_version=9728
_suffix=.sdz
_force_update=n
_category='games'
_include=()

_filename="$_prefix$_version$_suffix"

pkgname=spring-xta
pkgver=9.728
pkgrel=1
pkgdesc="One of the original mods for Spring RTS, and the one many players \
feel is the \"more OTA than OTA itself\" due to $_name's authentic feel combined \
with the Spring Engine's capabilities."
arch=(any)
url="http://springrts.com/wiki/XTA"
license=('unknown')
depends=("spring")
changelog="ChangeLog"
noextract="$_filename"
source=("$_rooturl/$_filename")
md5sums=('f23a1440061db00881dacb66b69affa4')

package() {

    mkdir -p $pkgdir/usr/share/spring/mods
    install -Dm644 $srcdir/$_filename $pkgdir/usr/share/spring/mods
}

# vim:set ts=2 sw=2 et:
