# Maintainer: James Cleveland <jc@blit.cc>

pkgname=subdown
pkgver=0.2.2
pkgrel=3
pkgdesc="A tool for downloading images from reddit."
url="https://github.com/radiosilence/subdown"
depends=('python2' 'python2-requests' 'python2-docopt' 'python2-gevent' 'python2-clint' 'python2-simplejson')
makedepends=('python2-distribute')
license=('MIT')
arch=('any')
source=("http://pypi.python.org/packages/source/s/${pkgname}/${pkgname}-$pkgver.tar.gz")
md5sums=('5bdbc5763e161b0f79dd9547fece7504')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}"/
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
