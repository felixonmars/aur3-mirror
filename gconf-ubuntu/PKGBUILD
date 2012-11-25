# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Original Maintainer: Jan de Groot <jan@archlinux.org>

pkgname=gconf-ubuntu
_ubuntu_rel=0ubuntu5
pkgver=3.2.5
pkgrel=5
pkgdesc="A configuration database system"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('libxml2' 'polkit' 'libldap' 'dbus-glib' 'gtk3')
makedepends=('intltool' 'gtk-doc' 'gobject-introspection')
provides=("gconf=${pkgver}")
conflicts=('gconf')
options=('!libtool' 'emptydirs')
install=gconf.install
url="http://www.gnome.org"
source=("http://ftp.gnome.org/pub/gnome/sources/GConf/3.2/GConf-$pkgver.tar.xz"
        "https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname%-*}_${pkgver}-${_ubuntu_rel}.debian.tar.gz"
        'gconf-merge-schema'
        'gconfpkg'
        'gconf-reload.patch')
md5sums=('1b803eb4f8576c572d072692cf40c9d8'
         '8089a5c57abcae54a9a9edd313070c55'
         '240b473fa17b748fc9020caf372d936c'
         'b745f04b4121d8724c002b14a4c110b6'
         'cfcc8e15be7b8a48de4aa34336ff6090')

build() {
  cd "${srcdir}/GConf-${pkgver}"

  # Patch from Fedora - reloads gconf after installing schemas
  patch -Np1 -i "${srcdir}/gconf-reload.patch"

  # Python2 fix
  sed -i '1s|#!/usr/bin/env python$|&2|' gsettings/gsettings-schema-convert

  # Apply Ubuntu patches
  for i in $(cat "${srcdir}/debian/patches/series" | grep -v '#'); do
    patch -Np1 -i "${srcdir}/debian/patches/${i}"
  done

  # Add gmodule-2.0 to linker flags
  CFLAGS="${CFLAGS} $(pkg-config --libs gmodule-2.0)"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib/GConf \
    --disable-static \
    --enable-defaults-service \
    --with-gtk=3.0 \
    --disable-orbit

  make pkglibdir=/usr/lib/GConf ${MAKEFLAGS}
}

package() {
  cd "${srcdir}/GConf-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -dm755 "${pkgdir}/etc/gconf/gconf.xml.system"
  install -m755 "${srcdir}/gconf-merge-schema" "${pkgdir}/usr/bin/"
  install -Dm755 "${srcdir}/gconfpkg" "${pkgdir}/usr/sbin/gconfpkg"

  ## Install Ubuntu stuff ##

  # Create directories -> from gconf2-common.dirs
  install -dm755 "${pkgdir}/etc/gconf/2/"
  install -dm755 "${pkgdir}/etc/gconf/gconf.xml.mandatory/"
  install -dm755 "${pkgdir}/etc/gconf/gconf.xml.defaults/"
  install -dm755 "${pkgdir}/etc/gconf/gconf.xml.system/"
  install -dm755 "${pkgdir}/usr/share/gconf/defaults/"
  install -dm755 "${pkgdir}/usr/share/gconf/mandatory/"
  install -dm755 "${pkgdir}/usr/share/gconf/schemas/"
  install -dm755 "${pkgdir}/var/lib/gconf/defaults/"
  install -dm755 "${pkgdir}/var/lib/gconf/debian.defaults/"
  install -dm755 "${pkgdir}/var/lib/gconf/debian.mandatory/"

  # Install xinit file
  install -dm755 "${pkgdir}/etc/X11/xinit/xinitrc.d/"
  install -m755 "${srcdir}/debian/70gconfd_path-on-session" "${pkgdir}/etc/X11/xinit/xinitrc.d/"

  # Install configuration files
  install -dm755 "${pkgdir}/usr/share/gconf/"
  for i in "${srcdir}"/debian/default.path*; do
    install -m644 "${i}" "${pkgdir}/usr/share/gconf/"
  done
  install -dm755 "${pkgdir}/etc/gconf/2/"
  install -m644 "${pkgdir}/usr/share/gconf/default.path" "${pkgdir}/etc/gconf/2/path"

  # Install binaries
  install -dm755 "${pkgdir}/usr/sbin/"
  install -m755 "${srcdir}/debian/gconf-schemas" "${pkgdir}/usr/sbin/"
  # Python 2 fix
    sed -i 's|^\(#!.*python\)$|\12|g' "${pkgdir}/usr/sbin/gconf-schemas"
  install -dm755 "${pkgdir}/usr/bin/"
  install -m755 "${srcdir}/debian/update-gconf-defaults" "${pkgdir}/usr/bin/"
  # Python 2 fix
    sed -i 's|^\(#!.*python\)$|\12|g' "${pkgdir}/usr/bin/update-gconf-defaults"

  # Install manuals
  install -dm755 "${pkgdir}/usr/share/man/man8/"
  install -m644 "${srcdir}/debian/update-gconf-defaults.8" "${pkgdir}/usr/share/man/man8/"
}
