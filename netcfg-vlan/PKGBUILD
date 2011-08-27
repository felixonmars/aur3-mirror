# Contributor: Christian Hesse <mail@earthworm.de>
pkgname=netcfg-vlan
pkgver=0.1.3
pkgrel=1
pkgdesc="VLAN support for netcfg2"
arch=(any)
url="http://code.schnouki.net/p/netcfg/"
license=('GPL')
depends=('netcfg>=2.5' 'iproute2')
source=('source.tar.bz2')

build() {
  cd $srcdir/files/

  for FILE in `find -type f`; do
    if file $FILE | grep -q executable; then
      install -D -m755 $FILE $pkgdir/$FILE
    else
      install -D -m644 $FILE $pkgdir/$FILE
    fi
  done
}

md5sums=('37247c1b79cb264bbf480b88c55c99db')
