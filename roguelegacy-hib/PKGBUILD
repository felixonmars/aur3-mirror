# Maintainer: skualito <lepascalou@gmail.com>

pkgname=roguelegacy-hib
pkgver=1.2.0b
_hibver=12282013
pkgrel=1
pkgdesc="A genealogical Rogue-"Lite" for PC, Mac, and Linux."
arch=(i686 x86_64)
url="http://roguelegacy.com/"
license=(custom)
depends=(gcc-libs sdl2 openal)
makedepends=(imagemagick)
options=(!strip)
source=(hib://roguelegacy-"$_hibver"-bin
        roguelegacy-hib.desktop)
md5sums=('b2a18745b911ed87a048440c2f8a0404'
         '460c1102ce92ec5de928d9a776ee9b34')
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

prepare()
{
    bsdtar -xf roguelegacy-"$_hibver"-bin data

    [ $CARCH == "x86_64" ] && rm -r data/{lib,RogueCastle.bin.x86,RogueLegacy}
    [ $CARCH == "x86"    ] && rm -r data/{lib64,RogueCastle.bin.x86_64,RogueLegacy}

    # Use system libraries but keep Mono libs (special branch, see README)
    rm data/lib*/{libopenal.so.1,libSDL2-2.0.so.0}
}

package()
{
    cd $srcdir
    _installdir="/opt/RogueLegacy"; _target="$pkgdir/$_installdir"

    mkdir -p "$_target"
    mv -T "data" "$_target"

    # Install desktop entry
    install -Dm644 "$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

    # Install icon
    convert "$_target"/"Rogue Legacy.bmp" -resize 256x256 "roguelegacy.png"
    install -Dm644 "roguelegacy.png" "$pkgdir/usr/share/pixmaps/roguelegacy.png"

    # Install launch script
    [ $CARCH == "i686" ] && _arch='x86' || _arch='x86_64'
    echo -e "#!/bin/sh\ncd $_installdir && ./RogueCastle.bin.$_arch" > "launcher.sh"
    install -Dm755 "launcher.sh" "$pkgdir/usr/bin/roguelegacy"
}

