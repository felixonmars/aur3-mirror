# $Id: PKGBUILD 159356 2012-05-22 12:46:15Z tomegun $
# Maintainer: Tom Gundersen <teg@jklm.no>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>
# Contributor: Aline Freitas <aline@alinefreitas.com.br>
# Contributor: Ivailo Monev <xakepa10@gmail.com>
 
pkgname=udev-lsd
pkgver=189
pkgrel=3
groups=('base' 'lsd')
arch=('i686' 'x86_64')
pkgdesc="The userspace dev tools (udev),part of the -lsd innitiative"
url="http://www.linuxfromscratch.org/lfs/view/development/chapter06/udev.html#contents-udev"
license=('GPL')
depends=('util-linux' 'glib2' 'kmod' 'hwids' 'bash' 'acl')
provides=('udev=189' 'udev-lsd' 'systemd' 'libsystemd' 'systemd-tools')
conflicts=('udev' 'udev-lsd' 'systemd' 'libsystemd' 'systemd-tools')
replaces=('udev' 'udev-lsd' 'systemd' 'libsystemd' 'systemd-tools')
makedepends=('gobject-introspection' 'gperf' 'libxslt')
options=(!makeflags !libtool)
install="${pkgname}.install"
backup=('etc/udev/udev.conf')
source=("http://www.freedesktop.org/software/systemd/systemd-${pkgver}.tar.xz"
         "http://anduin.linuxfromscratch.org/sources/other/udev-lfs-${pkgver}.tar.bz2"
        'initcpio-hooks-udev'
        'initcpio-install-udev'
        'udev.conf')
md5sums=('ac2eb313f5dce79622f60aac56bca66d'
         '2840cd8c5fa91617efd36123486a7ac5'
         'f4e835fa1c31cb322cb07e795b7d10c9'
         '848238b4e1a06e62d166f60817bd5551'
         '58e57f09f7dd100cd96b161d0e178fb6')
build() {
  cp -pr "${srcdir}/udev-lfs-${pkgver}" "${srcdir}/systemd-${pkgver}/"
  cd "${srcdir}/systemd-${pkgver}"

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --libexecdir=/usr/lib \
              --with-firmware-path=/usr/lib/firmware/updates:/lib/firmware/updates:/usr/lib/firmware:/lib/firmware \
              --with-usb-ids-path=/usr/share/hwdata/usb.ids \
              --with-pci-ids-path=/usr/share/hwdata/pci.ids
 
  make -f "udev-lfs-${pkgver}/Makefile.lfs"
}

package() {
  cd "${srcdir}/systemd-${pkgver}"
  make -f "udev-lfs-${pkgver}/Makefile.lfs" DESTDIR="${pkgdir}" install
 
  # install the mkinitpcio hook
  install -D -m644 "${srcdir}/initcpio-hooks-udev" "${pkgdir}/usr/lib/initcpio/hooks/udev"
  install -D -m644 "${srcdir}/initcpio-install-udev" "${pkgdir}/usr/lib/initcpio/install/udev"
 
  # install the udev.conf that is not provided by default
  install -D -m644 "${srcdir}/udev.conf" "${pkgdir}/etc/udev/udev.conf"
 
  # Replace dialout/tape/cdrom group in rules with uucp/storage/optical group
  for i in "${pkgdir}/lib/udev/rules.d/"*.rules; do
    sed -i -e 's#GROUP="dialout"#GROUP="uucp"#g;
               s#GROUP="tape"#GROUP="storage"#g;
               s#GROUP="cdrom"#GROUP="optical"#g' "${i}"
  done
  
  # lfs clock rules are not needed
  rm "${pkgdir}/etc/udev/rules.d/"*
}