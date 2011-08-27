# Contributor: robb_force <robb_force@holybuffalo.net>

pkgname=zinc-plugin-gpu-xgl2
_pkgname=zinc-emu
pkgver=2.09
pkgrel=1
pkgdesc="Linux port of Pete's hardware accelerated OpenGL2 plugin for the ZiNc emulator."
url="http://www.pbernert.com/html/gpu.htm"
license=('custom')
arch=('i686')
depends=('zinc-emu' 'libgl')
source=(http://www.pbernert.com/gpupetexgl${pkgver%.*}${pkgver#*.}.tar.gz)
md5sums=('61bdad38a3a616bc000664de23d00c6e')

build()
{
  # Install the gpu plugin and config file
  cd ${startdir}/src
  install -d ${startdir}/pkg/usr/share/${_pkgname}/{cfg,plugins}
  install -m0755 libgpuPeteXGL2.so.2.0.9 ${startdir}/pkg/usr/share/${_pkgname}/plugins/
  install -m0644 gpuPeteXGL2.cfg ${startdir}/pkg/usr/share/${_pkgname}/cfg/gpuXGL2.cfg
  cd ${startdir}/pkg/usr/share/${_pkgname}/plugins/
  ln -s libgpuPeteXGL2.so.2.0.9 libgpuXGL2.so
}
