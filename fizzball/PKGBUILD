# Contributor: Artificial Intelligence <polarbeard@gmail.com>

pkgname=fizzball
pkgver=1.01
pkgrel=2
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
source=('FizzBallFULL.tar.gz' 'FizzBall.png' 'fizzball.launcher' 'fizzball.desktop')
md5sums=('75869ce8d8680a744b8ad5563ea181db' 'f85ad0c2baae9cdc7a906c2c7202c585' '5e8b03518f89af81e3607d02d0220bf6' '35dcfef1296315aafbcaede12983bc14')


build() {
    cd $srcdir || return 1

# Create Destination Directory
    install -d $pkgdir/opt/Fizzball || return 1

# Extract Game 
    bsdtar -xf $srcdir/FizzBallFULL.tar.gz || return 1

# Install the data
    cp -r $srcdir/FizzBall/* $pkgdir/opt/Fizzball || return 1

# Install Icon
    install -D -m 644 $srcdir/FizzBall.png \
        $pkgdir/usr/share/pixmaps/FizzBall.png || return 1

# Install Launcher
    install -D -m 644 $srcdir/fizzball.desktop \
        $pkgdir/usr/share/applications/fizzball.desktop || return 1

# Install Game Launcher
    install -D -m 755 $srcdir/fizzball.launcher \
        $pkgdir/usr/bin/fizzball || return 1

# Install License
    install -D -m 644 $srcdir/FizzBall/LICENSE.TXT \
        $pkgdir/usr/share/licenses/$pkgname/license.txt || return 1
}