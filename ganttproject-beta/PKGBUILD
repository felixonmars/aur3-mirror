# Contributor: snorre jensen <snojen@gmail.com>
# Contributor: zertyz <zertyz@gmail.com>
# Original Author: David Fuhr <david.fuhr@web.de>
pkgname=ganttproject-beta
_pkgname=ganttproject
pkgver=2.6_rc3
pkgrel=1440
pkgdesc="GanttProject is a project scheduling application written in Java and featuring gantt chart, resource management, calendaring..."
arch=('i686' 'x86_64')
url="http://ganttproject.sourceforge.net/"
license="GPL"
depends=(java-runtime x-server)
makedepends=(unzip)
conflicts=(ganttproject)
replaces=()
backup=()
install=
source=(http://ganttproject.googlecode.com/files/$_pkgname-${pkgver/_/-}-r$pkgrel.zip ganttproject.desktop)
md5sums=('b1fe2056ede3f00cc6bc3e808d7b2a04'
         '3a3ca74b7440f22ca83b2fe89fb9d44d')

build() {
  rm $startdir/src/ganttproject-${pkgver/_/-}-r$pkgrel/ganttproject.bat

  mkdir -p $startdir/pkg/opt/
  mv $startdir/src/ganttproject-${pkgver/_/-}-r$pkgrel/ $startdir/pkg/opt/$_pkgname

  chmod 755 $startdir/pkg/opt/$_pkgname/ganttproject
#  install -D -m0755 $startdir/ganttproject.sh $startdir/pkg/etc/profile.d/ganttproject.sh
  install -D -m0644 $startdir/ganttproject.desktop $startdir/pkg/usr/share/applications/ganttproject.desktop
}
