# Maintainer: Arkham <arkham at archlinux dot us>
# Contributor: Dennis Craven <dcraven at gmail dot com>

pkgname=openarena-bin
_realname=openarena
pkgver=0.8.5
_oldver=0.8.1
pkgrel=1
pkgdesc="A completely free FPS game using the ioquake3 engine"
arch=('i686' 'x86_64')
url="http://openarena.ws/"
license=('GPL')
depends=('sdl' 'libvorbis' 'openal')
source=(http://download.tuxfamily.org/$_realname/rel/081/oa081.zip
        http://download.tuxfamily.org/$_realname/rel/085/oa085p.zip
        openarena.png
        openarena.desktop
        openarena.launcher
        oa_ded.launcher)
md5sums=('49006bcb02b4e8ea3d06749e8f4e4887'
         'b2a0437da751cd50dd2351ed9e0c4e9d'
         'c69f824dc500d436fc631b78b6a62dc8'
         '229c87648c10e48b523c25d24aba8372'
         'edb2ec529d5e75ed6694b8160a258485'
         'b7c2aae6c3d1ddd9f0c5715857c1e87c')

build() {
    cd $srcdir

    # Installing pk3 files
    install -d $pkgdir/usr/share/openarena/baseoa/
    install -m 644 openarena-$_oldver/baseoa/* $pkgdir/usr/share/openarena/baseoa/

    # Installing arch specific binaries
    if [ "$CARCH" = "i686" ]; then
        install -Dm 755 openarena-$_oldver/openarena.i386 $pkgdir/usr/share/openarena/openarena.i386
        install -m 755 openarena-$_oldver/oa_ded.i386 $pkgdir/usr/share/openarena/oa_ded.i386

        sed -i 's/ARCH/i386/' openarena.launcher
        sed -i 's/ARCH/i386/' oa_ded.launcher 
        install -Dm 755 openarena.launcher $pkgdir/usr/bin/openarena
        install -m 755 oa_ded.launcher $pkgdir/usr/bin/oa_ded
    else
        install -Dm 755 openarena-$_oldver/openarena.x86_64 $pkgdir/usr/share/openarena/openarena.x86_64
        install -m 755 openarena-$_oldver/oa_ded.x86_64 $pkgdir/usr/share/openarena/oa_ded.x86_64

        sed -i 's/ARCH/x86_64/' openarena.launcher
        sed -i 's/ARCH/x86_64/' oa_ded.launcher
        install -Dm 755 openarena.launcher $pkgdir/usr/bin/openarena
        install -m 755 oa_ded.launcher $pkgdir/usr/bin/oa_ded
    fi

    # Installing .desktop and icon
    install -Dm 644 openarena.png $pkgdir/usr/share/pixmaps/openarena.png
    install -Dm 644 openarena.desktop $pkgdir/usr/share/applications/openarena.desktop
}
