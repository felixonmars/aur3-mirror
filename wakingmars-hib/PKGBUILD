# Maintainer: Claudio Kozicky <claudiokozicky@gmail.com>
# Contributor: Ben R. <thebenj88 *AT* gmail *DOT* com>

pkgname=wakingmars-hib
pkgver=1.2.1
pkgrel=2
pkgdesc="Explore Mars in this 2D sidescrolling adventure game."
url="http://www.tigerstylegames.com/wakingmars/"
arch=(i686 x86_64)
license=(custom)
[ $CARCH = i686 ] \
    && depends=(freealut freeimage freetype2 libgl libvorbis sdl)
[ $CARCH = x86_64 ] \
    && depends=(lib32-freealut lib32-freeimage lib32-freetype2 lib32-libgl lib32-libvorbis lib32-sdl)
source=(hib://WakingMars-$pkgver-Linux.tar.gz
        "https://dl.dropbox.com/s/6p1dvlpqiyccenf/oal14.tar.gz?dl=1")
md5sums=(526010897806564fd699907d0ece1e3c
         a684078b08bac6578e915fd1c812bfdc)
DLAGENTS+=('hib::/usr/bin/echo Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf.; exit 1')
PKGEXT=.pkg.tar

prepare()
{
    # .desktop file
    cd "$srcdir"/WakingMars-$pkgver-Linux
    sed "s:usr/local/games/wakingmars:opt/$pkgname:" -i wakingmars.desktop

    # cleanup
    cd wakingmars/lib
    rm libalut.so* libfreeimage* libopenal.so* libvstdlib_s.so libtier0_s.so libsteam.so
 
    # prevent lock ups <http://www.tigerstylegames.com/wakingmars/support/>
    #cd "$srcdir"
    #cp libopenal.so* WakingMars-$pkgver-Linux/wakingmars/lib
}

package()
{
    # data
    cd "$srcdir"/WakingMars-1.2.1-Linux/wakingmars
    find GameData -type f -exec install -Dm644 {} "$pkgdir"/opt/$pkgname/{} \;
    find lib -type f -exec install -Dm755 {} "$pkgdir"/opt/$pkgname/{} \;

    # bin
    install -m755 wakingmars "$pkgdir"/opt/$pkgname

    # launcher
    install -d "$pkgdir"/usr/bin
    ln -s /opt/$pkgname/wakingmars "$pkgdir"/usr/bin

    # doc
    cd ..
    install -Dm644 README.txt "$pkgdir"/usr/share/doc/$pkgname/README

    # legal
    install -Dm644 Licenses/EULA.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

    # desktop integration
    install -Dm644 wakingmars.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
    install -m644 wakingmars/wakingmars.png "$pkgdir"/opt/$pkgname
}

# vim:et:sw=4:sts=4
