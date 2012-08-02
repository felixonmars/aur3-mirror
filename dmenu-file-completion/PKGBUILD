# Maintainer: Thomas Dziedzic <gostrc at gmail>
# Based off of community/dmenu

pkgname=dmenu-file-completion
pkgver=4.5
pkgrel=1
pkgdesc='Dynamic X menu with tab file completion patch.'
url='http://www.suckless.org/programs/dmenu.html'
arch=('i686' 'x86_64')
license=('custom:MIT')
depends=('sh' 'libxinerama')
makedepends=('xineramaproto')
provides=('dmenu')
conflicts=('dmenu')
source=("http://dl.suckless.org/tools/dmenu-${pkgver}.tar.gz"
        'filecompletion.patch')
md5sums=('9c46169ed703732ec52ed946c27d84b4'
         '7d66c4422019f9993d1c94f883348d7f')
build() {
  cd dmenu-${pkgver}

  patch -N -i ${srcdir}/filecompletion.patch

  make \
    X11INC=/usr/include/X11 \
    X11LIB=/usr/lib/X11
}

package() {
  cd dmenu-${pkgver}

  make \
    PREFIX=/usr \
    DESTDIR=${pkgdir} \
    install

  #install license
  install -D -m644 LICENSE \
    ${pkgdir}/usr/share/licenses/dmenu-file-completion/LICENSE
}
