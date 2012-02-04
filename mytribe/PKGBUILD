# Contributor: Artificial Intelligence <polarbeard@gmail.com>

pkgname=mytribe
pkgver=1.0.2
pkgrel=2
pkgdesc="Create your perfect island paradise with My Tribe!"
arch=('i686' 'x86_64')
url='http://grubbygames.com/mytribe/'
license=('custom: "commercial"')
install=mytribe.install
if [ "$CARCH" = "x86_64" ]; then
        depends=('lib32-freetype2' 'lib32-libjpeg6' 'lib32-sdl' 'lib32-gcc-libs' 'lib32-libxext' 'lib32-libpng12')
else
        depends=('freetype2' 'libjpeg6' 'sdl' 'gcc-libs' 'libxext' 'libpng12')
fi
source=('MyTribeFULL.tar.gz' 'MyTribe.png' 'mytribe.desktop' 'mytribe.launcher')
md5sums=('c89e265b81fc97e23b9d1a33e2443e73' '0ea7423a1f7a2e9e2c2bdd2afc13839d' 'ebd31292889deff5c7ba0b19c645cbef' 'a9b13d5b906efed3bf4c25ae9c573286')



build() {
    cd $srcdir  

# Create Destination Directory
    install -d $pkgdir/opt/MyTribe || return 1

# Extract Game 
    tar zxfv $srcdir/MyTribeFULL.tar.gz || return 1

# Install the data
    cp -r $srcdir/My*Tribe/* $pkgdir/opt/MyTribe || return 1


# Install Icon
    install -D -m 644 $srcdir/MyTribe.png \
        $pkgdir/usr/share/pixmaps/MyTribe.png || return 1

# Install Launcher
    install -D -m 644 $srcdir/mytribe.desktop \
        $pkgdir/usr/share/applications/mytribe.desktop || return 1

# Install Game Launcher
    install -D -m 755 $srcdir/mytribe.launcher \
        $pkgdir/usr/bin/mytribe || return 1
  

}
