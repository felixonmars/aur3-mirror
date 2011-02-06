# Contributor: Jonathan Liu <net147@gmail.com>
# Contributor: Judd Vinet <jvinet@zeroflux.org>
pkgname=makedev
pkgver=3.23
pkgrel=2
pkgdesc="The ubiquitous MAKEDEV.sh script to create static device nodes"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://people.redhat.com/nalin/MAKEDEV/"
depends=('bash' 'glibc')
source=("http://people.redhat.com/nalin/MAKEDEV/MAKEDEV-${pkgver}-1.tar.gz")
md5sums=('554faf6cbc9a84e4bd58ccfa32d74e2f')

build() {
  cd "${srcdir}/MAKEDEV-${pkgver}"
  make || return 1
  make DESTDIR="${pkgdir}" install
  install -d -m755 "${pkgdir}/sbin"
  mv "${pkgdir}/dev/MAKEDEV" "${pkgdir}/sbin"
}

# vim:set ts=2 sw=2 et:
