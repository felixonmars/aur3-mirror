# Maintainer: Matthew Bauer <mjbauer95@gmail.com>

pkgname=snes-sdk
pkgver=67
pkgrel=1
pkgdesc="SNES-SDK is a C toolchain and libraries targeting 65816 systems, specifically the Super NES (aka Super Nintendo, Super Famicom). This will create .smc files."
url="http://code.google.com/p/snes-sdk"
arch=('i686' 'x86_64')
license=('GPL')
depends=()
provides=('wla_dx' 'tcc-65816')

_svntrunk=http://$pkgname.googlecode.com/svn/trunk/
_svnmod=$pkgname

build() {
	cd $startdir/src

	svn co $_svntrunk -r $pkgver $_svnmod

	cd $_svnmod

	export PREFIX=$pkgdir/opt/snes-sdk

	(cd wla_dx && make)
	(cd wla_dx/wlalink && make PREFIX=$PREFIX)
	(cd wla_dx/wlab && make)
	(cd tcc-65816 && ./configure --enable-cross --prefix=/opt/snes-sdk && make 816-tcc)
	(cd libs && make PREFIX=$PREFIX)

	mkdir -p $PREFIX/lib
	mkdir -p $PREFIX/include
	mkdir -p $PREFIX/bin
	cp -p libs/*.obj $PREFIX/lib
	cp -p libs/hdr.asm $PREFIX/include
	cp -p tcc-65816/include/* $PREFIX/include
	cp -p tcc-65816/816-tcc $PREFIX/bin
	install -m 755 tcc-65816/816-opt.py $PREFIX/bin/816-opt
	cp -p wla_dx/wla-65816 $PREFIX/bin
	cp -p wla_dx/wlalink/wlalink $PREFIX/bin
	cp -p wla_dx/wlab/wlab $PREFIX/bin

	mkdir -p $pkgdir/usr/bin
	ln -s /opt/snes-sdk/bin/wlalink /opt/snes-sdk/bin/wlab /opt/snes-sdk/bin/816-tcc /opt/snes-sdk/bin/wla-65816 $pkgdir/usr/bin 
}
