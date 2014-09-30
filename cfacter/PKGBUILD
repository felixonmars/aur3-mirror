# Maintainer: Niels Abspoel <aboe76 (at) Gmail (dot) com>
pkgname=cfacter
pkgver=0.2.0
pkgrel=1
pkgdesc="Ruby module for collecting simple facts about a host operating system"
arch=(any)
url='http://puppetlabs.com/puppet/related-projects/cfacter'
license=('APACHE')
depends=('boost' 'yaml-cpp' 'gcc' 'openssl' 'libutil-linux')
builddepends=('gcc' 'cmake')
source=('https://github.com/puppetlabs/cfacter/archive/0.2.0.tar.gz'
        '.AURINFO')
provides=('cfacter')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake \
    -DCMAKE_VERBOSE_MAKEFILE=ON \
    -DCMAKE_INSTALL_PREFIX=/usr
  make DESTDIR=${pkgdir}
}
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install DESTDIR=${pkgdir}
}
sha256sums=('126fcb8151522fd6cfb7a070f86f0a0f2c9aea56328b79ed961fa912258fc857' SKIP)
