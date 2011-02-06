# Contributor: Artificial Intelligence <polarbeard@gmail.com>

pkgname=mytribe-demo
pkgver=1.0.2
pkgrel=1
pkgdesc="Create your perfect island paradise with My Tribe!"
arch=('i686' 'x86_64')
url='http://grubbygames.com/mytribe/'
license=('custom: "commercial"')
install=mytribe-demo.install
if [ "$CARCH" = "x86_64" ]; then
        depends=('lib32-freetype2' 'lib32-libjpeg6' 'lib32-sdl' 'lib32-gcc-libs' 'lib32-libxext' 'lib32-libpng12')
else
        depends=('freetype2' 'libjpeg6' 'sdl' 'gcc-libs' 'libxext' 'libpng12')
fi
source=("http://s3.amazonaws.com/GrubbyGames/MyTribeDEMO.tar.gz"
'MyTribe-demo.png'
'mytribe-demo.desktop'
'mytribe-demo.launcher')
md5sums=('a3febbd2f6e5e17b0fcc450340ec6821' '0ea7423a1f7a2e9e2c2bdd2afc13839d' 'dcea3b61179e149fbe8afb89337cc3d7' '8fe7504ffafa20067a81e91ca53fd9a2')


build() {
    cd $srcdir  

# Create Destination Directory
    install -d $pkgdir/opt/MyTribe-demo || return 1

# Extract Game 
    tar zxfv $srcdir/MyTribeDEMO.tar.gz || return 1

# Install the data
    cp -r $srcdir/My*Tribe*DEMO/* $pkgdir/opt/MyTribe-demo || return 1


# Install Icon
    install -D -m 644 $srcdir/MyTribe-demo.png \
        $pkgdir/usr/share/pixmaps/MyTribe-demo.png || return 1

# Install Launcher
    install -D -m 644 $srcdir/mytribe-demo.desktop \
        $pkgdir/usr/share/applications/mytribe-demo.desktop || return 1

# Install Game Launcher
    install -D -m 755 $srcdir/mytribe-demo.launcher \
        $pkgdir/usr/bin/mytribe-demo || return 1
  

}
