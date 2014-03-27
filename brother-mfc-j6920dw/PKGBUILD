# Maintainer: Michał '2M1R' Różański <michal.rozanski@gmail.com>

model="j6920dw"
pkgname="brother-mfc-$model"
pkgver="3.0.0"
pkgrel=1
_revision=1
pkgdesc="LPR and CUPS driver for the Brother MFC-J6920DW (Based on the brother-mfc-j6910dw package, all credit goes to dk0r)"
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
arch=('i686' 'x86_64')
license='unknown'
install="brother-mfc-${model}.install"
depends=('tcsh' 'deb2targz' 'perl' 'a2ps')
source=("http://www.brother.com/pub/bsc/linux/dlf/mfc${model}lpr-${pkgver}-${_revision}.i386.deb"
    "http://www.brother.com/pub/bsc/linux/dlf/mfc${model}cupswrapper-${pkgver}-${_revision}.i386.deb")
md5sums=('c030aa27465a1737b0bdc039d93dd965'
         '5a661e2941d65633d6c6b7b26b706f54')

build() {
    deb2targz *.deb >/dev/null || return 1
    rm -f *.deb || return 1
    cd $srcdir || return 1
    [ -d "mfc${model}" ] || (mkdir mfc${model} || return 1)
    for i in *.tar.gz;do tar xfz $i -C mfc${model};done || return 1
    cd mfc${model} || return 1
    cd opt/brother/Printers/mfc${model} || return 1
    perl -i -pe 's#/etc/init.d#/etc/rc.d#g' ./cupswrapper/cupswrappermfc${model} || return 1
    perl -i -pe 's#printcap\.local#printcap#g' $srcdir/mfc${model}/opt/brother/Printers/mfc${model}/inf/setupPrintcapij || return 1
    cp -rf $srcdir/mfc${model}/usr/ $pkgdir/ || return 1
    cp -rf $srcdir/mfc${model}/opt/ $pkgdir/ || return 1
}
