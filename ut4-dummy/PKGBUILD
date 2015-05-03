# Maintainer: Arvedui <arvedui@posteo.de>
# Contributor: haagch <haagch@studi.informatik.uni-stuttgart.de>
# Contributor: bergalath <bga@bga.la>

pkgname=ut4-dummy
pkgver=2532759
pkgrel=1
pkgdesc='PRE-ALPHA of the new Unreal Tournament based on Unreal Engine 4. Registration at the forum required. Download zip file and put it in a known directory'
arch=('x86_64')
url='https://forums.unrealtournament.com/showthread.php?12011-Unreal-Tournament-Pre-Alpha-Playable-Build'
DLAGENTS+=('file::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", from https://forums.unrealtournament.com/showthread.php?12011-Unreal-Tournament-Pre-Alpha-Playable-Build. Registration required."; exit 1')
license=('custom')
depends=('unzip')
install=ut4.install
source=(UnrealTournament4.desktop
        UnrealTournament
        ut4_install.sh)
noextract=(UnrealTournament-Client-XAN-${pkgver}-Linux.zip)
md5sums=('e4fbcf220b9e2db19118ec66856598a1'
         'eb998b2e97e83daf4bce42c684ff2649'
         '44bdb1ce2c5d47854d5badc3efeb7027')

package() {
        install -d "$pkgdir/opt/ut4"
        install ut4_install.sh "$pkgdir/opt/ut4/ut4_install.sh"

        install -d "$pkgdir/usr/bin"
        install UnrealTournament "$pkgdir/usr/bin/UnrealTournament"

        install -d "$pkgdir/usr/share/applications/"
        install UnrealTournament4.desktop "$pkgdir/usr/share/applications/"
}
