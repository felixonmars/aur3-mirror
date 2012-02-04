# Contributor: Artificial Intelligence <polarbeard@gmail.com>

pkgname=gish
pkgver=1.60
pkgrel=1
pkgdesc="A one of a kind 2d sidescroller with a twist you play as a totally physics based ball of tar."
arch=('i686' 'x86_64')
url='http://www.chroniclogic.com/gish.htm'
license=('custom: "commercial"')
install=gish.install
depends=('libvorbis' 'openal' 'sdl' 'gcc-libs' 'sdl_image' 'mesa')
source=('gish_1_6.tar.gz' 'Gish.png' 'gish.desktop' 'gish32bit.launcher' 'gish64bit.launcher')
md5sums=('946b390177628de07a3316af47b8fd90' 'f3831056f039b0d6867781d21b857993' '86aa2affaaa7076b05b8dc8ca1d64a33' '7d15b8e4f5b5204e6a48854bdf2ca6aa' '180ba20319790fe471f929e8f3905c48')



build() {
    cd $srcdir 

# Create Destination Directory
    install -d $pkgdir/opt/Gish 

# Extract Game 
    bsdtar -xf $srcdir/gish_1_6.tar.gz 

# Install the data
    cp -r $srcdir/gish/* $pkgdir/opt/Gish 

# Install Icon
    install -D -m 644 $srcdir/Gish.png \
        $pkgdir/usr/share/pixmaps/Gish.png 

# Install Launcher
    install -D -m 644 $srcdir/gish.desktop \
        $pkgdir/usr/share/applications/gish.desktop 

# Install Game Launcher

if [ "$CARCH" = "x86_64" ]; then
        install -D -m 755 $srcdir/gish64bit.launcher \
        $pkgdir/usr/bin/gish 

else
        install -D -m 755 $srcdir/gish32bit.launcher \
        $pkgdir/usr/bin/gish 

fi

# Set groupship to :games
    chown -R :games $pkgdir/opt/Gish || return 1
    chmod -R g+rwX $pkgdir/opt/Gish || return 1



}