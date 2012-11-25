# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Georg Vogetseder <georg.vogetseder@gmail.com>
# Contributor: Pablo Recio <rikutheronin@gmail.com>

pkgname=hamster-standalone-git
pkgver=20121101
pkgrel=3
pkgdesc="GNOME time tracking standalone application without the applet"
arch=('any')
url="http://projecthamster.wordpress.com/"
license=('GPL')
depends=('python2-libgnome' 'python2-gconf' 'python2-gnomecanvas' 'dbus-python>=0.83.1' 'python2-wnck>=2.32' 'python2-pysqlite>=2.6.0' 'pyxdg')
makedepends=('intltool' 'gnome-doc-utils>=0.20.1' 'gnome-control-center')
options=('!libtool' '!emptydirs')
groups=('gnome-extra')
install=hamster-standalone-git.install
_gitroot='https://github.com/projecthamster/hamster.git'
_gitname='hamster'

build() {
  msg 'Connecting to git.freedesktop.org GIT server....'

  if [ -d $_gitname ] ; then
    pushd $_gitname
    git pull origin
    popd
    msg 'The local files are updated.'
  else
    git clone $_gitroot
  fi

  msg 'GIT checkout done or server timeout'

  cd "${srcdir}/hamster"
  sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2|" waf

  ./waf --prefix=/usr configure build
}

package() {
  cd "${srcdir}/hamster"

  ./waf install --destdir=${pkgdir} --libdir=/usr/lib \
      --libexecdir=/usr/lib/hamster-applet \
      --sysconfdir=/etc \
      --localstatedir=/var

  sed -i "s|#!/usr/bin/python$|#!/usr/bin/python2|" $pkgdir/usr/lib/hamster-applet/hamster-{service,windows-service}

  sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2|" \
    $pkgdir/usr/bin/hamster \
    $pkgdir/usr/lib/hamster-applet/hamster-applet \
    $pkgdir/usr/share/docky/helpers/hamster_control.py \
    $pkgdir/usr/share/dockmanager/scripts/hamster_control.py

  sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2|" $pkgdir/usr/bin/hamster

#install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
#gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/hamster-applet.schemas" --domain hamster-applet ${pkgdir}/etc/gconf/schemas/*.schemas
#rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
