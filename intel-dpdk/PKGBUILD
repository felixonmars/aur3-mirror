# Maintainer: Robert Clipsham <robert@octarineparrot.com>
# Contributor: Christoph Gysin <christoph.gysin@gmail.com>
pkgname=intel-dpdk
_pkgname=dpdk
pkgver=2.0.0
pkgrel=1
pkgdesc="Intel Data Plane Development Kit"
arch=('i686' 'x86_64')
url="http://dpdk.org/"
license=('LGPL2')
depends=()
makedepends=('linux-headers')
options=('staticlibs')
source=(http://dpdk.org/browse/$_pkgname/snapshot/$_pkgname-$pkgver.tar.gz)
md5sums=('e9e7935c9eec920841ad373949514934')

_target=$(uname -m)-native-linuxapp-gcc

prepare() {
    cd "$srcdir/$_pkgname-$pkgver"
    sed -i '1s/python/python2/' tools/*.py
}

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    make T=$_target config install
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"

    install -d $pkgdir/usr/include
    cp -Lr $_target/include/* $pkgdir/usr/include
    install -d $pkgdir/usr/lib
    cp -r $_target/lib/* $pkgdir/usr/lib
    install -d $pkgdir/usr/lib/modules/extramodules-$(uname -r | cut -d. -f1-2)-ARCH
    cp -r $_target/kmod/* $pkgdir/usr/lib/modules/extramodules-$(uname -r | cut -d. -f1-2)-ARCH
    install -d $pkgdir/usr/bin
    install tools/cpu_layout.py $pkgdir/usr/bin/dpdk_cpu_layout
    install tools/dpdk_nic_bind.py $pkgdir/usr/bin/dpdk_nic_bind
}

