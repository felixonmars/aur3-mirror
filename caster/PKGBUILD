# Contributor: Artificial Intelligence <polarbeard@gmail.com>

pkgname=caster
pkgver=1.1
pkgrel=1
pkgdesc="Dash across Scenic Locations destroying bug like creatures called the Flanx using 6 Unique Attacks that include Massive Terrain Deformation and High Speed Barrages of Energy Blasts!"
arch=('i686' 'x86_64')
url='http://www.elecorn.com/caster3d/'
license=('custom: "commercial"')
install=caster.install
if [ "$CARCH" = "x86_64" ]; then
        depends=('lib32-libvorbis' 'lib32-sdl' 'lib32-gcc-libs' 'lib32-mesa' 'lib32-libpng12')
else
        depends=('libvorbis' 'sdl' 'gcc-libs' 'mesa' 'libpng12')
fi
makedepends=('unzip')
source=('caster-1.1-installer.bin' 'Caster1.png' 'caster.desktop' 'caster.launcher')
md5sums=('d85e29eb5d2c7d49d55117f03ce66afb' '2440bebb2c4f3e4d4132648b2d3765a0' 'b3c701720e74ea1867e12e411084cc3e' 'bb0d10fef83c63116533bc52eae8cc33')


build() {
    cd $srcdir || return 1

# Create Destination Directory
    install -d -m 755 $pkgdir/opt/Caster || return 1

# Extracting the .run file
    unzip $srcdir/caster-1.1-installer.bin  

# Install the data
    cp -r $srcdir/data/caster_linux/*  $pkgdir/opt/Caster || return 1

# Install Icon
    install -D -m 644 $srcdir/Caster1.png \
        $pkgdir/usr/share/pixmaps/Caster1.png || return 1

# Install Launcher
    install -D -m 644 $srcdir/caster.desktop \
        $pkgdir/usr/share/applications/caster.desktop || return 1

 # Install Game Launcher
    install -D -m 755 $srcdir/caster.launcher \
        $pkgdir/usr/bin/caster || return 1      
    
 # Install License
    install -D -m 644 $srcdir/data/LICENSE.txt \
        $pkgdir/usr/share/licenses/$pkgname/license.txt
  
# Set groupship to :games
    chown -R :games $pkgdir/opt/Caster || return 1
    chmod -R g+rwX $pkgdir/opt/Caster || return 1

}