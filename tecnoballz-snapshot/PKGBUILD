#Contributor: SaintShakaJin <saintshakajin.3@laposte.net>

pkgname=tecnoballz-snapshot
pkgver=20060616
pkgrel=2
_patch=2
conflicts=('tecnoballz-cvs')
provides=('tecnoballz')
pkgdesc="TecnoballZ is a 'breaking blocks' game that was originally written for the Amiga platfrom."
url="http://linux.tlk.fr/games/TecnoballZ/"
depends=('x-server' 'sdl' 'sdl_mixer' 'libmikmod' 'smpeg')
makedepends=('gcc' 'make')
source=(http://ftp.debian.org/debian/pool/main/t/tecnoballz/tecnoballz_0.91cvs${pkgver}.orig.tar.gz 
	http://ftp.debian.org/debian/pool/main/t/tecnoballz/tecnoballz_0.91cvs${pkgver}-${_patch}.diff.gz 
	tecnoballz.sh)
md5sums=('aa0b2f5a6ccf02676552c02b3f41f046' 'd284d543d18afbd95cb86c84c0e9c410'\
         'b4a77e5fef5f8de7bb9ca8cc5163fd09')

build() {
    cd $startdir/src/tecnoballz-0.91cvs${pkgver}
    patch -Np1 -i ../tecnoballz_0.91cvs${pkgver}-${_patch}.diff
    ./bootstrap
    ./configure --prefix=/usr
    make || return 1
    make DESTDIR=$startdir/pkg install
    mkdir -p $startdir/pkg/etc/profile.d
    install -m755 $startdir/src/tecnoballz.sh $startdir/pkg/etc/profile.d
}
