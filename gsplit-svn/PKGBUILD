# $Id: PKGBUILD, 2009/02/22$
# Maintainer: Maxime de Roucy <maxime.deroucy@gmail.com>
# Contributor: Maxime de Roucy <maxime.deroucy@gmail.com>
pkgname=gsplit-svn
pkgver=200
pkgrel=2
pkgdesc="a GTK GUI for split, written in java"
arch=(i686 x86_64)
url="http://www.respawner.fr/gsplit/"
license=('GPL3')
provides=('gsplit')
conflicts=('gsplit')
depends=('java-runtime' 'java-gnome>=4.0.10' 'dbus-java>=2.5' 'libmatthew-java' 'gettext')
makedepends=('subversion')
source=('patch.gsplit'
	'patch2.gsplit')

md5sums=('9901e6c2b7947720c39050127f1e286f'
         'e0591c42bacb0bb6dc074e386f077bf4')

_svntrunk="http://www.respawner.fr/$pkgname/trunk/gsplit"
_svnmod="gsplit"

build() {

	set -e

	name=gsplit

	cd $startdir/src

	if [ -d $_svnmod/.svn ]; then
		svn up $_svnmod
	else
		svn co $_svntrunk $_svnmod
	fi
	
	cd $name
	
	patch -p1 < $startdir/src/patch.gsplit
	patch -p1 < $startdir/src/patch2.gsplit

	chmod +x configure

	./configure prefix=$startdir/pkg/usr compiler=javac

	make

	make install


	sed -e "s#$startdir/pkg##g" ${startdir}/pkg/usr/bin/gsplit > temp
	cat temp > ${startdir}/pkg/usr/bin/gsplit
	rm temp
	#cp -a "${startdir}/pkg/usr/bin/gsplit" temp
	#sed -e "s#$startdir/pkg##g" temp > $startdir/pkg/usr/bin/gsplit
	#rm temp
}
