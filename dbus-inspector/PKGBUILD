# Contributor: Alessio Biancalana <dottorblaster@gmail.com>

pkgname=dbus-inspector
pkgver=0.2.1
pkgrel=2
pkgdesc="DBus-Inspector is a development tool to show the contents of the DBus message bus."
arch=('i686' 'x86_64')
url="http://www.vitavonni.de/projekte/dbus-inspector"
license=('GPL')
depends=('python2' 'dbus-python' 'pygtk')
makedepends=('python2')
source=("http://people.debian.org/~erich/$pkgname.tgz" "share.patch")
md5sums=('35ef57911898be8a876a5a65478b6673'
         '7a5121f518e37b1862d0084255def736')

build() {
  cd "$startdir/src/$pkgname"

  patch -p2 < "$startdir/share.patch"

  for i in "dbus-inspector" "dbusinspect.py"; do
    sed 's|^#!/usr/bin/python$|#!/usr/bin/python2|' -i "$i" || return 1
  done
}

package(){
  cd "$startdir/src/$pkgname"
  module_dir="`python2 -c "from distutils.sysconfig import get_python_lib; print get_python_lib()"`" || return 1

  install -dm755 "$pkgdir/usr/"{bin,share/dbus-inspector} || return 1
  install -dm755 "$pkgdir/$module_dir" || return 1

  install -m755 "dbus-inspector" "$pkgdir/usr/bin/" || return 1
  install -m644 "dbusinspect.py" "$pkgdir/$module_dir/" || return 1

  for i in "COPYING" "NEWS" "INSTALL" "dbus-inspector.glade"; do
    install -m644 "$i" "$pkgdir/usr/share/dbus-inspector/" || return 1
  done
}
