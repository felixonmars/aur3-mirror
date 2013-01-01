# Maintainer: Perberos <perberos@gmail.com>
pkgname=mate-conf
pkgver=20130101
pkgrel=1
pkgdesc="A configuration database system"
url="https://github.com/mate-desktop/mate-conf"
arch=(i686 x86_64)
license=('LGPL')
depends=('mate-corba' 'libxml2' 'polkit' 'libldap' 'dbus-glib' 'gtk2')
makedepends=('git' 'pkgconfig' 'intltool' 'gtk-doc' 'gobject-introspection')
groups=('mate')
options=('!libtool')
install=mate-conf.install
source=(mateconf-merge-schema
        mateconfpkg)
md5sums=('e2e024e1a13a3554f7c5909c3751ed99'
         '894c998a6a7d9b84fbf99b4773a489fa')

_gitroot=git://github.com/mate-desktop/mate-conf.git
_gitname=mate-conf

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."


  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  # Python2 fix
  sed -i '1s|#!/usr/bin/env python$|&2|' gsettings/mateconf-gsettings-schema-convert

  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/MateConf \
    --localstatedir=/var \
    --disable-static \
    --enable-defaults-service --enable-gsettings-backend=no || return 1
  # --with-gtk=3.0
  make || return 1
}

package() {
  cd "$srcdir/$_gitname-build"

  make DESTDIR="${pkgdir}" install || return 1
  install -m755 -d "${pkgdir}/etc/mateconf/mateconf.xml.system" || return 1
  install -m755 "${srcdir}/mateconf-merge-schema" "${pkgdir}/usr/bin/" || return 1
  install -d -m755 "${pkgdir}/usr/sbin"
  install -m755 "${srcdir}/mateconfpkg" "${pkgdir}/usr/sbin/" || return 1
}
