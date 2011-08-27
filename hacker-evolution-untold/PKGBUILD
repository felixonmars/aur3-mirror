# Contributor: Artificial Intelligence <polarbeard@gmail.com>

pkgname=hacker-evolution-untold
pkgver=2.2
pkgrel=2 
pkgdesc="When the number of computers in existence and their processing capacity exceeds that of all mankind, a point of technological singularity is encountered. A massive economic and systematic crisis hits the entire world. Nobody knows the exact cause, and all solutions to fix it, are failing. We are about to lose our position as a dominant specie on the planet, in favor of something we have created... computers."
arch=('i686' 'x86_64')
url='http://www.exosyphen.com/page_hacker-evolution-untold.html'
license=('custom: "commercial"')
install=hackerevolution.install
depends=('mesa')
makedepends=('unzip')
source=('HackerEvolutionUntold-Linux-1.01.zip'
'HackerEvolution.png'
'hackerevolution.desktop'
'hackerevolution.launcher')
md5sums=('50ac5626b2cbbd27d013b0a024cab197' '89a061da1cb4ec4fd40e97b33b8229d3' '6fd04a141ee3f6d5e66e63bd64e576f3' '03a59b1edd42faaccf46aa92475802c4')


build() {
    cd $srcdir || return 1

# Create Destination Directory
    install -d $pkgdir/opt/HackerEvolution || return 1

# Extract Game & Install Data
    mkdir $srcdir/hacker || return 1
    unzip $srcdir/HackerEvolutionUntold-Linux-1.01.zip -d $srcdir/hacker || return 1

if [ "$CARCH" = "x86_64" ]; then
    cd $srcdir/hacker || return 1
    tar zxfv heuntold-linux-x86_64-retail-2.2.tar.gz || return 1
    cp -r $srcdir/hacker/heuntold-linux-x86_64-retail-2.2/* $pkgdir/opt/HackerEvolution || return 1
else
    cd $srcdir/hacker || return 1
    tar zxfv heuntold-linux-x86-retail-2.2.tar.gz || return 1
    cp -r $srcdir/hacker/flightzero-retail-linux-x86-2.2-rc2-28-g5f80fd0/* $pkgdir/opt/HackerEvolution || return 1
fi


# Install Icon
    install -D -m 644 $srcdir/HackerEvolution.png \
        $pkgdir/usr/share/pixmaps/HackerEvolution.png || return 1


# Install Launcher
    install -D -m 644 $srcdir/hackerevolution.desktop \
        $pkgdir/usr/share/applications/hackerevolution.desktop || return 1

# Install Game Launcher
    install -D -m 755 $srcdir/hackerevolution.launcher \
        $pkgdir/usr/bin/hackerevolution || return 1

}