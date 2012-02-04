# Maintainer: Arkham <arkham at archlinux dot us>
# Contributor: Georgij Kondratjev <smpuj@bk.ru>
# Contributor: Alec Hussey <alec.hussey@madsoft.org>

pkgname=et-sdl-sound-fixed
pkgver=29
pkgrel=3
pkgdesc="Replacement for standard OSS sound system of Wolfenstein, Enemy Territory and Quake 3"
arch=('i686' 'x86_64')
url="http://nullkey.kapsi.fi/et-sdl-sound/"
license=('GPL')
depends=('sdl')
[[ "$CARCH" == "x86_64" ]] && depends=('lib32-sdl' 'lib32-alsa-lib') \
    && optdepend=('lib32-pulseaudio' 'lib32-jack-audio-connection-kit' 'lib32-alsa-plugins')
source=(http://nullkey.kapsi.fi/et-sdl-sound/archive/et-sdl-sound-r$pkgver.tar.gz
        x86_64.patch
        enemy-territory.sh true-combat.sh quake3.sh wolf.launcher wolfsp.launcher wolfmp.launcher)
md5sums=('77c2433fc757e5ffb08ec2c78a9853b3'
         'f0fd5ca54659a9a5774617253245d766'
         'a1c020a48ad18893054dbfe86b31d665'
         '56205aceaba40ecc0ab9faaad71cc9d8'
         '8d8c983f8eb33b46609821ad972d6ae0'
         'c9419ed21e27fc53bbb132ba82aa5120'
         '4236efdcb7275554dfe59ea0a533a2ff'
         'c9419ed21e27fc53bbb132ba82aa5120')

build() {
    cd $srcdir/et-sdl-sound

    if [ "$CARCH" = "x86_64" ]; then
        sed -i 's:ioquake3.i386:ioquake3.x86_64:' ../quake3.sh 
        # install 32bit lib
        install -Dm 755 et-sdl-sound.so $pkgdir/opt/lib32/usr/lib/et-sdl-sound.so 
    fi

    patch -Np1 -i ../x86_64.patch || return 1
    make || return 1

    install -Dm 755 et-sdl-sound.so $pkgdir/usr/lib/et-sdl-sound.so
    install -Dm 755 ../enemy-territory.sh $pkgdir/usr/bin/enemy-territory.sdl
    install -Dm 755 ../true-combat.sh $pkgdir/usr/bin/true-combat.sdl
    install -Dm 755 ../quake3.sh $pkgdir/usr/bin/quake3.sdl
    install -Dm 755 ../wolf.launcher $pkgdir/usr/bin/wolf.sdl
    install -Dm 755 ../wolfsp.launcher $pkgdir/usr/bin/wolfsp.sdl
    install -Dm 755 ../wolfmp.launcher $pkgdir/usr/bin/wolfmp.sdl
}
