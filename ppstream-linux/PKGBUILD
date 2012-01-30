# Contributor: figo1802 <figo1802@gmail.com>


pkgname='ppstream-linux'
pkgver='1.0.2'
pkgrel='3'
arch=('i686')
url='http://www.ppstream.com'
license=('unknown')
pkgdesc='PPStream for GNU/Linux'
provides=('ppstream')
conflicts=('ppstream')


depends=('mplayer' 'qt' 'codecs')
source=('http://download.ppstream.com/linux/PPStream.deb')
md5sums=('c5d02182e34f58edd65a03d0cf42fcef')

install=$pkgname.install
build() {
	cd $startdir/src/
      ar -xv PPStream.deb;
      tar -xvf data.tar.gz

	mv usr/ ${startdir}/pkg/ ;
	mv opt/ ${startdir}/pkg/ ;
	mv etc/ ${startdir}/pkg/ ;

	mkdir -p ${startdir}/pkg/usr/lib/;
	ln -s /opt/pps/lib/libemscore.so.0.1.1946 ${startdir}/pkg/usr/lib/libemscore.so.0;
	ln -s /opt/pps/lib/libemsnet.so.0.1.1946 ${startdir}/pkg/usr/lib/libemsnet.so.0;
}
