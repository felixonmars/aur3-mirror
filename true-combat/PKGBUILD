# Maintainer: Bryan Hyshka <bryan at hyshka dot com>
# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=true-combat
pkgver=0.49b
pkgrel=1
pkgdesc="A completely free, realistic, team-based modification for Enemy Territory."
url="http://www.truecombatelite.com/"
arch=('i686' 'x86_64')
license=('custom')
depends=('enemy-territory' 'libstdc++5')
[[ "$CARCH" == "x86_64" ]] && depends=('enemy-territory' 'lib32-libstdc++5')
optdepends=('et-sdl-sound: OSS sound fix')
makedepends=('unzip')
backup=('usr/share/enemy-territory/tcetest/server.cfg')
source=('true-combat.desktop' 'true-combat.sh' 'true-combatded.sh' \
'http://tce.merlin1991.at/tce/tcetest049.zip' \
'http://dragons-perch.net/tce/tce049b_all_os_fixed.zip')
md5sums=('7100aaf825e599753b8a3b55628e8e78'
         '7c59329a639f74a81fed8ad15bf1ebe3'
         'b12ddba2a809e95bc7ae83feabba6416'
         '996ef2743e36103a351199f3fd72e70f'
         'ed09515b41a4af92740c42c3053225a9')

package() {
    cd $srcdir

    # Unpack 0.49b Patch into 0.49 directory
    unzip -o $srcdir/tce049b_all_os_fixed.zip -d $srcdir/tcetest/

    # Remove Unneeded Files and Directories
    rm $srcdir/tcetest/._Mac_users_run_me_first.pkg
    rm $srcdir/tcetest/Mac\ Users\ Read\ Me\ First\ -\ Important\ Information.txt
    rm $srcdir/tcetest/{cgame_mac,cgame_mp_x86.dll,qagame_mp_x86.dll,ui_mac,ui_mp_x86.dll}
    rm -r $srcdir/tcetest/{Mac_users_run_me_first.pkg/,qagame_mac.bundle/}

    # Install License
    install -d $pkgdir/usr/share/licenses/$pkgname
    mv $srcdir/tcetest/EULA_TrueCombat_Elite.txt \
        $pkgdir/usr/share/licenses/$pkgname/

    # Copy Data to Package Directory
    install -d $pkgdir/usr/share/enemy-territory/
    mv $srcdir/tcetest $pkgdir/usr/share/enemy-territory/

    # Install Client Launcher Script 
    install -D -m755 true-combat.sh \
        $pkgdir/usr/bin/true-combat

    # Install Server Launcher Script
    install -D -m755 true-combatded.sh \
        $pkgdir/usr/bin/true-combatded

    # Install Icon File
    install -D -m644 $pkgdir/usr/share/enemy-territory/tcetest/tce_icon_pc.ico \
        $pkgdir/usr/share/pixmaps/true-combat.ico

    # Install Desktop File
    install -D -m644 true-combat.desktop \
        $pkgdir/usr/share/applications/true-combat.desktop
}
