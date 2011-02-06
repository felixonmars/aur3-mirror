# Contributor: quantax -- contact via Arch Linux forum or AUR

pkgname=ut1999-bonuspack3
pkgver=20000511
pkgrel=1
pkgdesc="Bonuspack 3: The Inoxx Pack for Unreal Tournament."
arch=('i686')
url="http://www.unrealtournament2004.com/utgoty/"
license=('custom')
groups=(ut1999-goty ut1999-bonuspacks)
depends=(ut1999)
replaces=(ut-bonuspack3)
source=(http://downloads.unrealadmin.org/UnrealTournament/BonusPack/utinoxxpacknoumod.zip)
md5sums=('2825ad2bbf5c9ea0887b91907c16dd31')
noextract=(utinoxxpacknoumod.zip)

build() {
    cd "${srcdir}"
    /bin/install --directory -- "${pkgdir}/opt/ut"
    /usr/bin/bsdtar xfC utinoxxpacknoumod.zip "${pkgdir}/opt/ut" || return 1
    /bin/chmod -R -- 644 ${pkgdir}/opt/ut/*/*
}

