# Maintainer: Christer Edwards <christer.edwards@gmail.com>

pkgname=salt-cloud
pkgver=0.8.10
pkgrel=1
pkgdesc="Salt Cloud is a generic cloud provisioning tool"
arch=(any)
url="https://github.com/saltstack/salt-cloud"
license=("APACHE")

depends=('salt'
	 'python2'
         'python2-yaml'
	 'apache-libcloud'
         'python2-botocore')

makedepends=()
optdepends=()
options=()
conflicts=('salt-cloud-git')

source=("http://pypi.python.org/packages/source/s/${pkgname}/${pkgname}-${pkgver}.tar.gz")

sha1sums=('6e637b86e43d3f67a6d5225c5e38ab31092d9a77')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py install --root=${pkgdir}/ --optimize=1
}

