# Contributor: Artificial Intelligence <polarbeard@gmail.com>

pkgname=littlespaceduo-demo
pkgver=1.1
pkgrel=1 
pkgdesc="Little Space Duo is a classic, puzzle-based arcade game starring an unusual pair of heroes - a little girl and a small robot. Join them on a mission through the spaceship and help them to overcome all the challenges and hazards they will encounter on the way."
arch=('i686' 'x86_64')
url='http://www.jugilus.com/'
license=('custom: "commercial"')
install=littlespaceduo-demo.install
if [ "$CARCH" = "x86_64" ]; then
        depends=('lib32-freetype2' 'lib32-libxxf86vm' 'lib32-mesa' 'lib32-libxrandr' 'lib32-gcc-libs')
else
        depends=('freetype2' 'libxxf86vm' 'mesa' 'libxrandr' 'gcc-libs')
fi
source=("http://www.jugilus.com/LittleSpaceDuo/LittleSpaceDuoDemo.tar.gz"
'LittleSpaceDuo-demo.png'
'LittleSpaceDuo-demo.desktop'
'littlespaceduo-demo.launcher')
md5sums=('4f122cb7791dc6533fe6cd6a65dddbb1' '5bbd2a467dca7dc2f8c2689b1752a700' '752aa73b444a2f5433b196d916abdac1' 'ebf74df99b3cb921a22323b4554cb73b')

build() {
    cd $srcdir || return 1

# Create Destination Directory
    install -d -m 755 $pkgdir/opt/LittleSpaceDuo-demo || return 1

# Extract Game 
    bsdtar -xf $srcdir/LittleSpaceDuoDemo.tar.gz || return 1

# Install the data
    cp -r $srcdir/LittleSpaceDuoDemo/* $pkgdir/opt/LittleSpaceDuo-demo || return 1

# Install Icon
    install -D -m 644 $srcdir/LittleSpaceDuo-demo.png \
        $pkgdir/usr/share/pixmaps/LittleSpaceDuo-demo.png || return 1

# Install Launcher
    install -D -m 644 $srcdir/LittleSpaceDuo-demo.desktop \
        $pkgdir/usr/share/applications/LittleSpaceDuo-demo.desktop || return 1


# Install Game Launcher
    install -D -m 755 $srcdir/littlespaceduo-demo.launcher \
        $pkgdir/usr/bin/littlespaceduo-demo || return 1

# Set groupship to :games
    chown -R :games $pkgdir/opt/LittleSpaceDuo-demo || return 1
    chmod -R g+rwX $pkgdir/opt/LittleSpaceDuo-demo || return 1


}  