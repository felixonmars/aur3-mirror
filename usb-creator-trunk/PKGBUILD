# Contributor: Helge W. Larsen <helge(a)helges.dk>
pkgname=usb-creator-trunk
pkgver=0.1.11
pkgrel=1
pkgdesc="Ubuntu Live USB Disk Creator. Simple utility to make bootable USB pendrives with an Ubuntu live ISO CD image."
arch=(i686 x86_64)
url="https://launchpad.net/usb-creator/"
license=('GPLv3')
depends=('dbus-python' 'gksu' 'gnome-python' 'gnome-vfs' 'parted' 'pygtk' 'syslinux' 'python-distutils-extra')
makedepends=('bzr')
conflicts=('usb-creator')
replaces=('usb-creator')
source=()
md5sums=()

build() {
  cd "${srcdir}"
  bzr branch lp:usb-creator && cd usb-creator || cd usb-creator && bzr merge || return 1
  
  python setup.py install --root=$pkgdir
  
  mkdir -p "${pkgdir}/usr/share/man/man8/" || return 1
  cp -drv man/usb-creator.8 "${pkgdir}/usr/share/man/man8/" || return 1
  
  mkdir -p "${pkgdir}/usr/share/pixmaps/" || return 1
  cp -drv desktop/usb-creator.png "${pkgdir}/usr/share/pixmaps/" || return 1

  mkdir -p "${pkgdir}/usr/share/usb-creator/" || return 1
  cp -drv gui/* scripts/* usbcreator "${pkgdir}/usr/share/usb-creator/" || return 1
}
