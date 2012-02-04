# Maintainer: Dan Serban

pkgname=libnotify1-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Send desktop notifications to a notification daemon"
arch=(i686 x86_64)
url=http://developer.gnome.org/libnotify/
license=(LGPL)
depends=(glib2 glibc dbus-glib gtk2)
_filearch=i386
[ "${CARCH}" == "x86_64" ] && _filearch=amd64
_libnotify1_ubu_ver=${pkgver}-2ubuntu1

build()
{
  _url_prefix="http://archive.ubuntu.com/ubuntu/pool/main"
  _file="libnotify1_${_libnotify1_ubu_ver}_${_filearch}.deb"
  wget "${_url_prefix}/libn/libnotify/${_file}"
  bsdtar -xf "${_file}" data.tar.gz
  bsdtar -xf data.tar.gz usr/lib/libnotify.so.1.2.3
  rm data.tar.gz
  mv usr/lib/libnotify.so.1.2.3 usr/lib/libnotify.so.1
}

package()
{
  mv usr "${pkgdir}"/
}

