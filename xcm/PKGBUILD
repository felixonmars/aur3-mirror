# Maintainer: M0Rf30

pkgname=xcm
pkgver=0.5.3
pkgrel=1
pkgdesc="Tools based on libXcm, a library for colour management on X."
url="http://oyranos.org/"
arch=('i686' 'x86_64')   
depends=('xorg-server' 'libxcm' 'oyranos')
source=("http://prdownloads.sourceforge.net/oyranos/xcm-$pkgver.tar.bz2")
license=('MIT')

package() {
    cd $srcdir/xcm-$pkgver
    # The default makepkg option "--as-needed" leads to underfined reference 'pow' in libXcmEDID.so
    LDFLAGS='-Wl,-O1,--sort-common,-z,relro'
    ./configure --prefix=/usr --with-udev-dir=/usr/lib/udev/rules.d
    make -j1
    make DESTDIR=$pkgdir install
}

md5sums=('ed74e97ff6dc5b320e99caacc8511035')
