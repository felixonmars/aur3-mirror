# Maintainer: Lazaros Koromilas <koromilaz@gmail.com>

pkgname=opencl-icd
pkgver=1.2.11.0
_clver=1.2
_pkgdir=icd
pkgrel=4
pkgdesc='OpenCL 1.2 Installable Client Driver (ICD) Loader and Headers'
arch=('any')
url='http://www.khronos.org/registry/cl/'
license=('custom')
makedepends=('cmake' 'mesa')
depends=('opencl-headers12')
provides=('libcl')
conflicts=('libcl')
source=("http://www.khronos.org/registry/cl/specs/${pkgname}-${pkgver}.tgz")
md5sums=('697bd9f3a66fd61ad58fb4a17fda66c7')

build() {
    cd $srcdir/$_pkgdir

    make
}

package() {
    cd $srcdir/$_pkgdir

    install -dm755 $pkgdir/etc/OpenCL/vendors

    install -D -m755 bin/libOpenCL.so.1.2 $pkgdir/usr/lib/libOpenCL.so.1.2
    ln -s /usr/lib/libOpenCL.so.1.2 $pkgdir/usr/lib/libOpenCL.so.1
    ln -s /usr/lib/libOpenCL.so.1 $pkgdir/usr/lib/libOpenCL.so

    install -D -m644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
