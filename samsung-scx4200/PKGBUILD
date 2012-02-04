# Contributor: Alessio Bianchi <venator85@gmail.com>
# Fixed by RIPPERO <ripperoso@gmail.com>

pkgname=samsung-scx4200
pkgver=3.00.37
pkgrel=1
pkgdesc="Samsung SCX-4200 CUPS driver"
arch=('i686' 'x86_64')
depends=('cups' 'ghostscript')
license='custom:samsung'
url="http://www.samsung.com"
source=("http://downloadcenter.samsung.com/content/DR/200902/20090225140447171/UnifiedLinuxDriver.tar.gz")
md5sums=('37cf8a04456767be374520c24570be7d')

build() {
    cd $startdir/src/ || return 1
    # fix wrong modes in archive
    chmod u=rwX,g=rX cdroot -R
    chown root:root cdroot -R
    install -m 644 -D "$startdir/src/cdroot/Linux/noarch/at_opt/share/ppd/scx4200.ppd" \
    "$startdir/pkg/usr/share/cups/model/scx4200.ppd"
    if [ "$CARCH" = "x86_64" ]; then
        install -m 755 -D "$startdir/src/cdroot/Linux/x86_64/at_root/usr/lib64/cups/filter/rastertosamsungspl" \
        "$startdir/pkg/usr/lib/cups/filter/rastertosamsungspl"
    else
        install -m 755 -D "$startdir/src/cdroot/Linux/i386/at_root/usr/lib/cups/filter/rastertosamsungspl" \
        "$startdir/pkg/usr/lib/cups/filter/rastertosamsungspl"
    fi
}
