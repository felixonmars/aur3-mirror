# Contributor: quantax -- contact via Arch Linux forum or AUR

pkgname=ut1999-bonuspack2
pkgver=20000104
pkgrel=1
pkgdesc="Bonuspack 2: The Digital Extremes Pack for Unreal Tournament."
arch=('i686')
url="http://www.unrealtournament2004.com/utgoty/"
license=('custom')
groups=(ut1999-goty ut1999-bonuspacks)
depends=(ut1999)
makedepends=(umodunpack)
replaces=(ut-bonuspack2)
install=install
source=(http://downloads.unrealadmin.org/UnrealTournament/BonusPack/utbonuspack2.zip
        install)
md5sums=('5cf174dab9f91827da9935231c8d1ea6'
         '4c08119de5a5f1be0baf6e6abf2ef7e0')

build() {
    cd "$srcdir"
    /bin/install --mode=644 -D -- CTF-HallOfGiants.unr \
            "$pkgdir/opt/ut/Maps/CTF-HallOfGiants.unr" || return 1
    /bin/install --mode=644 -D -- CTF-Orbital.unr \
            "$pkgdir/opt/ut/Maps/CTF-Orbital.unr" || return 1

    # Cannot unpack directly. Umodpack wants to apply some .ini changes.
    /usr/bin/umodunpack --base "$pkgdir/opt/ut" --extract "de.int" DE.umod \
            || return 1
    /usr/bin/umodunpack --base "$pkgdir/opt/ut" --extract "de.u" DE.umod \
            || return 1
    /usr/bin/umodunpack --base "$pkgdir/opt/ut" \
            --extract "demutators-readme.txt" DE.umod || return 1
    /usr/bin/umodunpack --base "$pkgdir/opt/ut" --extract "de-logo.bmp" \
            DE.umod || return 1
    /bin/chmod -R -- 644 $pkgdir/opt/ut/*/*
}

