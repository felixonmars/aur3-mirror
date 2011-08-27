# Contributor: Matias De la Puente <mfpuente.ar@gmail.com>
# Maintainer: Laszlo Papp <djszapi at gmail com>
pkgname=picp
pkgver=0.6.8
pkgrel=3
pkgdesc="Linux command-line interface to Microchip Picstart Plus"
arch=('i686')
url="http://home.pacbell.net/theposts/picmicro/"
license=('GPL')
depends=('gcc-libs')
source=("http://home.pacbell.net/theposts/picmicro/$pkgname-$pkgver.tar.gz"
        picdevrc.with_18f2550
        picp.patch)
md5sums=('55fb66b7ebf49fb1e3b687c6a77c4629'
         '8f062b1db2e7f5a47659b592ce3cb7e0'
         '776d2b9babfdf3120410a849d6eba3fd')

build() {
    cd ${srcdir}/$pkgname-$pkgver
    patch -d . -p1 -i ../../picp.patch || return 1
    make || return 1
    install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname} || return 1
	install -Dm755 picdevrc ${pkgdir}/usr/bin/picdevrc || return 1
}

