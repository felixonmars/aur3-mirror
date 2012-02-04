# Maintainer: tobias <email@tobiasklare.de>
pkgname=bjfiltercupsi250
pkgver=2.3
pkgrel=1
pkgdesc="Bjfiltercups for canon i250"
url="http://www.canon.at/"
license="other"
arch=('i686')
depends=('cups')
makedepends=('rpm2targz-gentoo')

source=(http://de.software.canon-europe.com/files/soft20547/software/bjfiltercups-2.3-0.i386.rpm)
md5sums=('576c8e5ae3db4fe174206ba0695374dd')

build() {
 cd $startdir/src/
 rpm2targz bjfiltercups-2.3-0.i386.rpm
 tar -xf bjfiltercups-2.3-0.i386.tar.gz -C $startdir/pkg/
}
 
