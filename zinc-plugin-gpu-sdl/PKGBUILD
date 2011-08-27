# Contributor: robb_force <robb_force@holybuffalo.net>

pkgname=zinc-plugin-gpu-sdl
_pkgname=zinc-emu
pkgver=1.18
pkgrel=1
pkgdesc="The P.E.Op.S. soft gpu plugin for the ZiNc emulator using SDL."
url="https://sourceforge.net/projects/peops/"
license=('custom:PEOPS License')
arch=('i686')
depends=('zinc-emu' 'sdl>=1.2.10')
makedepends=('nasm')
source=(http://downloads.sourceforge.net/sourceforge/peops/PeopsSoftGpu${pkgver%.*}${pkgver#*.}.zip)
md5sums=('8119d20b012c8e49f3f6a48607bde746')

build()
{
  # Enable SDL compile, fix version number and add ASM optimization
  cd ${startdir}/src/gpuPeopsSoft/src
  sed -e 's|include ./makes/mk.x11|#include ./makes/mk.x11|' \
    -e 's|#include ./makes/mk.fpse|include ./makes/mk.fpse|' \
    -i Makefile
  sed -e 's|NUMBER = 1.0.17|NUMBER = 1.0.18|' \
    -e 's|ASMFLAGS += -f elf|ASMFLAGS += -O9999 -f elf|' \
    -i makes/mk.fpse
  sed -e 's|CFLAGS = -g -Wall -fPIC -O4|CFLAGS += -g -Wall -fPIC|' \
    -i makes/plg.mk
  make release || return 1
  
  # Install the plugin, cfg file and license
  cd ${startdir}/src/gpuPeopsSoft
  install -d ${startdir}/pkg/usr/share/${_pkgname}/{cfg,plugins}
  install -m0755 libgpuPeopsSDL.so.1.0.18 ${startdir}/pkg/usr/share/${_pkgname}/plugins/
  install -m0644 gpuPeopsSoftX.cfg ${startdir}/pkg/usr/share/${_pkgname}/cfg/gpuSDL.cfg
  install -Dm644 src/license.txt $startdir/pkg/usr/share/licenses/custom/${pkgname}/license.txt
  cd ${startdir}/pkg/usr/share/${_pkgname}/plugins/
  ln -s libgpuPeopsSDL.so.1.0.18 libgpuSDL.so
}
