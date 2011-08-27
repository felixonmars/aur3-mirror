# Maintainer: Karol Maciaszek <karol.maciaszek@gmail.com>
# Contributor: Karol Maciaszek <karol.maciaszek@gmail.com>
# Contributor: Cilyan Olowen <gaknar@gmail.com>
pkgname=acpi4asus
pkgver=0.41
pkgrel=1
pkgdesc="Support for extra features of ACPI-compatibile ASUS laptops" 
url="http://acpi4asus.sourceforge.net" 
license="GPL" 
arch=(i686 x86_64)
depends=() 
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('2b88f79ea714987189105193aff9a52f')

build() { 
    cd $startdir/src/${pkgname}-${pkgver}/asus_acpid
    make
    install -d $startdir/pkg/usr/bin
    install -m 755 asus_acpid $startdir/pkg/usr/bin
    install -d $startdir/pkg/usr/share/man/man8
    install -m 644 asus_acpid.8 $startdir/pkg/usr/share/man/man8
    install -d $startdir/pkg/usr/share/acpi4asus
    cp -r $startdir/src/${pkgname}-${pkgver}/samples $startdir/pkg/usr/share/acpi4asus
}

