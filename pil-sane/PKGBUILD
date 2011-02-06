# Maintainer: Allan McRae <mcrae_allan@hotmail.com>
# Contributor: cuculus mortum <cucullus.at.mail.ru>

pkgname=pil-sane
pkgver=1.1.7
pkgrel=1
pkgdesc="Sane bindings for Python imaging library"
arch=('i686' 'x86_64')
url="http://www.pythonware.com/products/pil/index.htm"
license=('custom:"pil"')
depends=('python-imaging')
source=(http://effbot.org/downloads/Imaging-${pkgver}.tar.gz)

md5sums=('fc14a54e1ce02a0225be8854bfba478e')

build() {
    cd ${startdir}/src/Imaging-${pkgver}/Sane
    python2 setup.py build_ext
    python2 setup.py install --root=$startdir/pkg

        # Install license
    install -m644 -D ${startdir}/src/Imaging-${pkgver}/README \
    ${startdir}/pkg/usr/share/licenses/${pkgname}/README
}
