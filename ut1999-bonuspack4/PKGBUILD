# Contributor: quantax -- contact via Arch Linux forum or AUR

pkgname=ut1999-bonuspack4
pkgver=20001223
pkgrel=1
pkgdesc="Bonuspack 4: The Christmas 2000 Pack for Unreal Tournament."
arch=('i686')
url="http://www.unrealtournament2004.com/utgoty/"
license=('custom')
groups=(ut1999-bonuspacks)
depends=(ut1999)
makedepends=(umodunpack)
replaces=(ut-bonuspack4)
source=(http://downloads.unrealadmin.org/UnrealTournament/BonusPack/utbonuspack4.zip)
md5sums=('c9e7373ee15472ec53e62a7199f33966')

build() {
    cd "${srcdir}"
    /bin/install --directory -- ${pkgdir}/opt/ut/{System,Textures}
    /usr/bin/umodunpack --base ${pkgdir}/opt/ut --unpack UTBonusPack4.umod \
            || return 1
    /bin/mv -f -t ${pkgdir}/opt/ut/System -- ${pkgdir}/opt/ut/system/*
    /bin/mv -f -t ${pkgdir}/opt/ut/Textures -- ${pkgdir}/opt/ut/textures/*
    /bin/rm -rf -- ${pkgdir}/opt/ut/{system,textures}
}

