# Contributor: Randy Morris <randy rsontech net>
pkgname=slurpy
pkgver=2.2.0
pkgrel=5
pkgdesc="An AUR search/download/update helper in Python"
arch=('any')
url="http://github.com/rson/slurpy/"
license=('None')
depends=('python2')
optdepends=('python-cjson: faster processing for large result sets'
            'python-pycurl: upload packages to the AUR from the command line')
conflicts=('slurpy-git')
provides=('slurpy-git')
source=("https://github.com/rson/${pkgname}/raw/v${pkgver}/${pkgname}" "python2.patch")
build() {
  patch -Np0 -i $srcdir/python2.patch
  install -D -m755 $srcdir/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
md5sums=('7333086d559a0a681f1bc9a13209fff1'
         '1b684c1ada1a7c42ef81b1c70c2ca820')
