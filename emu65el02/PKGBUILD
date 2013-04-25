# Maintainer: Tanner Danzey <arkaniad@gmail.com>
pkgname=emu65el02
pkgver=0.12
pkgrel=6
pkgdesc="An emulator for the 65el02 microprocessor from the Minecraft Mod 'RedPower2' by Eloraam"
arch=(i686 x86_64)
url="http://bigfootinformatika.hu/65el02/"
license=()
depends=()
provides=('emu65el02')
depends=('sdl>=1.2.15-3')
source=("http://bigfootinformatika.hu/65el02/${pkgname}_v${pkgver}_src.zip" "http://cdn.outerearth.net/patches/${pkgname}_${pkgver}-fix_path.patch")
md5sums=('40cf0c102f5e45be2df0678d16f47f76' 'e2b22aaa87e01bdfc40bdf618a4a2be6')

build() {
        cd "$srcdir"
        patch -p1 -i ${pkgname}_${pkgver}-fix_path.patch
        make || return 1
        install -Dm755 emu65el02 $pkgdir/usr/bin/emu65el02
        
        install -Dm644 docs/65el02_instructions.txt $pkgdir/usr/share/doc/emu65el02/65el02_instructions
        install -Dm644 docs/readme.txt $pkgdir/usr/share/doc/emu65el02/README
        install -Dm644 docs/mcfs_format.txt $pkgdir/usr/share/doc/emu65el02/mcfs_format
        install -Dm644 docs/changelog.txt $pkgdir/usr/share/doc/emu65el02/CHANGELOG

        install -Dm644 roms/charset.rom $pkgdir/usr/share/emu65el02/roms/charset.rom
        install -Dm644 roms/redforth.img $pkgdir/usr/share/emu65el02/roms/redforth.img
        install -Dm644 roms/rpcboot.bin $pkgdir/usr/share/emu65el02/roms/rpcboot.bin
        install -Dm644 roms/rpcboot.bin.mcfs $pkgdir/usr/share/emu65el02/roms/rpcboot.bin.mcfs
        install -Dm644 roms/rpcboot.bin.orig $pkgdir/usr/share/emu65el02/roms/rpcboot.bin.orig
}
