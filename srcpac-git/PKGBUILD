# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Anthony Garcia <myfirstname@home[thekernelwelove].net>

pkgname=srcpac-git
pkgver=0.10.9.8.ga61baa2
pkgrel=1
pkgdesc="The pacman from-source wrapper"
arch=('any')
url="http://projects.archlinux.org/srcpac.git/"
license=('GPL3')
depends=('bash' 'pacman' 'abs')
makedepends=('git')
provides=('srcpac')
conflicts=('srcpac')
backup=('etc/srcpac.conf')
source=('git://projects.archlinux.org/srcpac')
md5sums=('SKIP')

pkgver() {
  cd srcpac
  git describe --always | sed 's|-|.|g'
}

package() {
  cd srcpac
  make DESTDIR="$pkgdir" install
} 
