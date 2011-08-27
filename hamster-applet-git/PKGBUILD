# Maintainer: Matías Ribecky <dev@mribecky.com.ar>
# Contributor: Georg Vogetseder <georg.vogetseder@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

_real_pkgname=hamster-applet
pkgname="${_real_pkgname}-git"
pkgver=20101020
pkgrel=1
pkgdesc="GNOME time tracking applet"
arch=('i686' 'x86_64')
url="http://projecthamster.wordpress.com/"
license=('GPL')
depends=('python2' 'gnome-python>=2.28.0' 'python-pysqlite>=2.5.5' 'gnome-python-desktop>=2.28.0' 'dbus-python>=0.83.0' 'gnome-panel>=2.30.0' 'pyxdg>=0.19')
makedepends=('intltool' 'gnome-doc-utils>=0.20.0' 'gnome-common' 'git')
options=('!libtool' '!emptydirs')
conflicts=("$_real_pkgname")
provides=("$_real_pkgname")
groups=('gnome-extra')
install="hamster-applet.install"
source=()
md5sums=()

_gitroot="git://git.gnome.org/hamster-applet"
_gitname="hamster-applet"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server ..."

  if [ -d "$srcdir/$_gitname" ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting to build ..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$startdir/src/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  python2 ./waf configure build --prefix=/usr
  python2 ./waf install --destdir="${pkgdir}"

  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${_real_pkgname}.schemas" --domain hamster-applet ${pkgdir}/etc/gconf/schemas/*.schemas
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas

  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
         -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      $(find $pkgdir -name '*.py') \
      "${pkgdir}/usr/lib/hamster-applet/hamster-applet" \
      "${pkgdir}/usr/bin/hamster-cli" \
      "${pkgdir}/usr/bin/hamster-service" \
      "${pkgdir}/usr/bin/hamster-time-tracker"

} 
