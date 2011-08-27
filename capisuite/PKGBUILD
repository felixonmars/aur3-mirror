# Contributor: Richard Hillmann <sleeper@project0.de>

pkgname=capisuite
pkgver=0.4.5
pkgrel=4
pkgdesc="CapiSuite is an ISDN telecommunication suite providing easy to use telecommunication functions which can be controlled from Python scripts"
arch=(i686 x86_64)
url="http://capisuite.frankedata.de"
license="GPL"
depends=('capi4k-utils' 'python>=2.2' 'libtiff' 'ghostscript' 'sfftobmp')
optdepends=('sox: audio convertation support')
makedepends=('make' 'autoconf' 'automake')

source=(http://capisuite.frankedata.de/download.php/downloads.capisuite.frankedata.de/capisuite-$pkgver.tar.gz 
capisuite-$pkgver-as-needed.patch
capisuite-$pkgver-capi4linux_v3.diff
capisuite-$pkgver-date-header.patch
capisuite-$pkgver-gcc43.patch
capisuite-$pkgver-python25.patch
capisuite-$pkgver-sox.patch
capisuite-$pkgver-syntax.patch
capisuite-fax-compatibility.patch
capisuite.logrotated
capisuite.rcd
)

_prefix=/usr
_prefix_var=/var
_prefix_etc=/etc

build() {
	cd $startdir/src/
	msg "Patching Files"
	
	patch -p0 < $startdir/capisuite-$pkgver-capi4linux_v3.diff || return 1
	patch -p0 < $startdir/capisuite-$pkgver-sox.patch || return 1
	cd $pkgname-$pkgver

	patch -p0 < $startdir/capisuite-$pkgver-as-needed.patch || return 1
	patch -p0 < $startdir/capisuite-$pkgver-date-header.patch || return 1
	patch -p0 < $startdir/capisuite-$pkgver-gcc43.patch || return 1
	patch -p0 < $startdir/capisuite-$pkgver-python25.patch || return 1
	patch -p0 < $startdir/capisuite-$pkgver-syntax.patch || return 1
	patch -p0 < $startdir/capisuite-fax-compatibility.patch || return 1

	msg "Configure Package"
	  ./configure --prefix=${_prefix} --sysconfdir=${_prefix_etc} --localstatedir=${_prefix_var} || return 1
	msg "Make"
	  make || return 1
	msg "Make Install Package"
	  make DESTDIR=$pkgdir install || return 1
		
	  cd $pkgdir${_prefix_etc}/capisuite
	mkdir -p $pkgdir/etc/rc.d
	mkdir -p $pkgdir/etc/logrotate.d
	install -m755 $startdir/capisuite.rcd .
	install -m755 $startdir/capisuite.logrotated .
	
	etc_default_dir=/usr/local
	
	for config in *
	do
		cp $config $config.bak
		sed -e "s#${etc_default_dir}/etc/#${_prefix_etc}/#g" $config.bak > $config
	
		rm $config.bak
		cp $config $config.bak
	 
		sed -e "s#${etc_default_dir}/var/#${_prefix_var}/#g" $config.bak > $config
		rm $config.bak
		cp $config $config.bak
		sed -e "s#${etc_default_dir}/#${_prefix}/#g" $config.bak > $config
		rm $config.bak
	done

	mv capisuite.rcd $pkgdir/etc/rc.d/capisuite
	mv capisuite.logrotated $pkgdir/etc/logrotate.d/capisuite
}



md5sums=('2197c8650be74db8904c7e54ff43ab7b'
         '40035e4b742e2d4ca2464b0f9ced36f5'
         'ae0010a9739f9b1273dd9a679d43d913'
         '135be011248d6215905132143e6a7dab'
         '372cf42e7c88bebad6dfae0b8a312474'
         '601f62ad57944a1ff11c38a4a6c347a0'
         'f92a0bff3604c3ff49b6735f7b5061ee'
         'fc3af885567a818f9696c3c312a6680f'
         '63b5890053139f14a3d3baf78812e0bc'
         '139930c311efd876010020a9ff31d9d2'
         '3b0586945f143a3b30dfbcac552c989a')

