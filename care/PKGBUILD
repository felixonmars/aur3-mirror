# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Nicolas Cornu <ncornu@aldebaran-robotics.com>

pkgname=care
_pkgname=PRoot
pkgver=2.2
pkgrel=1
pkgdesc="chroot, mount --bind, and binfmt_misc without privilege/setup"
arch=('i686' 'x86_64')
url="https://github.com/cedric-vincent/PRoot"
license=('GPL')
provides=('care')
depends=('uthash' 'proot')
source=(https://github.com/cedric-vincent/$_pkgname/archive/$pkgname-v$pkgver.tar.gz)
sha1sums=('762b233e14c711ec4405d9cc456f7eb8184f975a')


build() {
  cd "${srcdir}"/${_pkgname}-${pkgname}-v${pkgver}/src

  # LC_ALL because we parse output of objcopy
  LC_ALL="en_US" CARE_BUILD_ENV=ok make -f GNUmakefile care
}

package() {
  cd "${srcdir}"/${_pkgname}-${pkgname}-v${pkgver}

  install -m755 -d "${pkgdir}"/usr/bin
  install -m755 src/${pkgname} "${pkgdir}"/usr/bin

  install -m755 -d "${pkgdir}"/usr/share/doc/care
  install -m644 doc/care-manual.txt "${pkgdir}"/usr/share/doc/care
}

# vim: ft=sh syn=sh et
