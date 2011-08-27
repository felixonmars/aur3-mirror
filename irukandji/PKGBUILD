# Contributor: Artificial Intelligence <polarbeard@gmail.com>

pkgname=irukandji
pkgver=1.0
pkgrel=2
pkgdesc="Irukandji is a fun score attack shooter, set in an abstract underwater trench. You fly your ship against the flow of hundreds of amazing procedurally animated sea monsters, blasting your way to the final showdown – a Giant Enemy Crab!"
arch=('i686' 'x86_64')
url='http://www.charliesgames.com/wordpress/?page_id=399'
license=('custom: "shareware"')
install=irukandji.install
if [ "$CARCH" = "x86_64" ]; then
        depends=('lib32-freetype2' 'lib32-libxxf86vm' 'lib32-mesa' 'lib32-gcc-libs' 'lib32-libxrandr')
else   
        depends=('freetype2' 'libxxf86vm' 'mesa' 'gcc-libs' 'libxrandr')
fi     
source=('IrukandjiLinuxFull.tar.gz' 'irukandji.desktop' 'Irukandji.png' 'irukandji.launcher')
md5sums=('3e777558056233d0ce76c153f277e009' '6513c0c2b4792d7274534a4b63b4e99e' '90aee6cbf5b7257da3e37c8411d5565a' 'c25cbbc9c57d61f9e7c3a0732438dab8')



build() {
    cd $srcdir || return 1

# Create Destination Directory
    install -d -m 755 $pkgdir/opt/Irukandji || return 1

# Extract Game 
    tar zxfv $srcdir/IrukandjiLinuxFull.tar.gz || return 1

# Install the data
    cp -r $srcdir/IrukandjiLinuxFull/* $pkgdir/opt/Irukandji || return 1


# Install Icon
    install -D -m 644 $srcdir/Irukandji.png \
        $pkgdir/usr/share/pixmaps/Irukandji.png || return 1

# Install Launcher
    install -D -m 644 $srcdir/irukandji.desktop \
        $pkgdir/usr/share/applications/irukandji.desktop || return 1

# Install Game Launcher
    install -D -m 755 $srcdir/irukandji.launcher \
        $pkgdir/usr/bin/irukandji || return 1

# Set groupship to :games
    chown -R :games $pkgdir/opt/Irukandji || return 1
    chmod -R g+rwX $pkgdir/opt/Irukandji || return 1



    
}
