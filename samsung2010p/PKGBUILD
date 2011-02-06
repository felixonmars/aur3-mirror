# Contributor: Jaroslaw Rosiek <philosoph@interia.pl>
pkgname=samsung2010p
pkgver=3.00.37
pkgrel=1
pkgdesc="Samsung ML-2010P CUPS driver"
arch=('i686')
license=('custom:samsung')
url="http://www.samsung.com"

source=("http://downloadcenter.samsung.com/content/DR/200902/20090225163328453/UnifiedLinuxDriver.tar.gz")

build() {
    cd $startdir/src/ || return 1

    # fix wrong modes in archive
    chmod u=rwX,g=rX cdroot -R
    chown root:root cdroot -R

    #mkdir -p "$startdir/pkg/usr/share/cups/model/"
    #mkdir -p "$startdir/pkg/usr/lib/cups/filter/"
    install -m 644 -D "$startdir/src/cdroot/Linux/noarch/at_opt/share/ppd/ML-2010spl2.ppd" \
      "$startdir/pkg/usr/share/cups/model/ML-2010spl2.ppd"
    install -m 755 -D "$startdir/src/cdroot/Linux/i386/at_root/usr/lib/cups/filter/rastertosamsungspl" \
      "$startdir/pkg/usr/lib/cups/filter/rastertosamsungspl"
}

md5sums=('37cf8a04456767be374520c24570be7d')
