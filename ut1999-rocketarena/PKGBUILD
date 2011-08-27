## Contributor: quantax -- contact via Arch Linux forum or AUR

pkgname=ut1999-rocketarena
pkgver=1.6
pkgrel=2
pkgdesc="The popular Rocket Arena gametype also for UT1999."
arch=('i686')
url="http://www.moddb.com/mods/rocket-arenaut"
license=('custom')
groups=(ut1999-goty)
depends=(ut1999-bonuspack3)
makedepends=(umodunpack)
optdepends=("ut1999-bonuspack1: requires ServerPackages=RocketArenaMultiMesh setting")
install=install.sh
source=(rocketarena-$pkgver.zip::'http://www.ut-files.com/index.php?dir=GameTypes/RocketArena/&file=rocketarenautfull160.zip'
        install.sh)
md5sums=('66569b63e630690e9ca5b22722b4a548'
         'dfb1f79f67027be07df189d41e3a2422')

build() {
    cd "$srcdir"

    /bin/install --mode=0644 -D RocketArenaReadme.txt \
            "$pkgdir/opt/ut/Help/RocketArenaReadme.txt"
    /usr/bin/umodunpack --base "$pkgdir/opt/ut" --unpack \
            RocketArenaUTFull160.umod || return 1
    /usr/bin/umodunpack --base "$pkgdir/opt/ut" --unpack \
            RocketArenaUTBonusPack160.umod || return 1
    /usr/bin/find "$pkgdir/opt/ut" -type d -exec chmod 755 '{}' \;
    /usr/bin/find "$pkgdir/opt/ut" -type f -exec chmod 644 '{}' \;

    ## xutfx.utx is also in ut1999-bonuspack3. Thus remove it and depend
    ## on that package.
    /bin/rm -f -- "$pkgdir/opt/ut/Textures/xutfx.utx" || return 1
}

