# Maintainer:	Jesse Jaara	<mail.ru,gmail.com: jesse.jaara>

pkgname=python2-v4l2capture
pkgver=1.4
pkgrel=2
pkgdesc="Python extension to capture video with video4linux2"
arch=(i686 x86_64)
url="http://fredrik.jemla.eu/v4l2capture"
license=('custom: public domain')
depends=('python2' 'v4l-utils')
source=("http://pypi.python.org/packages/source/v/v4l2capture/v4l2capture-${pkgver}.tar.gz"
LICENSE)

package() {
cd "${srcdir}/v4l2capture-${pkgver}"

python2 setup.py install --root="${pkgdir}/" --optimize=1

install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('ce155598dfc3f55c68b3227040fd9768'
'252a63bed3400faf9bcfbb3ed186aec0')

