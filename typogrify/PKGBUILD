# Contributor: Bartek Piech <bartekpiech@gmail.com>
pkgname=typogrify
pkgver=1.0
pkgrel=1
pkgdesc="Collection of Django template filters that help prettify your web typography."
url="http://code.google.com/p/typogrify/"
license=('BSD')
arch=(any)
depends=('python' 'django>=1.0')
source=(http://typogrify.googlecode.com/files/typogrify-${pkgver}.tar.gz)
md5sums=('f71231392cb382af6924e480620a9e8e')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
    install -Dm644 LICENSE.txt ${pkgdir}/usr/share/license/${pkgname}/LICENSE
}
