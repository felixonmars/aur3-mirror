pkgname=pluzzdl
pkgver=0.9.4
pkgrel=1
pkgdesc="Software to retreive videos from French website pluzz."
url="http://code.google.com/p/tvdownloader/"
depends=('python2' 'python2-crypto' 'python2-socksipy-branch' 'python2-beautifulsoup3' 'ffmpeg')
license=('GPL2')
arch=('any')
source=(http://tvdownloader.googlecode.com/files/${pkgname}_${pkgver}.tar.gz)
md5sums=('576d29ed7610b448b8d31a8b60f49a07')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make PYTHON_VERSION=python2
}
package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make PREFIX=$pkgdir/usr PYTHON_VERSION=python2 install
}
