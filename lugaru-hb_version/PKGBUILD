# Contributor: Artificial Intelligence <polarbeard@gmail.com>

pkgname=lugaru-hb_version
pkgver=1.0c
pkgrel=2
pkgdesc="Humble Bundle Version. Lugaru is a third-person action title. The main character, Turner, is an anthropomorphic rebel bunny rabbit with impressive combat skills. In his quest to find those responsible for slaughtering his village, he uncovers a far-reaching conspiracy involving the corrupt leaders of the rabbit republic and the starving wolves from a nearby den. Turner takes it upon himself to fight against their plot and save his fellow rabbits from slavery."
arch=('i686' 'x86_64')
url='http://www.wolfire.com/lugaru'
license=('custom: "commercial"')
install=lugaru.install
if [ "$CARCH" = "x86_64" ]; then
        depends=('lib32-openal' 'lib32-gcc-libs' 'lib32-sdl')
else
        depends=('openal' 'xdg-utils' 'sdl')
fi
makedepends=('unzip')
source=('lugaru-full-linux-x86-1.0c.bin' 'lugaru.desktop' 'lugaru.launcher')
md5sums=('41ea2e41fe42c40b5ad017ae1afb45c7' 'dd0b9881321e05f76dc693036ba8a9f2' '6242da6c45cb2009376010de95dd80a1')


build() {
    cd $srcdir || return 1

# Create Destination Directory
    install -d -m 755 $pkgdir/opt/Lugaru || return 1

# Extracting the .run file
    unzip $srcdir/lugaru-full-linux-x86-1.0c.bin  

# Removing Existing libs from Lugaro which can conflict with the system
    rm -rf $srcdir/data/libSDL-1.2.so.0
    rm -rf $srcdir/data/libgcc_s.so.1
    rm -rf $srcdir/data/libopenal.so.1
    rm -rf $srcdir/data/libstdc++.so.6
    rm -rf $srcdir/data/xdg-open

# Install the data
    cp -r $srcdir/data/*  $pkgdir/opt/Lugaru || return 1

# Install Icon
    install -D -m 644 $srcdir/data/lugaru.png \
        $pkgdir/usr/share/pixmaps/Lugaru.png || return 1

# Install Launcher
    install -D -m 644 $srcdir/lugaru.desktop \
        $pkgdir/usr/share/applications/lugaro.desktop || return 1

 # Install Game Launcher
    install -D -m 755 $srcdir/lugaru.launcher \
        $pkgdir/usr/bin/lugaru || return 1      
       
}