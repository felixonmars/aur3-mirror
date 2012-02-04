# Maintainer: zigiless or.zarchi <at> gmail.com
# Based on brother-mfc-j6510dw,brother-mfc-j265w packages from AUR

_model="j220"
pkgname="brother-mfc-$_model"
pkgver="1.1.1"
pkgrel=1
_revision=1
pkgdesc="LPR and CUPS driver for the Brother MFC-J220"
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
arch=('i686' 'x86_64')
license='unknown'
install="brother-mfc-${_model}.install"
depends=('tcsh' 'perl' 'a2ps')
source=("http://pub.brother.com/pub/com/bsc/linux/dlf/mfc${_model}lpr-${pkgver}-${_revision}.i386.deb"
    "http://pub.brother.com/pub/com/bsc/linux/dlf/mfc${_model}cupswrapper-${pkgver}-${_revision}.i386.deb")

build() {
    cd $srcdir || return 1
    [ -d "mfc${_model}" ] || (mkdir mfc${_model} || return 1)
    for i in *.deb; do
		ar xv $i || return 1
		tar xf data.tar.gz -C mfc${_model} || return 1
		rm -f data.tar.gz $i
	done
    cd mfc${_model} || return 1
    cd usr/local/Brother/Printer/mfc${_model} || return 1
    perl -i -pe 's#/etc/init.d#/etc/rc.d#g' ./cupswrapper/cupswrappermfc${_model} || return 1
    perl -i -pe 's#printcap\.local#printcap#g' ./inf/setupPrintcapij || return 1
    cp -rf $srcdir/mfc${_model}/usr/ $pkgdir/ || return 1
}
md5sums=('e51998335bb7ee32986fcb1a7dc0fafe'
         '3353b7428ae59484c2ed854778a489fa')