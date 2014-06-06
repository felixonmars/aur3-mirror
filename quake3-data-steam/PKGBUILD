# Maintainer: Alan Jenkins <alan.james.jenkins [at] gmail.com>
pkgname=quake3-data-steam
pkgver=1
pkgrel=1
pkgdesc="Quake 3 data via Steam"
arch=('any')
provides=('quake3-data')
depends=('steamcmd')
license=('GPL')
install='quake3-data-steam.install'
url='http://store.steampowered.com/app/2200'

package() {
    cd $srcdir

    # Use steamcmd to get quake3.
    mkdir -p $srcdir/quake3
    printf "Enter your Steam username:"
    read steam_username
    steamcmd +@sSteamCmdForcePlatformType windows +@ShutdownOnFailedCommand 1 +force_install_dir $srcdir/quake3 +login $steam_username "+app_update 2200 validate" +quit

    # Move required files to pkgdir
    install -D -m 644 $srcdir/quake3/baseq3/pak0.pk3 $pkgdir/opt/quake3/baseq3/pak0.pk3
}

