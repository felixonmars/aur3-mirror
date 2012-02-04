# Mantainer: William Díaz <wdiaz[at]archlinux[dot]us>

pkgname=cw
pkgver=1.0.16
pkgrel=1
pkgdesc="A non-intrusive ANSI color wrapper for common unix-based commands on GNU/linux."
url="http://sourceforge.net/projects/cwrapper/"
license=('GPL2')
arch=('i686' 'x86_64')
depends=()
makedepends=('patch')
install=cw.install
source=("http://cwrapper.sourceforge.net/${pkgname}-${pkgver}.tar.bz2"
        "${pkgname}.patch")
md5sums=('142a1e9a25abbb01c3b90091d0bf68fd'
         '5c54fab22fdb0601e6e4fb3fa87c435d')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  install -d ${pkgdir}/usr/bin \
             ${pkgdir}/usr/share/man/man1 \
             ${pkgdir}/usr/share/doc/cw

  msg "Patching Files"
  patch -Np1 -i ${srcdir}/${pkgname}.patch || return 1

  ./configure --prefix=/usr || return 1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install || return 1

  # Deleting the problematic files
  rm -R ${pkgdir}/usr/lib/${pkgname}/{file,gcc,g++,stat,du}

  cp CHANGES CONTRIB INSTALL README PLATFORM \
    ${pkgdir}/usr/share/doc/cw

  ln -sf /usr/bin/cw ${pkgdir}/usr/bin/cwe 
}
