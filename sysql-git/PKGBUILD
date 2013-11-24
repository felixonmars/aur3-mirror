pkgname=sysql-git
pkgver=75a1400
pkgrel=1
pkgdesc="sysql - use sql queries against output of linux commands"
url="https://github.com/studentiks/sysql"
arch=('x86_64' 'i686')
license=('MIT')
depends=('python')
optdepends=()
makedepends=('git' 'python-setuptools')
conflicts=()
replaces=()
backup=()
source=("${pkgname}::git+https://github.com/studentiks/sysql.git")
md5sums=('SKIP')

pkgver() {
        cd ${pkgname}
        git describe --always | sed 's|-|.|g'
}

package() {
 cd "${srcdir}/${pkgname}"
 python setup.py install --root=${pkgdir}
 install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
