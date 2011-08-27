#contributor Matías J. Rossi <matiasjrossi@gmail.com>
pkgname=phraktalus-examples
pkgver=0.8rc.r01
pkgrel=1
pkgdesc="Examples to be used with Phraktalus"
arch=('i686' 'x86_64')
license=('GPL')
url=(http://code.google.com/p/phraktalus)
source=('http://phraktalus.googlecode.com/files/phraktalus-examples-0.8rc.r01.tar.gz')
md5sums=('e2d478901f06dbffb8025ef0846734eb')
depends=('phraktalus')
build()
{
    mkdir -p ${startdir}/pkg/usr/share/apps/phraktalus
    cd ${startdir}/src
    mv Examples/ ${startdir}/pkg/usr/share/apps/phraktalus/Examples
}