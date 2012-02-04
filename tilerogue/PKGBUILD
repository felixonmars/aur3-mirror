# Contributor: megadriver <megadriver at gmx dot com>

pkgname=tilerogue
pkgver=1.21
pkgrel=2
pkgdesc="Tile-based graphical Rogue clone"
arch=('i686' 'x86_64')
url="http://www.freewebs.com/drussell/TileRogue.htm"
license=('BSD','GPL2','Freeware')
depends=('sdl_mixer')
makedepends=('p7zip' 'vorbis-tools')
install=${pkgname}.install
source=("http://www.freewebs.com/drussell/TileRogue.zip"
        "http://www.cs.hmc.edu/~geoff/tars/mtwist-1.0.tgz"
         Makefile $pkgname.sh $pkgname.png $pkgname.desktop)

build() {
    cd $srcdir
    cp Makefile mtwist-1.0/* TileRogue/source
    cd TileRogue/source
    7z e TileRogueSource121.7z
    sed -i 's|return 1;|return 0;|g' buildres.c
    gcc buildres.c -o buildres
    ./buildres
    make || return 1
    mkdir -p $pkgdir/opt/$pkgname/{data,sounds}
    install -m755 TileRogue $pkgdir/opt/$pkgname/$pkgname
    cd ../sounds
    oggdec *.ogg
    install -m644 *.wav $pkgdir/opt/$pkgname/sounds/
    cd ..
    install -m644 data/* $pkgdir/opt/$pkgname/data/
    install -m644 ReadMe.txt $pkgdir/opt/$pkgname/readme.txt
    cd $srcdir
    install -m644 $pkgname.png $pkgdir/opt/$pkgname/$pkgname.png
    install -D -m755 $pkgname.sh $pkgdir/usr/bin/$pkgname
    install -D -m644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
    chown root:games $pkgdir/opt/$pkgname
    chmod g+w $pkgdir/opt/$pkgname
}

md5sums=('d13d7e121e1ecfcdf5f6009bf73ca1c1'
         '2483a9de23d5c382825f84e403c20faa'
         '56836fe394e65eabcd46fdd00865b396'
         '9c0e998f0865ce4d05949781e825ffae'
         '5b895c0146d205c8ab28b7cc183fe63b'
         'e6c1903e658c82f295cd09b780e7501d')
