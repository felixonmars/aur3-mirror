# Contributor: Vitaliy Berdinskikh <skipper13@root.ua>
pkgname=gimpfx-foundry
pkgver=2.6_1
pkgrel=2
pkgdesc="Collection of Gimp scripts"
url="http://gimpfx-foundry.sourceforge.net/"
license="GPL"
arch=('i686' 'x86_64')
depends=('gimp')
source=(http://downloads.sourceforge.net/sourceforge/gimpfx-foundry/${pkgname}-${pkgver/_/-}.tar.gz)
md5sums=('72c01fe6ac0dd4ce3151d306113c01a7')
sha1sums=('ee4aa98c60bbf6a70ef1404c50cbd27530bf9597')

build() {
  cd $startdir/src

  mkdir -p $startdir/pkg/usr/share/gimp/2.0/scripts
  install -m644 *.scm $startdir/pkg/usr/share/gimp/2.0/scripts
}
