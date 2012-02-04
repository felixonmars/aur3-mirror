# Contributor: Juha-Matti Heikkala "Suolx" <jheikkal@gmail.com>
pkgname=myththeme-blue-abstract
pkgver=2009.10.18
pkgrel=2
pkgdesc="MythTV theme Blue Abstract"
arch=('i686' 'x86_64')
url="http://www.mythtv.org/wiki/Blue_Abstract_Theme"
source=('ftp://miroku.no-ip.com/blue-abstract-wide.2009.10.18.tar.bz2')
depends=('mythtv')
makedepends=(svn)
license=(GPL)
groups=(pvr)
options=()
md5sums=('e5ddc85d58b68c67589b49c8a4e91b99')

build() {

    mkdir -p ${startdir}/pkg/usr/share/mythtv/themes/
    cp -r ${srcdir}/blue-abstract-wide ${startdir}/pkg/usr/share/mythtv/themes/ 

}
