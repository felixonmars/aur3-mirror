# Maintainer: Ran Benita <ran234@gmail.com>

pkgname=tla-toolbox
pkgver=1.5.0
pkgrel=1
pkgdesc='An IDE for the TLA+ tools'
arch=('i686' 'x86_64')
license=('MIT')
url='http://research.microsoft.com/en-us/um/people/lamport/tla/toolbox.html'
depends=('java-runtime' 'gtk2')
source_i686=("https://tla.msr-inria.inria.fr/tlatoolbox/products/TLAToolbox-$pkgver-linux.gtk.x86.zip")
source_x86_64=("https://tla.msr-inria.inria.fr/tlatoolbox/products/TLAToolbox-$pkgver-linux.gtk.x86_64.zip")
sha1sums_i686=('4b80ca2cba18593e8cefee8763639b9d62053fb5')
sha1sums_x86_64=('61c96c6a414682feb446dca1ed3dca3c9e602bdd')

package() {
    install -d "$pkgdir"/{opt,usr/bin}
    cp -r "$srcdir"/toolbox/ "$pkgdir"/opt/$pkgname
    ln -s /opt/$pkgname/toolbox "$pkgdir"/usr/bin/$pkgname
}
