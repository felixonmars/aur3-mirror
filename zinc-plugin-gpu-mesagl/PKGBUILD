# Contributor: robb_force <robb_force@holybuffalo.net>

pkgname=zinc-plugin-gpu-mesagl
_pkgname=zinc-emu
pkgver=1.77
pkgrel=1
pkgdesc="Hardware accelerated MesaGL plugin for the ZiNc emulator."
url="http://www.pbernert.com/html/gpu.htm"
license=('custom')
arch=('i686')
depends=('zinc-emu' 'libgl')
source=(http://www.pbernert.com/gpupetemesagl${pkgver%.*}${pkgver#*.}.tar.gz)
md5sums=('c7eb768ebc499d43510c6f4b6b935dfa')

build()
{
  # Install the gpu plugin and config file
  cd ${startdir}/src
  install -d ${startdir}/pkg/usr/share/${_pkgname}/{cfg,plugins}
  install -m0755 libgpuPeteMesaGL.so.1.0.77 ${startdir}/pkg/usr/share/${_pkgname}/plugins/
  install -m0644 gpuPeteMesaGL.cfg ${startdir}/pkg/usr/share/${_pkgname}/cfg/gpuMesaGL.cfg
  cd ${startdir}/pkg/usr/share/${_pkgname}/plugins/
  ln -s libgpuPeteMesaGL.so.1.0.77 libgpuMesaGL.so
}
