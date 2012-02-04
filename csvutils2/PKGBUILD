# Maintainer: Jan Krcmar <honza801@gmail.com>
# $Id $
pkgname=csvutils2
pkgver=2007.03.01
pkgrel=1
pkgdesc="These are a few utilities for working with CSV files. They are all written in Bourne shell and AWK."
url="http://lorance.freeshell.org/csvutils/"
source=('http://lorance.freeshell.org/csvutils/csvutils.tar.gz')
md5sums=('6bb57060cd3fcab412208203f8b7cecc')
license=('Public Domain')
arch=('any')

package() {
    cd ${srcdir}/csvutils
    install -D -m 755 csv2csv ${pkgdir}/usr/bin/csv2csv
    install -D -m 755 csv2html ${pkgdir}/usr/bin/csv2html
    install -D -m 755 csv2sc ${pkgdir}/usr/bin/csv2sc
    install -D -m 755 csv2sql ${pkgdir}/usr/bin/csv2sql
}

