# Maintainer: Baurzhan Muftakhidinov <baurthefirst at gmail dot com>
pkgname=stardict-kk-ru
pkgver=2.4.2
pkgrel=1
pkgdesc="Kazakh -> Russian dictionary for Stardict"
arch=('any')
url=("http://stardict.org")
depends=('stardict')
license=('GPL')
source=('http://mail.kazgrid.kz/repo/stardict-kazrus.tar.bz2')
md5sums=('2bc21f4d905edea301caeef24108fb2f')

build() {

mkdir -p $startdir/pkg/usr/share/stardict/dic
install -m644 $startdir/src/dictd_www.dict.org_kazrus.dict.dz \
$startdir/src/dictd_www.dict.org_kazrus.idx \
$startdir/src/dictd_www.dict.org_kazrus.ifo \
$startdir/pkg/usr/share/stardict/dic/
}

