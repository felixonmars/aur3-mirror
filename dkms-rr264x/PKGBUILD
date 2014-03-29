#Contributor: Alessandro Sagratini <ale_sagra@hotmail.com>

pkgname=dkms-rr264x
pkgver=1.5
pkgrel=3
pkgdesc="Kernel modules for Highpoint RocketRAID 2640X1 SAS Card. (DKMS version)"
url="http://www.highpoint-tech.com/USA_new/cs-series_rr2600.htm"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dkms')
provides=("rr264x=${pkgver}")
conflicts=('rr264x' 'rr264x-lts')
install=${pkgname}.install
options=(!strip)
_pkgname=rr264x
source=(http://www.highpoint-tech.com/BIOS_Driver/rr26xx/2640X1-2640X4-2642/Linux/RR264x-Linux-Src-v1.5-120817-1641.tar.gz rr264x-v1.5.patch dkms.conf)

md5sums=('f10172e1443f169d7c845602295f38be'
         '527cc38d9bd5abd2033d029715ff0d58'
         '62c48c07cbfcd9c7ea0ceb53565ccd06')

build() {
    cd $srcdir/
    patch -p0 < ./rr264x-v1.5.patch
}

package() {
    install -dm755 "$pkgdir/usr/src/$_pkgname-$pkgver"
    cp -a $srcdir/rr264x-linux-src-v1.5/* $pkgdir/usr/src/$_pkgname-$pkgver/
    install -m644 "$srcdir/dkms.conf" "$pkgdir/usr/src/$_pkgname-$pkgver"
}
