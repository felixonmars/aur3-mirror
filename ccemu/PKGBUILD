# Maintainer: Odd Stråbø <oddstr13@openshell.no>

pkgname=ccemu
pkgver=0.5pr4
pkgrel=2
pkgdesc="This is an emulator of ComputerCraft that does not require Minecraft to be installed, But allows you to run computers as if you were in Minecraft."
arch=('any')
url="http://www.computercraft.info/forums2/index.php?/topic/2674-ccemu/"
license=('custom')
depends=('jre7-openjdk')
source=('http://satomi.openshell.no/mc/ccemu/cc-emu-launcher.jar')

md5sums=('fab7e1b06d224b2be068fc142e372aee')
sha1sums=('78b9c0b09ed1bfb7857047d3823a28253e11e860')
sha256sums=('0fa8011a7aa448c7746514c94907afe2352a0874117b12ea7c9db6f2b385c081')


build() {
    cd ${srcdir}
    mkdir -p $pkgdir/usr/share/ccemu/

    cp cc-emu-launcher.jar $pkgdir/usr/share/ccemu/cc-emu-launcher.jar
    mkdir -p $pkgdir/usr/bin/
    echo -e "#!/bin/bash\njava -jar /usr/share/ccemu/cc-emu-launcher.jar" > $pkgdir/usr/bin/ccemu
    chmod +x $pkgdir/usr/bin/ccemu
    mkdir -p $pkgdir/usr/share/licenses/ccemu/
    cat > $pkgdir/usr/share/licenses/ccemu/LICENSE <<EOF
TERMS AND CONDITIONS

0. USED TERMS
CC DEVELOPERS - Dan200 and Cloudy
COMPUTERCRAFT - The modification developed by the CC DEVELOPERS for the Minecraft game developed by Mojang.
EMULATOR - a piece of software that interfaces with the COMPUTERCRAFT mod to simulate use similar to use of that inside the Minecraft game
OWNER - Original author(s) of the EMULATOR
USER - End user of the emulator, person using the emulator.

TERMS and CONDITIONS are subject to change without notice or forewarning at anytime at the OWNERS discretion

1. LIABILITY
THIS EMULATOR IS PROVIDED 'AS IS' WITH NO WARRANTIES, IMPLIED OR OTHERWISE. THE OWNER OF THIS EMULATOR TAKES NO RESPONSIBILITY FOR ANY DAMAGES INCURRED FROM THE USE OF THIS EMULATOR. ALL DAMAGES CAUSED FROM THE USE OR MISUSE OF THIS EMULATOR FALL ON THE USER.

2. USE
Use of this EMULATOR to be installed, manually or automatically, is given to the USER without restriction.

3. REDISTRIBUTION
This EMULATOR may only be distributed where uploaded, mirrored, or otherwise linked to by the OWNER solely. All mirrors of this emulator must have advance written permission from the OWNER and the CC DEVELOPERS. ANY attempts to make money off of this EMULATOR (selling, selling modified versions, adfly, sharecash, etc.) not by the OWNER are STRICTLY FORBIDDEN, and the OWNER and or CC DEVELOPERS may claim damages or take other action to rectify the situation.

4. DERIVATIVE WORKS/MODIFICATION
This emulator is provided freely and may be decompiled and modified for private use, either with a decompiler or a bytecode editor. Public distribution of modified versions of this EMULATOR require advance written permission of the OWNER and CC DEVELOPERS and may be subject to certain terms.
This includes reuse of substantial amounts of source code from the EMULATOR that has been accessed through the use of a decompiler or bytecode editor.

Copyright © Tomass 2012.
EOF
}

md5sums=('fab7e1b06d224b2be068fc142e372aee')
