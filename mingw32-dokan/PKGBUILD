# Maintainer: Alexandre Bique <bique.alexandre@gmail.com>
pkgname=mingw32-dokan
pkgver=0.6.0
pkgrel=2
pkgdesc="Dokan Library is similar to FUSE(Linux user mode file system) but works on Windows. (mingw32)"
url="http://dokan-dev.net/en/"
arch=('any')
license=('LGPL')
depends=('mingw32-runtime')
optdepends=()
makedepends=('mingw32-gcc' 'p7zip')
options=('!strip')
conflicts=()
replaces=()
backup=()
source=("http://dokan-dev.net/wp-content/uploads/DokanInstall_${pkgver}.exe")
md5sums=('51f684ffd81848224d1d92946ac9bc27')

build() {
  cd "${srcdir}"
  7z x -y ./DokanInstall_${pkgver}.exe
}

package() {
  cd "${srcdir}"
  mkdir -m 0755 -p "${pkgdir}"/usr/i486-mingw32/{include,lib,bin,share/dokan/samples/mirror}
  install -m0755 \$SYSDIR/drivers/dokan.sys "${pkgdir}"/usr/i486-mingw32/bin
  install -m0755 \$SYSDIR/dokan.dll "${pkgdir}"/usr/i486-mingw32/bin
  install -m0644 \$SHELL\[17\]/Dokan/DokanLibrary/dokan.h "${pkgdir}"/usr/i486-mingw32/include/
  install -m0644 \$SHELL\[17\]/Dokan/DokanLibrary/dokan.lib "${pkgdir}"/usr/i486-mingw32/lib/
  install -m0755 \$SHELL\[17\]/Dokan/DokanLibrary/{mounter,dokanctl}.exe "${pkgdir}"/usr/i486-mingw32/bin/
  install -m0644 \$SHELL\[17\]/Dokan/DokanLibrary/sample/mirror/mirror.c "${pkgdir}"/usr/i486-mingw32/share/dokan/samples/mirror/
}

# vim:set ts=2 sw=2 et:
