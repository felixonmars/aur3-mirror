# Contributor: Artificial Intelligence <polarbeard@gmail.com>

pkgname=irukandji-demo
pkgver=1.0
pkgrel=1
pkgdesc="Irukandji is a fun score attack shooter, set in an abstract underwater trench. You fly your ship against the flow of hundreds of amazing procedurally animated sea monsters, blasting your way to the final showdown – a Giant Enemy Crab!"
arch=('i686' 'x86_64') 
url='http://www.charliesgames.com/wordpress/?page_id=399'
license=('custom: "shareware"')
install=irukandji-demo.install
if [ "$CARCH" = "x86_64" ]; then
        depends=('lib32-freetype2' 'lib32-libxxf86vm' 'lib32-mesa' 'lib32-gcc-libs' 'lib32-libxrandr')
else   
        depends=('freetype2' 'libxxf86vm' 'mesa' 'gcc-libs' 'libxrandr')
fi     
source=("http://www.charliesgames.com/demo/IrukandjiLinuxDemo.tar.gz"
'Irukandji-demo.png'
'irukandji-demo.desktop'
'irukandji-demo.launcher')
md5sums=('fc73475bba858513c42de87b9082e8d3' '90aee6cbf5b7257da3e37c8411d5565a' 'f1c24888e197a2a3ad47f231d1c840af' '3d2aad3f20aac4ee1fe20e2741d48808')

build() {
    cd $srcdir || return 1

# Create Destination Directory
    install -d -m 755 $pkgdir/opt/Irukandji-demo || return 1

# Extract Game 
    tar zxfv $srcdir/IrukandjiLinuxDemo.tar.gz || return 1

# Install the data
    cp -r $srcdir/IrukandjiLinuxDemo/* $pkgdir/opt/Irukandji-demo || return 1

# Install Icon
    install -D -m 644 $srcdir/Irukandji-demo.png \
        $pkgdir/usr/share/pixmaps/Irukandji-demo.png || return 1

# Install Launcher
    install -D -m 644 $srcdir/irukandji-demo.desktop \
        $pkgdir/usr/share/applications/irukandji-demo.desktop || return 1

# Install Game Launcher
    install -D -m 755 $srcdir/irukandji-demo.launcher \
        $pkgdir/usr/bin/irukandji-demo || return 1

# Set groupship to :games
    chown -R :games $pkgdir/opt/Irukandji-demo || return 1
    chmod -R g+rwX $pkgdir/opt/Irukandji-demo || return 1

    
}