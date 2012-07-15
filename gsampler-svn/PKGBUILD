# Maintainer: Lilian Monchalin <isaya07@users.sourceforge.net>

pkgname=gsampler-svn
pkgver=37
pkgrel=1
pkgdesc="Gsampler is a Linuxsampler Frontend"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/gsampler/"
license=('GPL3')
depends=('gtk3' 'linuxsampler' 'intltool' 'gdl')
#source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz)
#md5sums=('46faab64196418d0f828bd15d1e31a45')

_svntrunk=https://svn.code.sf.net/p/gsampler/code/trunk
_svnmod=gsampler

build() {
	cd ${srcdir}

	if [ -d ${_svnmod}-build ] ; then
		rm -rf ${_svnmod}-build
	fi

	if [ -d $_svnmod ] ; then
		(cd $_svnmod && svn update)
		msg "The local files are updated."
	else
		svn co ${_svntrunk} ${_svnmod}
	fi

	cp -rf ${_svnmod} ${_svnmod}-build

	cd ${_svnmod}-build

	./autogen.sh

	./configure --prefix=/usr

	make || return 1
}

package() {
	cd ${_svnmod}-build
  
	make DESTDIR=$pkgdir install || return 1
}
