pkgname=("uvcvideo-dkms")
pkgver=r104
pkgrel=4
arch=('any')
pkgdesc="kernel module for uvcvideo driver"
url="http://mxhaard.free.fr/"
depends=('dkms')
license=('GPL')
conflicts=()
replaces=()
backup=()
source=("http://www.networkoffice123.tk/code/uvcvideo-${pkgver}-2.tar.gz")
groups=("system")
md5sums=('SKIP')
install=uvcvideo-dkms.install
optdepends=("linux-headers")

package() {
  cd "$srcdir/uvcvideo-${pkgver}"
  dkmsDst="${pkgdir}/usr/src/uvcvideo-${pkgver}/"
  mkdir -p "${dkmsDst}"
  cp -R . "${dkmsDst}"
}

# vim:set ts=2 sw=2 et:
