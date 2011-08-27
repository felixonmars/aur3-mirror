# Contributor: robb_force <robb_force@holybuffalo.net>

pkgname=zinc-emu
_pkgname=zinc
pkgver=1.1
pkgrel=1
pkgdesc="A command-line emulator of the ZN-1, ZN-2 and System 11 arcade hardware, which are modified Sony PlayStation hardware."
url="http://www.emuhype.com/index.phtml?s=zinc&ss=index"
license=('as-is')
arch=('i686')
depends=('libstdc++5')
install=zinc.install
source=(http://www.emuhype.com/files/${_pkgname}${pkgver%.*}${pkgver#*.}-lnx.tar.bz2 \
  zinc.sh zinc.cfg)
md5sums=('0c67bab63a330f47d9fb176dc495c6e8'
         '54b14e4c9b57c62653c165e4d86b36ff'
         '02213cf5b686c682f8dc15d69ee2d240')

build()
{
  cd ${startdir}/src/${_pkgname}
  
  # Install the libraries
  install -d ${startdir}/pkg/usr/lib/${pkgname}/
  install -m0755 {libs11player.so,libsoundznc.so} ${startdir}/pkg/usr/lib/${pkgname}/
  
  # Install the binary
  install -Dm0755 ${_pkgname} ${startdir}/pkg/usr/share/${pkgname}/${_pkgname}
  
  # Install the standard plugins and renderer.cfg
  install -d ${startdir}/pkg/usr/share/${pkgname}/plugins/
  install -m0755 {libcontrolznc.so,librendererznc.so} ${startdir}/pkg/usr/share/${pkgname}/plugins/
  install -Dm0644 renderer.cfg ${startdir}/pkg/usr/share/${pkgname}/cfg/renderer.cfg
  
  # Install the other files
  cd ${startdir}/src
  install -m0644 zinc.cfg ${startdir}/pkg/usr/share/${pkgname}/
  install -Dm0755 zinc.sh ${startdir}/pkg/usr/bin/${pkgname}
}
