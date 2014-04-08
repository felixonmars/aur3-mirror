# Maintainer: Miguel Revilla <yo@miguelrevilla.com>

pkgname=python-magic
pkgver=5.18
pkgrel=1
pkgdesc="Python bindings to allow you to access the libmagic api"
arch=('any')
url="http://darwinsys.com/file/"
license=('custom')
depends=('python' 'python2')
source=(ftp://ftp.astron.com/pub/file/file-${pkgver}.tar.gz)
md5sums=('d420d8f2990cd344673acfbf8d76ff5a')

build() {
cd "${srcdir}/file-${pkgver}/python"

python setup.py build
}

package() {
cd "${srcdir}/file-${pkgver}/python"

mkdir -p "${pkgdir}/usr/lib/python2.7/lib-dynload"
mkdir -p "${pkgdir}/usr/lib/python3.4/lib-dynload"
cp build/lib/magic.py "${pkgdir}/usr/lib/python2.7/lib-dynload/"
cp build/lib/magic.py "${pkgdir}/usr/lib/python3.4/lib-dynload/"
install -D -m644 "${srcdir}/file-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

