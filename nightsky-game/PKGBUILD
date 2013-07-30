# Maintainer: Claudio Kozicky <claudiokozicky@gmail.com>
# Contributor: Yann Kaiser <kaiser.yann@gmail.com>

pkgname=nightsky-game
pkgver=1.0.0
_timestamp=1324519044
pkgrel=4
pkgdesc="A 2D platformer in which you control a ball."
arch=(i686 x86_64)
url="http://www.nicalis.com/nightsky/"
license=(custom)
depends=(freealut freeglut glu libvorbis)
options=(!strip)
source=(hib://nightskyhd-linux-$_timestamp.tar.gz
        $pkgname.sh
        $pkgname.desktop
        $pkgname.png::https://humblepull-wolfire.netdna-ssl.com/misc/files/a27ab5a048/images/icons/nightsky.png)
md5sums=(73a937ffb5dfd5fc9ba95efacba0a25f
         b4c6369d71ed1226e873de1d182886b0
         90de87c9cdec492d21c5dab1a69b5484
         07b66bdc63fc5953899ce1158231e93c)
DLAGENTS+=('hib::/usr/bin/echo Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf.; exit 1')
PKGEXT=.pkg.tar

prepare()
{
    # cleanup
    cd "$srcdir"/NightSky
    rm -r lib lib64
    [ $CARCH = x86_64 ] \
        && mv NightSky{HD_64,HD} \
        || rm NightSkyHD_64
}

package()
{
    cd "$srcdir"

    # data
    find NightSky -name NightSkyHD -prune -o -type f -exec install -Dm644 {} "$pkgdir"/opt/{} \;
    install -m755 NightSky/NightSkyHD "$pkgdir"/opt/NightSky

    # launcher
    install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname

    # desktop integration
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
    install -Dm644 $pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
}

# vim:et:sw=4:sts=4
