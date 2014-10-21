# Maintainer:   Lucky <archlinux@builds.lucky.li>

pkgname=bley
_pkgver=2.0.0
pkgver="${_pkgver/-/.}"
pkgrel=1
pkgdesc="Intelligent greylisting daemon for Postfix and Exim"
url="http://bley.mx"
license=("BSD")
arch=("any")
depends=("python2" "python2-ipaddr" "python2-publicsuffix" "python2-pydns" "python2-pyspf" "python2-twisted")
optdepends=("postfix: mail server (Message Transfer Agent)"
            "exim: mail server (Message Transfer Agent)"
            "sqlite: required for SQLite support"
            "python2-psycopg2: required for PostgreSQL support"
            "mysql-python: required for MySQL support"
            "python2-matplotlib: required for bleygraph")
makedepends=("python2-distribute")
source=("${url}/download/${pkgname}-${_pkgver}.tar.gz")
md5sums=("23b6e7aafe4a18a6080c0513ac8bb5ad")
sha1sums=("a2edfddf4fa19b844c79143a551f84fa898a000b")

build() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
