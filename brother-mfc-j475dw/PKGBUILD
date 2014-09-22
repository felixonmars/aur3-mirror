# Maintainer: watermelonjuice <watermelonjuice@users.noreply.github.com>

_model="j475dw"
pkgname="brother-mfc-$_model"
pkgver="3.0.0"
_cwver="3.0.0"
pkgrel=1
_revision=1
pkgdesc="LPR and CUPS driver for the Brother MFC-J475DW"
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
arch=('i686' 'x86_64')
license=('unknown')
install="brother-mfc-${_model}.install"
depends=('a2ps' 'lib32-gcc-libs')
makedepends=('perl' 'deb2targz')
source=("http://www.brother.com/pub/bsc/linux/dlf/mfc${_model}lpr-${pkgver}-${_revision}.i386.deb"
    "http://www.brother.com/pub/bsc/linux/dlf/mfc${_model}cupswrapper-${_cwver}-${_revision}.i386.deb")
md5sums=('c52b6c77187e635e781f7ad60914b5bc'
    '7f2a01c8377c740e7a8222b1edf3cfa8')

package() {
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

#package() {
#    cd $pkgdir
#}
