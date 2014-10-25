# Maintainer : Frederic Bezies <fredbezies at gmail dot com>
# For ArchLinux by Joël Porquet

pkgname=dtc
pkgver=v1.4.0
pkgrel=1
pkgdesc="Stable release of Device Tree Compiler"
url="https://kernel.googlesource.com/"
arch=('i686' 'x86_64')
license=('GPL2')
source=('https://kernel.googlesource.com/pub/scm/utils/dtc/dtc.git/+archive/65cc4d2748a2c2e6f27f1cf39e07a5dbabd80ebf.tar.gz')

build() {
    cd $_gitname

    make 
}
package() {
    cd $_gitname

    make INSTALL=$(which install) DESTDIR=${pkgdir} PREFIX=/usr install 
}

md5sums=('4d47bcd9c9f4e4066aa6773a39189ee5')
