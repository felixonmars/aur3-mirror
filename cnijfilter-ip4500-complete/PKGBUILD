# Contributor: Joffrey Tisseron <tisseron.joffrey@aliceadsl.fr>

pkgname=cnijfilter-ip4500-complete
pkgver=2.80
pkgrel=2
pkgdesc="Canon IJ Printer Driver for Pixma IP4500 series Inkjet Printers with cnijfilter-common files."
arch=('x86_64')
url="http://software.canon-europe.com/software/0028476.asp"
license=('custom')

depends=('cups' 'lib32-libpng12' 'lib32-e2fsprogs' 'lib32-gnutls'
         'lib32-heimdal' 'lib32-libcups' 'lib32-libgcrypt' 'lib32-libgpg-error'
         'lib32-libtasn1' 'lib32-openssl' 'lib32-popt' 'lib32-sqlite3')
makedepends=('rpmextract')

source=('http://files.canon-europe.com/files/soft28476/software/28476.tgz'
	'canonip4500.ppd.patch')
install=cnijfilter-ip4500.install
md5sums=('5daca73347d7db20920f4fdcd661c33c'
	'9378f8b1d4ff3992f3d87c7ebfe04502')

build() {
    mkdir ${pkgdir}/usr
    mkdir ${pkgdir}/usr/bin
    mkdir ${pkgdir}/usr/lib
    mkdir ${pkgdir}/usr/share

    cd ${srcdir}
    rm *.deb

    rpmextract.sh cnijfilter-common-${pkgver}-1.i386.rpm || return 1
    cp -r usr/local/bin ${pkgdir}/usr/
    cp -r usr/lib ${pkgdir}/usr/
    cp -r usr/share ${pkgdir}/usr/	
    rm -r usr

    rpmextract.sh cnijfilter-ip4500series-${pkgver}-1.i386.rpm || return 1
    cp -r usr/local/bin ${pkgdir}/usr/
    cp -r usr/lib ${pkgdir}/usr/
    cp -r usr/local/share ${pkgdir}/usr/
    
    mkdir ${pkgdir}/usr/share/cups
    mkdir ${pkgdir}/usr/share/cups/model
    
    cd usr/share/cups/model
    patch canonip4500.ppd ${startdir}/canonip4500.ppd.patch || return 1
    install -D canonip4500.ppd ${pkgdir}/usr/share/cups/model/canonip4500.ppd || return 1
}
 
