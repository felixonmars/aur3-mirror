# Maintainer: dk0r <dk0r.public@gmail.com>

model="9340cdw"
pkgname="brother-mfc-$model"
pkgver="1.1.2"
pkgrel=1
_revision=1
pkgdesc="LPR and CUPS driver for the Brother MFC-9340CDW"
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
arch=('i686' 'x86_64')
license='unknown'
install="brother-mfc-${model}.install"
depends=('tcsh' 'deb2targz' 'perl' 'a2ps')
source=("http://www.brother.com/pub/bsc/linux/dlf/mfc${model}lpr-${pkgver}-${_revision}.i386.deb"
    "http://www.brother.com/pub/bsc/linux/dlf/mfc${model}cupswrapper-${pkgver}-${_revision}.i386.deb")
md5sums=('16cb28c60af9afe863cb9676a586e65e'
    'f71cd8f8b80050f4b28118e68733a690')
package() {
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
