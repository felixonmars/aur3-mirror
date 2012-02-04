pkgname=true-combat-cqb
pkgver=0.223
pkgrel=1
pkgdesc="True Combat: Elite - Close Quartiers Combat (TCE: CQB) is a completely free, realistic, team-based modification for Enemy Territory."
url="http://www.truecombatelite.com/"
arch=('i686' 'x86_64')
license=('custom')
depends=('enemy-territory' 'libstdc++5')
[[ "$CARCH" == "x86_64" ]] && depends=('enemy-territory' 'lib32-libstdc++5')
makedepends=('unzip')
source=('true-combat-cqb.desktop' 'true-combat-cqb.sh' \
'http://www.truecombatelite.com/files/cqb_alpha0223_win_linux_patch.zip' 'http://www.truecombatelite.com/files/cqb_alpha022_win_linux.zip')
md5sums=('574f90ba801f4e7cde6ab0db25a4c1f2'
         '326fede7a4d41dbd7cc1da3797d9b633'
         '6549d172ec0d4f0dcd5e419e9213055a'
         'd5428a811a5e5e374e4640188e119aeb')

build() {
    cd $srcdir

    # Remove Unneeded Files and Directories
    rm $srcdir/cqbtest/{cgame_mp_x86.dll,qagame_mp_x86.dll,ui_mp_x86.dll}

    # Copy Data to Package Directory
    install -d $pkgdir/opt/enemy-territory/
    mv $srcdir/cqbtest $pkgdir/opt/enemy-territory/

    # Install Client Launcher Script 
    install -D -m 755 true-combat-cqb.sh \
        $pkgdir/usr/bin/true-combat-cqb

    # Install Desktop File
    install -D -m 644 true-combat-cqb.desktop \
        $pkgdir/usr/share/applications/true-combat-cqb.desktop
}
