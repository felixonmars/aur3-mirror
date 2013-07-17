# Maintainer: Claudio Kozicky <claudiokozicky@gmail.com>

pkgname=spacechem-hib
pkgver=1012
pkgrel=1
pkgdesc="An obscenely addictive, design-based puzzle game about building machines and fighting monsters in the name of science."
arch=(i686 x86_64)
url="http://spacechemthegame.com/"
license=(custom)
depends=(mono sdl_image sdl_mixer xclip)
provides=spacechem
conflicts=spacechem
options=(!strip)
[ $CARCH = i686 ] \
    && source=(hib://SpaceChem-i386.deb) \
    && md5sums=(a12012f8df658c3e7a222f2db28070ce)
[ $CARCH = x86_64 ] \
    && depends+=(lib32-glibc) \
    && source=(hib://spacechem-linux-1345144627-amd64.deb) \
    && md5sums=(c08fb05e1909c0b4ccae82a862da6e3a)
DLAGENTS+=('hib::/usr/bin/echo Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf.; exit 1')
PKGEXT=.pkg.tar

prepare()
{
    cd "$srcdir"
    bsdtar -xf data.tar.gz
}

package()
{
    # data
    cd "$srcdir"
    find opt -name readme -prune \
             -o -name icon.png -prune \
             -o -name spacechem.ico -prune \
             -o -name zachtronicsindustries-spacechem.desktop -prune \
             -o -type f -exec install -Dm644 {} "$pkgdir"/{} \;
    chmod +x "$pkgdir"/opt/zachtronicsindustries/spacechem/{rgb2theora,spacechem-launcher.sh}

    # launcher
    install -d "$pkgdir"/usr/bin
    ln -s /opt/zachtronicsindustries/spacechem/spacechem-launcher.sh "$pkgdir"/usr/bin/spacechem

    # desktop integration
    cd opt/zachtronicsindustries/spacechem
    install -Dm644 icon.png "$pkgdir"/usr/share/pixmaps/zachtronicsindustries-spacechem.png
    install -Dm644 zachtronicsindustries-spacechem.desktop "$pkgdir"/usr/share/applications/zachtronicsindustries-spacechem.desktop

    # legal
    cd readme
    install -d "$pkgdir"/usr/share/licenses/spacechem-hib
    find -type f -exec install -m644 {} "$pkgdir"/usr/share/licenses/spacechem-hib/{} \;
}

# vim:et:sw=4:sts=4
