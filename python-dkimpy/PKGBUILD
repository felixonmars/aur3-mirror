# Maintainer: max-k <max-k@post.com>
pkgname=python-dkimpy
_shortname=dkimpy
pkgver=0.5.4
pkgrel=1
pkgdesc="Python module that implements DKIM (DomainKeys Identified Mail) email signing and verification."
arch=(any)
url="https://launchpad.net/dkimpy"
license=('custom')
depends=('python>=3.1')
options=(!emptydirs)
source=("https://launchpad.net/${_shortname}/trunk/0.5.4/+download/${_shortname}-${pkgver}.tar.gz"
        LICENSE)
md5sums=('75f461f48369621c70bcceb6976c6a0b'
         '1695e78de4f6870d3772861af89ac572')

build() {
  echo "" > /dev/null  
}

package() {
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd "${srcdir}/${_shortname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
