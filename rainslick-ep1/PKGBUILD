# Contributor: Artificial Intelligence <polarbeard@gmail.com>

pkgname=rainslick-ep1
pkgver=r5
pkgrel=1
pkgdesc="On the Rain-Slick Precipice of Darkness is an episodic RPG-adventure game series set in a deranged comic-book meets-pulp-horror 1920s universe."
arch=('i686' 'x86_64')
url="http://www.rainslick.com/"
license=('custom: "commercial"')
install=rainslickep1.install
if [ "$CARCH" = "x86_64" ]; then
        depends=('lib32-gcc-libs' 'lib32-libxrandr' 'lib32-sdl')
else
        depends=('gcc-libs' 'libxrandr' 'sdl')
fi
if [ "$CARCH" = "x86_64" ]; then
        optdepends=('lib32-nvidia-utils: nvidia cards'
'lib32-libgl: open driver')
else
        optdepends=('nvidia-utils: nvidia cards'
'libgl: open driver')
fi
source=("http://download.playgreenhouse.com/rainslickep1_linux_r5.tgz" 
'rainslickep1.desktop' 'rainslickep1.launcher')
md5sums=('3b337c38a7003633bb4048e6a3377764' '0d53c2c114a605faaa06c94d11800b36' '9eeee0cbf8ca979aca4cdbd418499012')


build() {
    cd $srcdir  

# Create Destination Directory
    install -d $pkgdir/opt/RainSlickEp1 || return 1

# Extract Game 
    bsdtar -xvf $srcdir/rainslickep1_linux_r5.tgz || return 1


# Install the data
    cp -r $srcdir/rainslickep1/* $pkgdir/opt/RainSlickEp1 || return 1

# Install Icon
    install -D -m 644 $pkgdir/opt/RainSlickEp1/rainslick.png \
        $pkgdir/usr/share/pixmaps/RainSlick1.png || return 1


# Install Launcher
    install -D -m 644 $srcdir/rainslickep1.desktop \
        $pkgdir/usr/share/applications/rainslickep1.desktop || return 1


# Install Game Launcher
    install -D -m 755 $srcdir/rainslickep1.launcher \
        $pkgdir/usr/bin/rainslickep1 || return 1
  
# Install License
    install -D -m 644 $srcdir/rainslickep1/eula.html \
        $pkgdir/usr/share/licenses/$pkgname/eula.html || return 1

}
