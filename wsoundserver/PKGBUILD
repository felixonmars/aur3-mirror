pkgname=wsoundserver
pkgver=0.4.0
pkgrel=1
pkgdesc="allows windowmaker to play sound events"
url="http://largo.windowmaker.org/files.php#WSoundServer"
license=('custom')
install=wsoundserver.install
arch=('i686' 'x86_64')
depends=('libproplist' 'libdockapp' 'esd' 'windowmaker')
source=(http://ftp.de.debian.org/debian/pool/main/w/wsoundserver/wsoundserver_$pkgver.orig.tar.gz 
	info.patch
	WMSound
	wsoundserver.install)
md5sums=('af100367a491673663e3d5c3016d8e12'
         '07cb20c5c3bccbb5830b58d71bd0602d'
         '39e95f42108a5d406e704ae023321bb8'
         '4e21e6559e3935fbd64c1d8fe81fbcfc')

build() {
	cd $startdir/src/WSoundServer-$pkgver || return 1
	patch wslib/info.c ../info.patch || return 1
	./configure --prefix=/usr --with-incs-from="-I /usr/include/WINGs" --enable-esd || return 1
	make || return 1
	make DESTDIR=$startdir/pkg install || return 1
        rm $startdir/pkg/usr/lib/libwsound.la || return 1   
        mkdir -p $startdir/pkg/usr/share/licenses/wsoundserver || return 1
	cp COPYING $startdir/pkg/usr/share/licenses/wsoundserver || return 1
	mkdir -p $startdir/pkg/etc/wsoundserver || return 1
	cp $startdir/src/WMSound $startdir/pkg/etc/wsoundserver || return 1
}
