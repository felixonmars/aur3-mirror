# Maintainer: Josh VanderLinden <arch@cloudlery.com>
# Contributor: fcolista
# Contributor: hcar

pkgname=wmi-client
pkgver=1.3.14
pkgrel=1
pkgdesc="Linux WMI client"
arch=(any)
url="https://bitbucket.org/instarch/wmi-client/"
license=("GPL2")
depends=('gnutls' 'python')
makedepends=('licenses')

source=(
  "http://www.openvas.org/download/wmi/wmi-${pkgver}.tar.bz2"
  "python3.patch"
  "gnutls.patch"
  "pyinclude.patch"
  "samba-pidl.patch"
)

md5sums=('7c710d0593887412ac2da65364cc32b6'
         'af2cf917937b6c887a3f01a91bc7a10c'
         '9cb99d4540e7ca18ac3706edc75340ec'
         'c1d6acdb9f21384ea7743da0a44712a8'
         '9de58f9dc808e8efc6753f8c9004fdff')

build() {
  export ZENHOME="${pkgdir}/usr/local"
  cd "${srcdir}/wmi-${pkgver}"

  msg "Applying patches..."
  patch -Np0 -i ../gnutls.patch
  patch -Np0 -i ../python3.patch
  patch -p1 -i ../pyinclude.patch
  patch -p1 -i ../samba-pidl.patch

  #msg "Updating references to Python for Python 2"
  find "$srcdir" -type f -exec grep -sl '^#!/usr/bin/python$' {} \; | xargs sed -i 's|/usr/bin/python$|&2|'

  sed -i '/^pywmi-installed:/s/pywmi-build//' GNUmakefile

  msg "Compiling..."
  make build
}

package() {
  cd "${srcdir}/wmi-${pkgver}"
  make install

  install -D /usr/share/licenses/common/${license}/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
