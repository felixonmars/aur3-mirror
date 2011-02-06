# $Id: PKGBUILD, 2009/06/21$
# Maintainer: Maxime de Roucy <maxime.deroucy@gmail.com>
# Contributor: Maxime de Roucy <maxime.deroucy@gmail.com>
pkgname=gsplit
pkgver=1.1.1
pkgrel=1
pkgdesc="a GTK GUI for split, written in java"
arch=(i686 x86_64)
url="http://www.respawner.fr/gsplit/"
license=('GPL3')
depends=('java-runtime' 'java-gnome>=4.0.10' 'dbus-java>=2.5' 'libmatthew-java' 'gettext')
conflicts=('gsplit-svn')
source=("http://www.respawner.fr:3000/attachments/download/2/gsplit_${pkgver}.orig.tar.gz"
	'patch.gsplit'
	'patch2.gsplit')

md5sums=('e37f11af71ce92075bc9ac5666b0b0f0'
         '9901e6c2b7947720c39050127f1e286f'
         'e0591c42bacb0bb6dc074e386f077bf4')

build() {

	set -e

	cd "$startdir/src/gsplit-$pkgver"
	
	patch -p1 < $startdir/src/patch.gsplit

	patch -p1 < $startdir/src/patch2.gsplit

	chmod +x configure

	./configure prefix=$startdir/pkg/usr compiler=javac

	make

	make install

	sed -e "s#$startdir/pkg##g" ${startdir}/pkg/usr/bin/gsplit > temp
	cat temp > ${startdir}/pkg/usr/bin/gsplit
	rm temp
}
