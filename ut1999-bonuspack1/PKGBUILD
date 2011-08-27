# Contributor: quantax -- contact via Arch Linux forum or AUR

pkgname=ut1999-bonuspack1
pkgver=20000225
pkgrel=1
pkgdesc="Bonuspack 1: The Epic Pack for Unreal Tournament."
arch=('i686')
url="http://www.unrealtournament2004.com/utgoty/"
license=('custom')
groups=(ut1999-goty ut1999-bonuspacks)
depends=(ut1999)
makedepends=(umodunpack)
replaces=(ut-bonuspack1)
source=(http://downloads.unrealadmin.org/UnrealTournament/BonusPack/utbonuspack.zip)
md5sums=('e79b05b8a302593b53721e2a4295c6c0')

build() {
    cd "${srcdir}"
    /bin/install --directory -- ${pkgdir}/opt/ut/{System,Textures}
    /usr/bin/umodunpack --base ${pkgdir}/opt/ut --unpack UTBonusPack.umod \
            || return 1
    /bin/mv -f -t ${pkgdir}/opt/ut/System -- ${pkgdir}/opt/ut/system/*
    /bin/mv -f -t ${pkgdir}/opt/ut/Textures -- ${pkgdir}/opt/ut/textures/*
    /bin/rm -rf -- ${pkgdir}/opt/ut/{system,textures}
}

