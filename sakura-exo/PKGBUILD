# Maintainer: greygjhart <greygjhart@laposte.net>
pkgname=sakura-exo
progname=sakura
pkgver=2.4.2
pkgrel=2
pkgdesc="sakura terminal using your exo configured web browser instead of hard-coded firefox"
url="https://launchpad.net/sakura"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('vte' 'libxft' 'desktop-file-utils')
optdepends=()
makedepends=()
conflicts=('sakura')
replaces=('sakura')
backup=()
install=''
source=("http://launchpad.net/${progname}/trunk/${pkgver}/+download/${progname}-${pkgver}.tar.bz2"
        "sakura.c.patch")
md5sums=('46669519c77f7402b2de24cdefe251bb'
         '320eeb6bff295d94d44b5e0916ed3d2c')

build() {
  cd "${srcdir}/${progname}-${pkgver}"
	patch src/sakura.c < ../sakura.c.patch
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${progname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
