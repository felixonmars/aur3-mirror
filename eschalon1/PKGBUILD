# Contributor: Artificial Intelligence <polarbeard@gmail.com>

pkgname=eschalon1
pkgver=1.04
pkgrel=3
pkgdesc="Eschalon: Book I is a classic role-playing game experience that will take you across massive outdoor environments and deep into sprawling dungeons as you seek to uncover the mystery of who – or what – you are."
arch=('i686' 'x86_64')
url='http://basiliskgames.com/eschalon-book-i'
license=('custom: "commercial"')
if [ "$CARCH" = "x86_64" ]; then
        depends=('lib32-libxxf86vm' 'lib32-libstdc++5' 'lib32-mesa')
else
        depends=('libxxf86vm' 'libstdc++5' 'mesa')
fi
install=eschalon1.install
source=('eschalon_book_1.tar.gz' 'EschalonBook1.png' 'eschalon1.desktop' 'eschalon1.launcher')
md5sums=('56a26ef73f96ed83b3fd01be033898e3' '4e9dd0d6c1aa3f619e78ff3e603d020a' 'be670197be670263949c9a65f7110085' '2c9bbaa20ac20dba59bb5915396730c9')



build() {
    cd $srcdir  || return 1

# Create Destination Directory
    install -d $pkgdir/opt/Eschalon1 || return 1

# Extract Game 
    bsdtar -xf $srcdir/eschalon_book_1.tar.gz || return 1

# Install the data
    cp -r $srcdir/eschalon_book_1/* $pkgdir/opt/Eschalon1 || return 1


# Install Icon
    install -D -m 644 $srcdir/EschalonBook1.png \
        $pkgdir/usr/share/pixmaps/EschalonBook1.png || return 1

# Install Launcher
    install -D -m 644 $srcdir/eschalon1.desktop \
        $pkgdir/usr/share/applications/eschalon1.desktop || return 1

# Install Game Launcher
    install -D -m 755 $srcdir/eschalon1.launcher \
        $pkgdir/usr/bin/eschalon1 || return 1
  
# Install License
    install -D -m 644 $srcdir/eschalon_book_1/license.txt \
        $pkgdir/usr/share/licenses/$pkgname/license.txt || return 1

# Set groupship to :games
    chown -R :games $pkgdir/opt/Eschalon1 || return 1
    chmod -R g+rwX $pkgdir/opt/Eschalon1 || return 1
}
