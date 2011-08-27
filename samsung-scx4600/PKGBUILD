# Contributor: RkG
# Based on samsung-scx4200 PKGBUILD by Alessio Bianchi and RIPPERO

pkgname=samsung-scx4600
pkgver=1.00
pkgrel=1
pkgdesc="Samsung SCX-4600 CUPS driver"
arch=('i686' 'x86_64')
depends=('cups' 'ghostscript')
license='custom:samsung'
url="http://www.samsung.com"
source=("http://downloadcenter.samsung.com/content/DR/200908/20090825170237375/UnifiedLinuxDriver_1.01.tar.gz")
md5sums=('920a02e9ee4c6ea130c0e2836057e89c')

build() {
    cd $startdir/src/ || return 1
    # fix wrong modes in archive
    chmod u=rwX,g=rX cdroot -R
    chown root:root cdroot -R
    install -m 644 -D "$startdir/src/cdroot/Linux/noarch/at_opt/share/ppd/scx4600.ppd" \
    "$startdir/pkg/usr/share/cups/model/scx4600.ppd"
    if [ "$CARCH" = "x86_64" ]; then
        install -m 755 -D "$startdir/src/cdroot/Linux/x86_64/at_root/usr/lib64/cups/filter/rastertosamsungspl" \
        "$startdir/pkg/usr/lib/cups/filter/rastertosamsungspl"
    else
        install -m 755 -D "$startdir/src/cdroot/Linux/i386/at_root/usr/lib/cups/filter/rastertosamsungspl" \
        "$startdir/pkg/usr/lib/cups/filter/rastertosamsungspl"
    fi
}
