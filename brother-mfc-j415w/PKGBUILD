# Maintainer: Clement zotti <clement.zotti@sfr.fr>

pkgname="brother-mfc-j415w"
pkgver="1.1.3"
pkgrel=1
_revision=1
pkgdesc="LPR and CUPS driver for the Brother MFC-J415W. This package is based off the MFC-J265W, all credit is for woegjiub"
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
arch=('i686' 'x86_64')
license=('unknown')
install='brother-mfc-j415w.install'
depends=('lib32-libstdc++5' 'tcsh' 'deb2targz' 'perl' 'a2ps')
source=(
	"http://www.brother.com/pub/bsc/linux/dlf/mfcj415wlpr-1.1.3-1.i386.deb"
	"http://www.brother.com/pub/bsc/linux/dlf/mfcj415wcupswrapper-1.1.3-1.i386.deb"
)
md5sums=('f27618d74194c2d31fb392aa17b33ee6'
         '259db682c2751c87feccdd84ef876db4')

package() {
	deb2targz *.deb >/dev/null || return 1
	rm -f *.deb || return 1
	cd $srcdir || return 1
	[ -d "mfcj415w" ] || (mkdir mfcj415w || return 1)
	for i in *.tar.gz;do tar xfz $i -C mfcj415w;done || return 1
	cd mfcj415w || return 1
	cd opt/brother/Printers/mfcj415w || return 1
	perl -i -pe 's#/etc/init.d#/etc/rc.d#g' ./cupswrapper/cupswrappermfcj415w || return 1
	perl -i -pe 's#printcap\.local#printcap#g' ./inf/setupPrintcapij || return 1
	cp -rf $srcdir/mfcj415w/usr/ $pkgdir/ || return 1
	cp -rf $srcdir/mfcj415w/opt/ $pkgdir/ || return 1
}
