# Contributor: zertyz <zertyz@gmail.com>
# Original Author: David Fuhr <david.fuhr@web.de>
pkgname=ganttproject-praha
pkgver=beta5
pkgrel=888
pkgdesc="GanttProject is a project scheduling application written in Java and featuring gantt chart, resource management, calendaring, ... This package builds the next version, 2.5, still in beta as of jan, 16, 2012."
arch=('i686' 'x86_64')
url="http://ganttproject.sourceforge.net/"
license="GPL"
depends=(java-runtime x-server)
makedepends=(unzip)
conflicts=()
replaces=()
backup=()
install=
source=(http://ganttproject.googlecode.com/files/$pkgname-$pkgver-r$pkgrel.zip ganttproject.desktop)
md5sums=('6b98385b5f030a27e8ee71a54679ca79'
         '61231a5841f801ffe0280cc2347ab760')

build() {
  rm $startdir/src/ganttproject.bat

  mkdir -p $startdir/pkg/opt/
  mv $startdir/src/ $startdir/pkg/opt/$pkgname

#  install -m0644 $startdir/*.png $startdir/pkg/opt/$pkgname
  chmod 755 $startdir/pkg/opt/$pkgname/ganttproject
#  install -D -m0755 $startdir/ganttproject.sh $startdir/pkg/etc/profile.d/ganttproject.sh
  install -D -m0644 $startdir/ganttproject.desktop $startdir/pkg/usr/share/applications/ganttproject.desktop
}
