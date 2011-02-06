# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=pylirc
pkgver=0.0.5
pkgrel=3
pkgdesc="Python module that interacts with lirc"
arch=('any')
url="http://pylirc.mccabe.nu/"
license=('LGPL')
depends=('lirc' 'python2')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('4e3b6b50485610e273fededdb25b47ad')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python2 setup.py build
    python2 setup.py install --prefix "${pkgdir}/usr"
}

# vim:set ts=2 sw=2 et:
