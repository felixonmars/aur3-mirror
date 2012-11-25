# Contributor: Artificial Intelligence <polarbeard@gmail.com>

pkgname=hacker-evolution-untold-demo
pkgver=2.2
_rcver=rc3
pkgrel=4
pkgdesc="When the number of computers in existence and their processing capacity exceeds that of all mankind, a point of technological singularity is encountered. A massive economic and systematic crisis hits the entire world."
arch=('i686' 'x86_64')
url='http://www.exosyphen.com/page_hacker-evolution-untold.html'
license=('custom: "commercial"')
install=hackerevolution-demo.install
depends=('mesa')
makedepends=('unzip')
source=('http://www.exosyphen.com/files-download/HackerEvolutionUntold-Demo-Linux.zip'
        'HackerEvolution-demo.png'
        'hackerevolution-demo.desktop'
        'hackerevolution-demo.launcher')
md5sums=('57d269c388d3fe1cd13076f841f38d75'
         '89a061da1cb4ec4fd40e97b33b8229d3'
         '6ca7031db706ef417fe3065ffb1600e0'
         '54814d32cd7befe4b4ab96ffb2c4a243')

build() {
    cd $srcdir

# Create Destination Directory
    install -d $pkgdir/opt/HackerEvolution-demo || return 1

# Extract Game & Install Data
if [ "$CARCH" = "x86_64" ]; then
    tar zxfv $srcdir/heuntold-linux-demo-64.tar.gz || return 1
    cp -r $srcdir/heuntold-demo-$pkgver-$_rcver-5-*-linux-x86_64/* $pkgdir/opt/HackerEvolution-demo || return 1
else
    tar zxfv $srcdir/heuntold-linux-demo.tar.gz || return 1
    cp -r $srcdir/heuntold-demo-$pkgver-$_rcver-5-*-linux-x86/* $pkgdir/opt/HackerEvolution-demo || return 1
fi

# Install Icon
    install -D -m 644 $srcdir/HackerEvolution-demo.png \
        $pkgdir/usr/share/pixmaps/HackerEvolution-demo.png || return 1

# Install Launcher
    install -D -m 644 $srcdir/hackerevolution-demo.desktop \
        $pkgdir/usr/share/applications/hackerevolution-demo.desktop || return 1

# Install Game Launcher
    install -D -m 755 $srcdir/hackerevolution-demo.launcher \
        $pkgdir/usr/bin/hackerevolution-demo || return 1

}
