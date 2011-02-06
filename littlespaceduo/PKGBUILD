# Contributor: Artificial Intelligence <polarbeard@gmail.com>

pkgname=littlespaceduo
pkgver=1.1
pkgrel=1 
pkgdesc="Little Space Duo is a classic, puzzle-based arcade game starring an unusual pair of heroes - a little girl and a small robot. Join them on a mission through the spaceship and help them to overcome all the challenges and hazards they will encounter on the way."
arch=('i686' 'x86_64')
url='http://www.jugilus.com/'
license=('custom: "commercial"')
install=littlespaceduo.install
if [ "$CARCH" = "x86_64" ]; then
        depends=('lib32-freetype2' 'lib32-libxxf86vm' 'lib32-mesa' 'lib32-libxrandr' 'lib32-gcc-libs')
else
        depends=('freetype2' 'libxxf86vm' 'mesa' 'libxrandr' 'gcc-libs')
fi
source=('LittleSpaceDuo.tar.gz' 'LittleSpaceDuo.png' 'LittleSpaceDuo.desktop' 'littlespaceduo.launcher')
md5sums=('de99d35bf2eed69c9576df2dddfe9cd7' '5bbd2a467dca7dc2f8c2689b1752a700' '1732ecff6e41bb515947709bd21cc97f' 'be4698d8386626b730d7687d68417fdf')

build() {
    cd $srcdir || return 1

# Create Destination Directory
    install -d -m 755 $pkgdir/opt/LittleSpaceDuo || return 1

# Extract Game 
    bsdtar -xf $srcdir/LittleSpaceDuo.tar.gz || return 1

# Install the data
    cp -r $srcdir/LittleSpaceDuo/* $pkgdir/opt/LittleSpaceDuo || return 1

# Install Icon
    install -D -m 644 $srcdir/LittleSpaceDuo.png \
        $pkgdir/usr/share/pixmaps/LittleSpaceDuo.png || return 1

# Install Launcher
    install -D -m 644 $srcdir/LittleSpaceDuo.desktop \
        $pkgdir/usr/share/applications/LittleSpaceDuo.desktop || return 1

# Install Game Launcher
    install -D -m 755 $srcdir/littlespaceduo.launcher \
        $pkgdir/usr/bin/littlespaceduo || return 1


# Set groupship to :games
    chown -R :games $pkgdir/opt/LittleSpaceDuo || return 1
    chmod -R g+rwX $pkgdir/opt/LittleSpaceDuo || return 1


}  