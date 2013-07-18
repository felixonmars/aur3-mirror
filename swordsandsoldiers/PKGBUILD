# Maintainer: Claudio Kozicky <claudiokozicky@gmail.com>

pkgname=swordsandsoldiers
pkgver=20120329
_pkgver=20120325
pkgrel=2
pkgdesc="An exciting 2D sidescrolling real-time strategy game."
arch=(i686 x86_64)
url="http://www.swordsandsoldiers.com/"
license=(custom)
depends=(glu libvorbis libxft libxinerama libxpm openal sdl)
options=(!strip)
[ $CARCH = i686 ] \
    && source=(hib://$pkgname-$_pkgver-i386.tar.gz) \
    && md5sums=(52fe87a6fa6bb331eed057f0ebf73da5)
[ $CARCH = x86_64 ] \
    && source=(hib://$pkgname-$_pkgver-amd64.tar.gz) \
    && md5sums=(5f0c9789fa053cbf6bac021a338245bb)
DLAGENTS+=('hib::/usr/bin/echo Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf.; exit 1')
PKGEXT=.pkg.tar

prepare()
{
    # install path
    cd "$srcdir"/$pkgname
    sed -e 's:\$INSTALL_PATH\$:/opt/swordsandsoldiers:' \
        -i $pkgname.in \
        -i "$pkgname"setup.in \
        -i SwordsAndSoldiers.desktop.in \
        -i SwordsAndSoldiersSetup.desktop.in
}

package()
{
    cd "$srcdir"/$pkgname

    # data
    find Data -type f -exec install -Dm644 {} "$pkgdir"/opt/$pkgname/{} \;

    # bin
    install -m755 -t "$pkgdir"/opt/$pkgname SwordsAndSoldiers{,Setup}.bin

    # launchers
    install -m755 swordsandsoldiers.in "$pkgdir"/opt/$pkgname/$pkgname
    install -m755 swordsandsoldierssetup.in "$pkgdir"/opt/$pkgname/"$pkgname"setup
    install -d "$pkgdir"/usr/bin
    ln -st "$pkgdir"/usr/bin /opt/$pkgname/"$pkgname"{,setup}

    # doc
    install -Dm644 README.linux "$pkgdir"/usr/share/doc/$pkgname/README

    # desktop integration
    install -Dm644 SwordsAndSoldiers.desktop.in "$pkgdir"/usr/share/applications/$pkgname.desktop
    install -m644 SwordsAndSoldiersSetup.desktop.in "$pkgdir"/usr/share/applications/"$pkgname"setup.desktop
    install -m644 -t "$pkgdir"/opt/$pkgname SwordsAndSoldiers{,Setup}.png
}

# vim:et:sw=4:sts=4
