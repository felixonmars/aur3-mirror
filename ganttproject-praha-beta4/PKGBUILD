# Contributor: zertyz <zertyz@gmail.com>
# Original Author: David Fuhr <david.fuhr@web.de>
pkgname=ganttproject-praha-beta4
pkgver=2.5
pkgrel=823
pkgdesc="GanttProject is a project scheduling application written in Java and featuring gantt chart, resource management, calendaring, ... This package builds the next version, 2.5, still in beta as of jan, 9, 2012."
arch=('i686' 'x86_64')
url="http://ganttproject.sourceforge.net/"
license="GPL"
depends=(java-runtime x-server)
makedepends=(unzip)
conflicts=()
replaces=()
backup=()
install=
source=(http://ganttproject.googlecode.com/files/$pkgname-r$pkgrel.zip ganttproject ganttproject.desktop ganttproject.sh ganttproject16.png ganttproject32.png ganttproject64.png ganttproject96.png)
md5sums=('8d91eec15667bf091b40134521449921'
         '1b91c5d3c589b02adc51147c05a39229'
         '88854c7f0ab5dafa425486cff2c83fcb'
         'd6ebfafb0e54d5880599175133d11067'
         '3ad8264b0d0b04ac9195bd79192347cf'
         'e141ccf49e26955b2695ca98d9f85436'
         'f67556d58dfbbc4770feb913aed6ea95'
         'c29c53a1cc807f35c093adc44731dbe0')

build() {
  rm $startdir/src/ganttproject.bat

  mkdir -p $startdir/pkg/opt/
  mv $startdir/src/ $startdir/pkg/opt/$pkgname

  install -m0644 $startdir/*.png $startdir/pkg/opt/$pkgname
  install -D -m0755 $startdir/ganttproject $startdir/pkg/opt/$pkgname/bin/ganttproject
  install -D -m0755 $startdir/ganttproject.sh $startdir/pkg/etc/profile.d/ganttproject.sh
  install -D -m0644 $startdir/ganttproject.desktop $startdir/pkg/usr/share/applications/ganttproject.desktop
}
