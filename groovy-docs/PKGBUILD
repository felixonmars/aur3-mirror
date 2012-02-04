# Contributor: bruce <b_a_g99 (at) hotmail (dot) com>
pkgname=groovy-docs
pkgver=1.8.4
pkgrel=1
pkgdesc="Documentation for the Groovy programming language."
url="http://groovy.codehaus.org"
license="APACHE"
depends=()
arch=('x86_64' 'i686')
source=(http://dist.groovy.codehaus.org/distributions/$pkgname-$pkgver.zip)

_optdir="${pkgdir}/opt/groovy"

build() {
  cd "${srcdir}/groovy-${pkgver}" || return 1
  mkdir -p "${_optdir}" || return 1
  mv * "${_optdir}" || return 1
}

md5sums=('2707253f4cfdfa8eb55595e20c02e68b')
