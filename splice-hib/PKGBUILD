# Maintainer: Claudio Kozicky <claudiokozicky@gmail.com>
# Contributor: Ben R. <thebenj88 *AT* gmail *DOT* com>

pkgname=splice-hib
pkgver=1.0
_pkgver=1353389454
pkgrel=5
pkgdesc="A unique puzzle game involving DNA strand manipulation."
arch=(i686 x86_64)
url="http://www.cipherprime.com/games/splice"
license=(custom)
depends=(glu libxcursor libxext)
options=(!strip)
install=$pkgname.install
source=(hib://splice-linux-$_pkgver.tar.gz
        $pkgname.desktop
        $pkgname.png)
md5sums=(a62a60160e890b8324146d5f12ca2efb
         666994e07c9e19f8c72a4986e1a0f888
         383365ad827ff3c23b9a4bb1b194876d)
DLAGENTS+=('hib::/usr/bin/echo Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf.; exit 1')
PKGEXT=.pkg.tar

prepare()
{
    # cleanup
    [ $CARCH = i686 ] \
        && rm -r "$srcdir"/Linux/Splice_Data/Mono/x86_64 \
        || true
    [ $CARCH = x86_64 ] \
        && rm -r "$srcdir"/Linux/Splice_Data/Mono/x86 \
        || true
}

package()
{
    cd "$srcdir"/Linux

    # data
    find Splice_Data -type f -exec install -Dm644 {} "$pkgdir"/opt/$pkgname/{} \;
    install -m755 Splice.${CARCH//i686/x86} "$pkgdir"/opt/$pkgname

    # launcher
    install -d "$pkgdir"/usr/bin
    ln -s /opt/$pkgname/Splice.${CARCH//i686/x86} "$pkgdir"/usr/bin/$pkgname

    # doc
    install -m644 -t "$pkgdir"/opt/$pkgname README{,\~}
    install -d "$pkgdir"/usr/share/doc/$pkgname
    ln -s /opt/$pkgname/README "$pkgdir"/usr/share/doc/$pkgname

    # desktop integration
    cd ..
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
    install -Dm644 $pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
}

# vim:et:sw=4:sts=4
