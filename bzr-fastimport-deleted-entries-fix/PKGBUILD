# Contributor: Nuno Araujo <nuno.araujo@russo79.com>
# Contributor: Mario Danic <mario.danic>
# Contributor: Kambus

_pkgname=bzr-fastimport
pkgname=bzr-fastimport-deleted-entries-fix
pkgver=0.10.0
pkgrel=1
pkgdesc="Fast loading of revision control data into Bazaar. (renames fix)"
arch=(i686 x86_64)
url="https://launchpad.net/${_pkgname}"
license=('GNU GPL v2' 'MIT')
groups=(bzr)
conflicts=(${_pkgname} bzr-fastimport bzr-fastimport-bzr bzr-fastimport-russo79-bzr)
provides=(${_pkgname})
depends=('python2' 'setuptools' 'bzr' 'python2-fastimport-bzr')
makedepends=('bzr')
source=(http://launchpad.net/${_pkgname}/trunk/${pkgver}/+download/${_pkgname}-${pkgver}.tar.gz
        fix-deleted-entries-in-renamed-directory.patch)

md5sums=('ed9dba180cd73e5fc312bc75c30a56d1'
         '56ee25c40eac18fa543a8ee45d6a957d')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  patch -Np1 -i ${srcdir}/fix-deleted-entries-in-renamed-directory.patch

  python2 setup.py install --prefix'=/usr' --root=${pkgdir} || return 1
}
