# Maintainer: Dan Serban
# Contributor: Fabien Valthier

pkgname=multiboot
pkgver=1.xxxx.latest
pkgrel=1
pkgdesc="Create multiboot USB keys"
arch=(i686 x86_64)
url=http://liveusb.info/dotclear/index.php
license=(GPLv3)
depends=(bash cabextract cdrkit cryptsetup dosfstools fuseiso gettext gksu gtkdialog hal hdparm imagemagick parted qemu rsync squashfs-tools syslinux unzip wmctrl xdotool xterm xz zenity)
optdepends=(grub2-bios)
makedepends=(lynx)
_filearch=i386
[ "${CARCH}" == "x86_64" ] && _filearch=amd64

build()
{
  # --- fatresize ---
  rm fatresize_*.deb 2>/dev/null || true
  _url=$(lynx -dump http://archive.ubuntu.com/ubuntu/pool/universe/f/fatresize/ | grep -o http.*/fatresize_.*${_filearch}\.deb | tail -1)
  wget ${_url}
  bsdtar -xf $(basename ${_url}) data.tar.gz
  bsdtar -xf data.tar.gz || true
  rm data.tar.gz

  # --- multisystem ---
  rm multisystem_*.deb 2>/dev/null || true
  _url=$(lynx -dump http://liveusb.info/multisystem/depot/dists/all/main/binary-i386/m/ | grep -o http.*deb | tail -1)
  wget ${_url}
  bsdtar -xf $(basename ${_url}) data.tar.gz
  bsdtar -xf data.tar.gz || true
  rm data.tar.gz

  cd "${srcdir}"/usr
  rm -rf share
  cd "${srcdir}"/usr/local
  mv bin share "${srcdir}"/usr/
  cd "${srcdir}"/usr
  rm -rf local
  mv sbin "${pkgdir}"/
  mkdir "${pkgdir}"/usr
  mv bin share "${pkgdir}"/usr/
  sed -i 's#cat /etc/group | grep ^adm#cat /etc/group | grep ^users#' "${pkgdir}"/usr/share/multisystem/gui_multisystem.sh
  sed -i 's#/usr/local/#/usr/#' "${pkgdir}"/usr/bin/multisystem
  sed -i 's#/usr/local/#/usr/#;s#\[fr_FR\]##' "${pkgdir}"/usr/share/applications/multisystem-liveusb.desktop
  sed -i 's#/usr/local/#/usr/#;s#\[fr_FR\]##' "${pkgdir}"/usr/share/applications/multisystem-vbox.desktop
  sed -i '/testlist=/d' "${pkgdir}"/usr/share/multisystem/gui_multisystem.sh
}

