# Maintainer: Ralf Matthes <webmaster@rmatthes.de>
# Contributor: Rodrigo Grumiche Silva <grumiche at integrityit dot com dot br>
# Contributor: nozog
# Contributor: davidhjelm
# Contributor: Ray Kohler <ataraxia937 at gmail dot com>
# Contributor: Nathan Owe < ndowens04 at gmail dot com>

_pkgname=poco
pkgname=poco-git
pkgver=1
pkgrel=1
pkgdesc="C++ class libraries for network-centric, portable applications, complete edition"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://www.pocoproject.org/"
license=('custom:boost')
depends=('unixodbc' 'libmariadbclient' 'openssl')
makedepends=('gcc' 'make' 'unixodbc' 'libmariadbclient' 'openssl' 'chrpath')
replaces=('poco')
source=('git+https://github.com/pocoproject/poco.git')
sha256sums=(SKIP)
build()
{
  cd "${srcdir}/${_pkgname}"
  ./configure --prefix=/usr --no-samples --no-tests
  make ODBCLIBDIR="/usr/lib"
}

package()
{
  cd "${srcdir}/${_pkgname}"
  make ODBCLIBDIR="/usr/lib" DESTDIR="${pkgdir}" install
  install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  # remove rpath information from binaries
  chrpath -d "${pkgdir}/usr/bin/cpspc"
  chrpath -d "${pkgdir}/usr/bin/cpspcd"
  chrpath -d "${pkgdir}/usr/bin/f2cpspd"
  chrpath -d "${pkgdir}/usr/bin/f2cpsp"
  # remove debugging libraries
  # rm "${pkgdir}/usr/lib/libPoco"*"d.so"*
}