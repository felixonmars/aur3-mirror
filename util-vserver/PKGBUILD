# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=util-vserver
pkgver=0.30.216
_pkgextra=pre3029
_tpack=${pkgver}_${_pkgextra}
#_tpack=${pkgver}
_realpkgver=${_tpack/_/-}
# Additional config options.
_gOpts="--enable-release --disable-internal-headers"
pkgrel=2
pkgdesc="Provides tools for kernels with the security context patch"
arch=('i686' 'x86_64')
url="http://savannah.nongnu.org/projects/util-vserver/"
license=('GPL2')
depends=('nss' 'python2')
makedepends=('autoconf2.13' 'automake1.10' 'iproute2' 'iptables' 'vconfig')
#source=("http://ftp.linux-vserver.org/pub/utils/util-vserver/${pkgname}-${_realpkgver}.tar.bz2")
source=("http://people.linux-vserver.org/~dhozac/t/uv-testing/${pkgname}-${_realpkgver}.tar.bz2"
        "python2.patch"
        "vserver-build-pacman.patch"
        "vserver-build.rpm.patch"
        'archbootstrap.patch')
md5sums=('e0775fe6ee9ce390be2be84c94eca4ab'
         '7f32376706c566a80648950a71f3aceb'
         '5d9f629c0859fb6efd98e848e0b3193c'
         'e7453251105ab2705783723f0ec3b8a1'
         'e30e20717b8ceb5192d68f7877ca5865')

build() {
  cd "${srcdir}/${pkgname}-${_realpkgver}"
  patch -Np1 -i "${srcdir}/python2.patch"
  patch -Np1 -i "${srcdir}/vserver-build-pacman.patch"
  patch -Np1 -i "${srcdir}/vserver-build.rpm.patch"
  patch -Np1 -i "${srcdir}/archbootstrap.patch"

  # msg "Running autoreconf..."
  aclocal-1.10 -I . -I m4 || return 1
  autoconf
  automake-1.10 Makefile distrib/Makefile || return 1
  msg "Continuing build()..."
  PYTHON=python2 ./configure ${_gOpts} --prefix=/usr --sysconfdir=/etc --with-initrddir=/etc/rc.d --localstatedir=/var --disable-dietlibc --with-crypto-api=nss
  make
}

package() {
  cd "${srcdir}/${pkgname}-${_realpkgver}"
  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" install-distribution
  # Move the v_* scripts out of the init dir, as Arch does not support SYSV style init scripts
  install -m755 -d "${pkgdir}/usr/libexec/vserver"
  mv "${pkgdir}/etc/rc.d"/v_* "${pkgdir}/usr/libexec/vserver"
}

# vim:set ts=2 sw=2 et:
