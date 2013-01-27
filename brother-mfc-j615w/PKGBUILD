# Maintainer: Mauricio Allende
# Based on brother-mfc-j625dw package from AUR

_model="j615w"
pkgname="brother-mfc-$_model"
pkgver="1.1.3"
pkgrel=1
_revision=1
pkgdesc="LPR and CUPS driver for the Brother MFC-J615W"
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
arch=('i686' 'x86_64')
license='unknown'
install="brother-mfc-${_model}.install"
depends=('tcsh' 'deb2targz' 'perl' 'a2ps')
if test "$CARCH" == x86_64; then
   depends+=(lib32-glibc)
fi
source=("http://www.brother.com/pub/bsc/linux/dlf/mfc${_model}lpr-${pkgver}-${_revision}.i386.deb"
    "http://www.brother.com/pub/bsc/linux/dlf/mfc${_model}cupswrapper-${pkgver}-${_revision}.i386.deb")

build() {
    deb2targz *.deb >/dev/null || return 1
    rm -f *.deb || return 1
    cd $srcdir || return 1
    [ -d "mfc${_model}" ] || (mkdir mfc${_model} || return 1)
    for i in *.tar.gz;do tar xfz $i -C mfc${_model};done || return 1
    cd mfc${_model} || return 1
    cd opt/brother/Printers/mfc${_model} || return 1
    perl -i -pe 's#/etc/init.d#/etc/rc.d#g' ./cupswrapper/cupswrappermfc${_model} || return 1
    perl -i -pe 's#printcap\.local#printcap#g' $srcdir/mfc${_model}/opt/brother/Printers/mfc${_model}/inf/setupPrintcapij || return 1
    cp -rf $srcdir/mfc${_model}/usr/ $pkgdir/ || return 1
    cp -rf $srcdir/mfc${_model}/opt/ $pkgdir/ || return 1
}
md5sums=('ee2c90a9bea0ac82ba89323b3deb919d'
         '9469f3709a0e671489c1821e49bf83ee')