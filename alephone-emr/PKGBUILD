# Maintainer: Arkham <arkham at archlinux dot us>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=alephone-emr
pkgver=3.0
pkgrel=2
pkgdesc='"Excalibur: Morganas Revenge" is an FPS adventure game based on the Marathon engine'
arch=('any')
url="http://www.excaliburworld.com/emr/emr3/"
license=('GPL')
depends=('alephone>=20061228')
source=(http://downloads.sourceforge.net/emr3/emr-3.0-0602.tgz
        $pkgname.sh
        Makefile)
md5sums=('21afa8e5cca3ca474873f8cd45b8a6c1'
         '0c3c71b31e9a33ffab200e6f919731cc'
         '516796ee40ae70f39304d661d67b1bca')

build() {
    cd $srcdir/emr-$pkgver

    cp $srcdir/Makefile .

    # Compile and install
    make || return 1
    _PREFIX=$pkgdir make install || return 1
    install -Dm 755 $srcdir/$pkgname.sh $pkgdir/usr/bin/$pkgname
    ln -sf $pkgname $pkgdir/usr/bin/emr

    # Fix permissions
    find $pkgdir/usr/share -type f -exec chmod 644 {} +
}
