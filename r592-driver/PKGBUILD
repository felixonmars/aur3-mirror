# Author:  Stunts <f.pinamartins@gmail.com>
# Contibutor: ianux <ianux@free.fr>

pkgname=r592-driver
pkgver=20110401
pkgrel=1
pkgdesc="A driver for the Ricoh r592 Memory Stick reader"
arch=(i686 x86_64)
license=('GPL2')
depends=(kernel26-headers)
makedepends=('git')
url="http://gitorious.org/ricoh-kernel/ricoh-kernel/trees/master"
source=()
install=${pkgname}.install

_gitroot=git://gitorious.org/ricoh-kernel/memstick/ricoh-kernel.git
_gitname=ricoh-kernel

build() {
  cd ${srcdir}/
  msg "Connecting to gitorious.org GIT server..."
  if [ -d $srcdir/$_gitname ] ; then
    pushd $_gitname && git pull origin && popd
    msg "The local files are updated."
  else
    git clone ${_gitroot}
  fi
  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  [ -d ${_gitname}-build ] && rm -rf ${_gitname}-build
  cp -r ${_gitname} ${_gitname}-build
  cd ${_gitname}-build/memstick
  find ${srcdir} -type f -name Makefile -exec sed -i 's/depmod -a//g' {} \;
  #find ${srcdir} -type f -name Makefile -exec sed -i 's/$(KERNELDIR)/$(DESTDIR)$(KERNELDIR)/g' {} \;
  make
}
package() {
  cd ${_gitname}-build/memstick
  install -d ${pkgdir}/lib/modules/$(uname -r)/updates
  install -D -m 644 ${srcdir}/${_gitname}-build/memstick/ms_block.ko ${pkgdir}/lib/modules/$(uname -r)/updates/ms_block.ko
  install -D -m 644 ${srcdir}/${_gitname}-build/memstick/r592.ko ${pkgdir}/lib/modules/$(uname -r)/updates/r592.ko
  install -d ${pkgdir}/usr/share/icons/hicolor
  cp -r ${srcdir}/${_gitname}-build/user/icons/hicolor ${pkgdir}/usr/share/icons/
  install -d ${pkgdir}/etc/udev/rules.d
  install -D -m 644 ${srcdir}/${_gitname}-build/user/95-udisks-cardreader.rules ${pkgdir}/etc/udev/rules.d/95-udisks-ms.rules
}
