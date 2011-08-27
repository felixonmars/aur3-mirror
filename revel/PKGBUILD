# Contributor: Janusz Marat (mrvc) <mrvc@gazeta.pl>

pkgname=revel
pkgver=1.1.0
pkgrel=4
arch=('i686' 'x86_64')
license=(GPL)
pkgdesc="the Really Easy Video Encoding Library"
url="http://revel.sourceforge.net"
depends=('xvidcore')
source=(http://puzzle.dl.sourceforge.net/sourceforge/revel/${pkgname}-${pkgver}.tar.bz2 http://aur.archlinux.org/packages/revel/revel/revel-gcc430.patch)
md5sums=(d55363d97fbb6d897eb598c9a6b0205a 3c2ed0658fd1399a36d41147c620c189)

build()        {
        cd $startdir/src/$pkgname-$pkgver
	patch src/BaseEncoder.h $startdir/src/revel-gcc430.patch || return 1
        ./configure --prefix=/usr || return 1
        make || return 1
        make DESTDIR=$startdir/pkg install
}

