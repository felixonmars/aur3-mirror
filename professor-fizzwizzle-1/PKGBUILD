# Contributor: Artificial Intelligence <polarbeard@gmail.com>

pkgname=professor-fizzwizzle-1
pkgver=1.02
pkgrel=1
pkgdesc="Professor Fizzwizzle is a fun, mind-expanding puzzle game, where you take control of the diminutive genius, Professor Fizzwizzle. You must help the professor use his brains and his gadgets to solve each exciting level."
arch=('i686' 'x86_64')
url='http://grubbygames.com/professor_fizzwizzle.php'
license=('custom: "commercial"')
install=professor-fizzwizzle-1.install 
if [ "$CARCH" = "x86_64" ]; then
        depends=('lib32-libstdc++5' 'lib32-libjpeg6' 'lib32-sdl' 'lib32-gcc-libs' 'lib32-libxext')
else
        depends=('libstdc++5' 'libjpeg6' 'sdl' 'gcc-libs' 'libxext')
fi
source=('ProfessorFizzwizzleFULL.tar.gz' 'ProfessorFizzwizzle1.png' 'professorfizzwizzle1.desktop' 'professorfizzwizzle1.launcher')
md5sums=('6bd42bb5256a10e0479a9418b0a86cde' 'f8c54591c1d8da5b2c12598c5a110339' '60256e7d186fecdf41634e9351a40c2d' '3d07b7990a0988aa536ea1b9ef353296')


build() {
    cd $srcdir || return 1

# Create Destination Directory
    install -d $pkgdir/opt/ProfessorFizzwizzle1 || return 1

# Extract Game
     bsdtar -xf $srcdir/ProfessorFizzwizzleFULL.tar.gz || return 1

# Install the data
    cp -r $srcdir/ProfessorFizzwizzleFULL_1.02/* $pkgdir/opt/ProfessorFizzwizzle1 || return 1

# Install Icon
    install -D -m 644 $srcdir/ProfessorFizzwizzle1.png \
        $pkgdir/usr/share/pixmaps/ProfessorFizzwizzle1.png || return 1

# Install Launcher
    install -D -m 644 $srcdir/professorfizzwizzle1.desktop \
        $pkgdir/usr/share/applications/professorfizzwizzle1.desktop || return 1

# Install Game Launcher
    install -D -m 755 $srcdir/professorfizzwizzle1.launcher \
        $pkgdir/usr/bin/professor-fizzwizzle-1 || return 1

# Install License
    install -D -m 644 $srcdir/ProfessorFizzwizzleFULL_1.02/LICENSE.TXT \
        $pkgdir/usr/share/licenses/$pkgname/license.txt || return 1

# Set groupship to :games
    chown -R :games $pkgdir/opt/ProfessorFizzwizzle1 || return 1
    chmod -R g+rwX $pkgdir/opt/ProfessorFizzwizzle1 || return 1
}