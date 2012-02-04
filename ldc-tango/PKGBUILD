# author: MrSunshine
pkgname=ldc-tango
pkgver=796_4136
pkgrel=1
pkgdesc="A D Compiler based on the LLVM Compiler Infrastructure including D runtime and tango lib and imports"
arch=('i686' 'x86_64')
url="http://www.dsource.org/projects/ldc"
license=('BSD')
depends=('llvm-svn')
makedepends=('gcc' 'mercurial' 'cmake' 'subversion')
#provides=()
conflicts=('ldc-hg')
source=(ldc-hg.sh ldc.conf ldc.patch tango.patch)
#install=(${pkgname}.install)
md5sums=('3c07c991c3102b5c2f6f898c0e8a083f' '1b05911d155613b529ddcc3c1f4fc388' '75f2e069e94697399ee7780afabead5e') 

_hroot=http://hg.dsource.org/projects/ldc
_hgrepo=ldc
_hgrev=796
_strunk=http://svn.dsource.org/projects/tango/trunk
_svnmod=tango
_svnrev=4136

build() {
#	pkgver=${_hgrev}_${_svnrev}

	cd $srcdir
	if [ -d ${_hgrepo} ]; then
		cd ${startdir}/src/${_hgrepo}
		hg pull -r${_hgrev} -u
	else
		hg clone -r${_hgrev} ${_hroot}/${_hgrepo} || return 1
	fi

	cd $srcdir

	if [ -d ${_hgrepo}/${_svnmod} ]; then
		cd ${startdir}/src/${_hgrepo}/${_svnmod}
		svn up -r${_svnrev}
	else
		svn co ${_strunk} ${_hgrepo}/${_svnmod} -r${_svnrev} || return 1
	fi

	cd ${startdir}/src/${_hgrepo}
	
	cmake -DCMAKE_INSTALL_PREFIX=/opt/ldc .
	patch -p1 -t -N -i ${startdir}/ldc.patch
	make ldc	

	install -d -m755 $startdir/pkg/usr/bin

	cp $startdir/src/${_hgrepo}/bin/{ldc,ldc.conf} $startdir/pkg/usr/bin

	export PATH=$startdir/src/ldc/bin:$PATH

	make patch
	
	cp -r $startdir/src/ldc/runtime/internal/ldc $startdir/src/ldc/tango
	cp -r $startdir/src/ldc/runtime/import/ldc/* $startdir/src/ldc/tango/ldc

	make runtime

	cd tango
	patch -t -N -p0 -i $startdir/tango.patch
	cd lib
	./build-tango.sh --verbose ldc

	install -d -m755 $startdir/pkg/usr/include/d/tango

	cp -r $startdir/src/ldc/runtime/internal/ldc $startdir/pkg/usr/include/d/tango/
	cp -r $startdir/src/ldc/runtime/import/ldc/* $startdir/pkg/usr/include/d/tango/ldc
	cp -r $startdir/src/ldc/tango/{object.di,tango,std} $startdir/pkg/usr/include/d/tango

	install -d -m755 $startdir/pkg/usr/include/d/tango/lib

	cp -r $startdir/src/ldc/tango/lib/common $startdir/pkg/usr/include/d/tango/lib

	install -d -m755 $startdir/pkg/usr/lib/ldc

	cp $startdir/src/ldc/lib/libtango-ldc.a $startdir/pkg/usr/lib/ldc
	cp $startdir/src/ldc/tango/lib/libtango-user-ldc.a $startdir/pkg/usr/lib/ldc

	install -Dm755 $startdir/ldc-hg.sh $startdir/pkg/etc/profile.d/ldc-hg.sh
	cp $startdir/ldc.conf $startdir/pkg/usr/bin

	install -Dm755 $startdir/src/ldc/ldc-tango $startdir/pkg/etc/rebuild/ldc-posix-tango
}

