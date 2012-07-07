# Maintainer: Viech

_name="netradiant"
pkgname="${_name}-bin32"
pkgver=20120705
pkgrel=1
pkgdesc="ioquake3 level map editor, game packs included"
arch=("i686")
url="http://ingar.satgnu.net/gtkradiant/index.html"
license=("GPL")
depends=("gtk2" "gtkglext" "libpng14" "expat" "libxml2" "zlib" "bzip2")
optdepends=("netradiant-tremulous: Netradiant support files for your Tremulous installation")
provides=("netradiant")
conflicts=("netradiant-git" "netradiant-svn")

source=("http://ingar.satgnu.net/gtkradiant/files/${_name}-$pkgver-ubuntu12-x86.tar.bz2"
        "${_name}.sh")

md5sums=('9cf85f07530c597e270bc744d95c5783'
         'a8c8f91d14c10934fd911ca2781ffcc6')

package() {
  mkdir -p ${pkgdir}/opt ${pkgdir}/usr/bin
  cp -r ${srcdir}/${_name}-${pkgver}-ubuntu12-x86 ${pkgdir}/opt/${_name}
  install -m 755 ${srcdir}/${_name}.sh ${pkgdir}/usr/bin/${_name}
}
