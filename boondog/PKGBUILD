# Maintainer: Arkham <arkham at archlinux dot us>
# Contributor: Arkham <arkham at archlinux dot us>

pkgname=boondog
pkgver=1.2
pkgrel=1
pkgdesc="A fun puzzle game: jump, grab ledges, push blocks, activate switches and avoid level hazards!"
arch=('i686')
url="http://www.bazosoft.com/index.php?a=games"
license=('custom')
depends=('zlib' 'alsa-lib' 'libxpm' 'libxrandr')
source=(http://www.bazosoft.com/_downloads/$pkgname.v.$pkgver.zip
        $pkgname.sh)
md5sums=('104065a42e55a765e43f3a3e7b838bc5'
         'bd4631e1f2374f255c20e17a87334ee0')

build() {
    # Remove some trash
    cd $srcdir/$pkgname.v.$pkgver
    rm -f boondog-windows.exe zlib1.dll dat/plug-mm.dll

    # Copy and set correct permissions
    install -d $pkgdir/usr/share/$pkgname
    cp -r . $pkgdir/usr/share/$pkgname/
    find $pkgdir/usr/share/$pkgname -type f -exec chmod 644 {} +
    find $pkgdir/usr/share/$pkgname -type d -exec chmod 755 {} + 
    chmod 755 $pkgdir/usr/share/$pkgname/$pkgname-linux
    
    # These are needed to be able to navigate the levelpacks and save the game
    chmod 777 $pkgdir/usr/share/$pkgname/packs/*
    chmod 666 $pkgdir/usr/share/$pkgname/dat/save.dat

    # Install license and bin (which calls reset on exit to clear some console spam)
    install -Dm 644 readme.txt $pkgdir/usr/share/licenses/$pkgname/readme.txt
    install -Dm 755 $srcdir/$pkgname.sh $pkgdir/usr/bin/$pkgname
}
