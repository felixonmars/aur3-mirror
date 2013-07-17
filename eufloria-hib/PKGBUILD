# Maintainer: Claudio Kozicky <claudiokozicky@gmail.com>
# Contributor: Sam S. <smls75@gmail.com>
# Contributor: Ben R. <thebenj88 *AT* gmail *DOT* com>

pkgname=eufloria-hib
pkgver=1.0.1
pkgrel=3
pkgdesc="A unique real time strategy game."
url="http://www.eufloria-game.com/"
arch=(i686 x86_64)
license=(custom)
depends=(glu sdl_image sdl_mixer nvidia-cg-toolkit)
options=(!strip)
source=(hib://EufloriaHD-Linux-$pkgver.sh)
md5sums=(5de73e648d3cd75f9e974e1459d9a9da)
DLAGENTS+=('hib::/usr/bin/echo Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf.; exit 1')
PKGEXT=.pkg.tar

package()
{
    # installer
    cd "$srcdir"
    [ -d tmp ] && rm -r tmp
    sh ${source[0]#hib://} --unattended \
                           --no-register \
                           --bindir "$srcdir"/bin \
                           --datadir "$pkgdir"/opt \
                           --keep \
                           --nox11 \
                           --target "$srcdir"/tmp

    cd "$pkgdir"

    # cleanup
    rm -rf opt/EufloriaHD/xdg-* \
           opt/EufloriaHD/lib$([ $CARCH = x86_64 ] && echo 64 || echo 32)

    # desktop integration
    install -d usr/share/applications
    sed -e "s/Exec=.*/Exec=eufloria/" \
        -e "s/Icon=.*/Icon=$pkgname/" \
        "$srcdir"/tmp/EufloriaHD.desktop \
        > usr/share/applications/$pkgname.desktop
    install -d usr/share/pixmaps
    ln -s /opt/EufloriaHD/EufloriaHD.png usr/share/pixmaps/$pkgname.png

    # launcher
    install -d usr/bin
    ln -s /opt/EufloriaHD/EufloriaHD.bin.${CARCH//i686/x86/} usr/bin/eufloria

    # legal
    install -Dm644 "$srcdir"/tmp/config/license usr/share/licenses/$pkgname/LICENSE
    ln -s /opt/EufloriaHD/Licenses.txt usr/share/licenses/$pkgname/LICENSES

    # doc
    install -d usr/share/doc/$pkgname
    ln -s /opt/EufloriaHD/ReadMe.pdf usr/share/doc/$pkgname/README.pdf
}

# vim:et:sw=4:sts=4
