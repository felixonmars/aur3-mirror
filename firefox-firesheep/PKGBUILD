# Maintainer: grzech <grzech0@gmail.com>
pkgname='firefox-firesheep'
pkgver=1.5
pkgrel=8
_ffver=`pacman -Q firefox | cut -f2 -d\ | cut -f1 -d-`
pkgdesc="A Firefox extension that demonstrates HTTP session hijacking attacks"
arch=('i686' 'x86_64')
url='http://codebutler.github.com/firesheep/'
license=('GPL')
depends=('firefox>=6.0' 'libpcap' 'hal')
makedepends=('git' 'zip' 'unzip' 'boost')
provides=('firefox-firesheep')
install=firefox-firesheep.install
source=(linux-hal-info.vendor.diff)
md5sums=('145617887ffba073018071074a98bd7d')


#_gitname=firefox7
_gitname=master
_gitroot=https://github.com/codebutler/firesheep.git

build()
{
	#DIR=`pwd`

	DIR=${srcdir}

	cd ${srcdir}

	#_gitname=firefox7
	#_gitroot=https://github.com/codebutler/firesheep.git
	
	if [ ! -d ${_gitname} ];then
	    mkdir ${_gitname}
	fi
	cd ${_gitname}
	if [ -d .git ];then
	    git remote rm origin
	fi
	git init
	git remote add -t ${_gitname} -f origin ${_gitroot}
	git checkout ${_gitname}

	cd $DIR/${_gitname}/backend/deps
	#git clone https://github.com/ry/http-parser.git

	#_gitname=mnot
	_gitname=event_stream
	_gitroot=https://github.com/joyent/http-parser.git
	
	#mkdir http-parser
	cd http-parser
	if [ -d .git ];then
	    git remote rm origin
	fi
	git init
	git remote add -t ${_gitname} -f origin ${_gitroot}
	git checkout ${_gitname}

	#_gitname=firefox7
	_gitname=master
	
	cd $DIR/${_gitname}
	
	#if [ ! -f backend/src/linux_platform.cpp.orig ];then
	#    patch -Np1 -i ${srcdir}/linux-hal-info.vendor.diff
	#fi
	#
	cat xpi/install.rdf|sed s/"maxVersion>7.0.\*"/maxVersion\>8.0.*/ > xpi/install.rdf.new
	mv -f xpi/install.rdf.new xpi/install.rdf

	./autogen.sh

	./configure
	make clean
	make
}

package()
{
	cd ${srcdir}/${_gitname}/xpi
	#local emid=$(sed -n -e '/<\?em:id>\?/!d; s/.*\([\"{].*[}\"]\).*/\1/; s/\"//g; p; q' install.rdf)
	local emid=$(sed -n -e '/<\?em:id>\?/!d; s/.*<em:id>//; s/<\/em:id>.*//; p; q' install.rdf)

	cd ${srcdir}/${_gitname}/build
	mkdir -p ${pkgdir}/usr/lib/firefox-${_ffver}/extensions
	arch=`uname -m`
	if [ $arch == i686 ];then
	    ARCH=x86
	elif [ $arch == x86_64 ];then
	    ARCH=$arch
	fi
	#unzip ${srcdir}/${_gitname}/build/Firesheep-Linux_x86_64-gcc3.xpi -d ${pkgdir}/usr/lib/firefox-${_ffver}/extensions/$emid
	unzip ${srcdir}/${_gitname}/build/Firesheep-Linux_${ARCH}-gcc3.xpi -d ${pkgdir}/usr/lib/firefox-${_ffver}/extensions/$emid
}
