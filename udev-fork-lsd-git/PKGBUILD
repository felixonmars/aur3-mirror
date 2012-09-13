# $Id: 
# Maintainer: Jubei-Mitsuyoshi <jubei.house.of.five.masters@gmail.com>
# Contributor: Aline Freitas <aline@alinefreitas.com.br>
# Contributor: Ivailo Monev <xakepa10@gmail.com>

pkgname=udev-fork-lsd-git
pkgver=20120914
pkgrel=2
groups=('base')
arch=('i686' 'x86_64')
pkgdesc="The userspace dev tools (udev),part of the -lsd innitiative"
url="https://bitbucket.org/braindamaged/udev"
license=('GPL')
depends=('util-linux' 'glib2' 'kmod' 'hwids' 'bash' 'acl')
provides=('udev=189' 'udev-lsd' 'systemd' 'libsystemd' 'systemd-tools')
conflicts=('udev' 'udev-lsd' 'systemd' 'libsystemd' 'systemd-tools')
replaces=('udev' 'udev-lsd' 'systemd' 'libsystemd' 'systemd-tools')
makedepends=('gobject-introspection' 'gperf' 'libxslt')
options=(!makeflags !libtool)
install="${pkgname}.install"
backup=('etc/udev/udev.conf')
source=('initcpio-hooks-udev'
        'initcpio-install-udev')
backup=(etc/udev/udev.conf)
options=(!makeflags !libtool)
md5sums=('ab4efaf78685ee143fe615d4a45a2471'
         '0c5213d652fda1faff1312fdf36d66e2')
_gitroot=('https://bitbucket.org/braindamaged/udev.git')
_gitname=('udev')
         
build() {
  if [ -d "${_gitname}" ] ; then
    cd "${srcdir}/${_gitname}"
    msg2 "Updating local tree..."
    git pull origin master
  else
    cd "${srcdir}"
    msg2 "Cloning initial copy of ${_gitname}..."
    git clone "${_gitroot}" "${_gitname}"
    cd "${srcdir}/${_gitname}"
  fi

  msg2 "Cloning repository for build..."
  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  msg2 "Configuring sources..."
  ./autogen.sh
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --libexecdir=/usr/lib \
              --with-firmware-path=/usr/lib/firmware/updates:/lib/firmware/updates:/usr/lib/firmware:/lib/firmware \
              --with-usb-ids-path=/usr/share/hwdata/usb.ids \
              --with-pci-ids-path=/usr/share/hwdata/pci.ids

  msg2 "Compiling..."
  make
}


package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR=${pkgdir} install

  # install the mkinitpcio hook
  install -D -m644 ../initcpio-hooks-udev ${pkgdir}/usr/lib/initcpio/hooks/udev
  install -D -m644 ../initcpio-install-udev ${pkgdir}/usr/lib/initcpio/install/udev

  # the path to udevadm is hardcoded in some places
  install -d ${pkgdir}/sbin
  ln -s ../usr/bin/udevadm ${pkgdir}/sbin/udevadm

  # fix wrong path to /bin/sh
  sed -i -e 's#/usr/bin/sh#/bin/sh#g' $pkgdir/usr/lib/udev/keyboard-force-release.sh

  # Replace dialout/tape/cdrom group in rules with uucp/storage/optical group
  for i in $pkgdir/usr/lib/udev/rules.d/*.rules; do
    sed -i -e 's#GROUP="dialout"#GROUP="uucp"#g;
               s#GROUP="tape"#GROUP="storage"#g;
               s#GROUP="cdrom"#GROUP="optical"#g' $i
  done
}