# Maintainer: Chris T.R. <chris.trr@gmail.com>

# Based on the package for the MFC-J265W by woegjiub <woegjiub@woegjiub.com>

pkgname="brother-mfc-j200"
pkgver="3.0.0_1"
pkgrel=1
_revision=1
pkgdesc="LPR and CUPS driver for the Brother MFC-J200"
url="http://support.brother.com/g/b/downloadlist.aspx?c=mx&lang=es&prod=mfcj200_all&os=128&flang=English"
arch=('i686' 'x86_64')
license=('http://support.brother.com/g/s/agreement/English_lpr/agree.html')
install='brother-mfc-j200.install'
if [ "$CARCH" = "x86_64" ]; then
	depends=('lib32-libstdc++5' 'tcsh' 'deb2targz' 'perl' 'a2ps')
else
	depends=('libstdc++5' 'tcsh' 'deb2targz' 'perl' 'a2ps')
fi
source=(
	"http://download.brother.com/welcome/dlf100919/mfcj200lpr-3.0.0-1.i386.deb"
	"http://download.brother.com/welcome/dlf100921/mfcj200cupswrapper-3.0.0-1.i386.deb"
)
md5sums=('fd00846b87d444af52a51fed4d1d8743'
         'f99926846b45979769f0b9aafc75acbf')

package() {
	deb2targz *.deb >/dev/null || return 1
	rm -f *.deb || return 1
	cd $srcdir || return 1
	[ -d "mfcj200" ] || (mkdir mfcj200 || return 1)
	for i in *.tar.gz;do tar xfz $i -C mfcj200;done || return 1
	cd mfcj200 || return 1
	cd opt/brother/Printers/mfcj200 || return 1
	perl -i -pe 's#/etc/init.d#/etc/rc.d#g' ./cupswrapper/cupswrappermfcj200 || return 1
	perl -i -pe 's#printcap\.local#printcap#g' ./inf/setupPrintcapij || return 1
	cp -rf $srcdir/mfcj200/usr/ $pkgdir/ || return 1
	cp -rf $srcdir/mfcj200/opt/ $pkgdir/ || return 1
}
