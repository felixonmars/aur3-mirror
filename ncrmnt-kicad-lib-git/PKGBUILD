# Contributor: CYB3R <dima@golovin.in>
# Maintainer: CYB3R <dima@golovin.in>

pkgname=ncrmnt-kicad-lib-git
pkgver=20121007
pkgrel=1
pkgdesc="Nercomancer's KiCad libraries"
arch=('any')
url="http://ncrmnt.org/"
license=('custom')
depends=('kicad')
makedepends=('git-core')
source=()

_gitroot="git://github.com/nekromant/nc-libs.git"
installdir="${pkgdir}/usr/share/kicad/"
  
build() {  
  msg "Connecting to GIT server..."
  if [[ -d $srcdir/$pkgname-$pkgver ]]; then
    cd $srcdir/$pkgname-$pkgver && git pull origin
  else
    git clone $_gitroot $srcdir/$pkgname-$pkgver
    cd $srcdir/$pkgname-$pkgver
  fi

  msg "GIT checkout done or server timeout"
}

package(){
  install -dm755 "${installdir}library/"
  install -Dm755 -t "${installdir}library/" ${srcdir}/${pkgname}-${pkgver}/*.lib
}
