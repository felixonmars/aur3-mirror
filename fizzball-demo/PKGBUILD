# Contributor: Artificial Intelligence <polarbeard@gmail.com>

pkgname=fizzball-demo
pkgver=1.01
pkgrel=1
pkgdesc="Bounce bubbles, rescue hungry animals, and solve a mystery, all at the same time!" 
arch=('i686' 'x86_64')
url='http://grubbygames.com/fizzball/'
license=('custom: "commercial"')
install=fizzball-demo.install
if [ "$CARCH" = "x86_64" ]; then
        depends=('lib32-alsa-lib' 'lib32-libjpeg6' 'lib32-sdl' 'lib32-gcc-libs' 'lib32-libxext' 'lib32-libpng12')
else
        depends=('alsa-lib' 'libjpeg6' 'sdl' 'gcc-libs' 'libxext' 'libpng12')
fi
source=("http://grubbygamesfiles.com/fizzball/FizzBallDEMO.tar.gz"
'FizzBall.png'
'fizzball-demo.desktop'
'fizzball-demo.launcher')
md5sums=('d2b44aef43bf8d0a8517772aaa3e78d8' 'f85ad0c2baae9cdc7a906c2c7202c585' '0a7ef1ef2e1ad2ec4f8cce0551e050e3' 'c568ad2986e6053998bb0ab96e9bfd80')



build() {
    cd $srcdir || return 1

# Create Destination Directory
    install -d $pkgdir/opt/Fizzball-demo || return 1

# Extract Game 
    bsdtar -xf $srcdir/FizzBallDEMO.tar.gz || return 1

# Install the data
    cp -r $srcdir/FizzBall*DEMO/* $pkgdir/opt/Fizzball-demo || return 1

# Install Icon
    install -D -m 644 $srcdir/FizzBall.png \
        $pkgdir/usr/share/pixmaps/FizzBall-demo.png || return 1

# Install Launcher
    install -D -m 644 $srcdir/fizzball-demo.desktop \
        $pkgdir/usr/share/applications/fizzball-demo.desktop || return 1

# Install Game Launcher
    install -D -m 755 $srcdir/fizzball-demo.launcher \
        $pkgdir/usr/bin/fizzball-demo || return 1

# Install License
    install -D -m 644 $srcdir/FizzBall*DEMO/LICENSE.TXT \
        $pkgdir/usr/share/licenses/$pkgname/license.txt || return 1
}