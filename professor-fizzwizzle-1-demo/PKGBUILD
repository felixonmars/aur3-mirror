# Contributor: Artificial Intelligence <polarbeard@gmail.com>

pkgname=professor-fizzwizzle-1-demo
pkgver=1.02
pkgrel=1
pkgdesc="Professor Fizzwizzle is a fun, mind-expanding puzzle game, where you take control of the diminutive genius, Professor Fizzwizzle. You must help the professor use his brains and his gadgets to solve each exciting level."
arch=('i686' 'x86_64')
url='http://grubbygames.com/professor_fizzwizzle.php'
license=('custom: "commercial"')
install=professor-fizzwizzle-1-demo.install
if [ "$CARCH" = "x86_64" ]; then
        depends=('lib32-libstdc++5' 'lib32-libjpeg6' 'lib32-sdl' 'lib32-gcc-libs' 'lib32-libxext')
else
        depends=('libstdc++5' 'libjpeg6' 'sdl' 'gcc-libs' 'libxext')
fi
source=("http://grubbygamesfiles.com/ProfessorFizzwizzleDEMO.tar.gz"
'ProfessorFizzwizzle1.png'
'professorfizzwizzle1-demo.desktop'
'professorfizzwizzle1-demo.launcher')
md5sums=('a56d656ed5b0ef85560bd1c82b38a770' 'f8c54591c1d8da5b2c12598c5a110339' 'a9f089303dd2b65777b2bc7269faf48a' '6e9499eab7bde44de4875715cbc86376')


build() {
    cd $srcdir || return 1

# Create Destination Directory
    install -d $pkgdir/opt/ProfessorFizzwizzle1-demo || return 1

# Extract Game 
    bsdtar -xf $srcdir/ProfessorFizzwizzleDEMO.tar.gz || return 1

# Install the data
    cp -r $srcdir/ProfessorFizzwizzleDEMO_1.02/* $pkgdir/opt/ProfessorFizzwizzle1-demo || return 1

# Install Icon
    install -D -m 644 $srcdir/ProfessorFizzwizzle1.png \
        $pkgdir/usr/share/pixmaps/ProfessorFizzwizzle1-demo.png || return 1

# Install Launcher
    install -D -m 644 $srcdir/professorfizzwizzle1-demo.desktop \
        $pkgdir/usr/share/applications/professorfizzwizzle1-demo.desktop || return 1

# Install Game Launcher
    install -D -m 755 $srcdir/professorfizzwizzle1-demo.launcher \
        $pkgdir/usr/bin/professor-fizzwizzle-1-demo || return 1

# Install License
    install -D -m 644 $srcdir/ProfessorFizzwizzleDEMO_1.02/LICENSE.TXT \
        $pkgdir/usr/share/licenses/$pkgname/license.txt || return 1


# Set groupship to :games
    chown -R :games $pkgdir/opt/ProfessorFizzwizzle1-demo || return 1
    chmod -R g+rwX $pkgdir/opt/ProfessorFizzwizzle1-demo || return 1
}