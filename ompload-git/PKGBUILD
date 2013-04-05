# Contributor: FallenWizard <fallenwizard@archlinux.us>
# Contributor: vorenon <edelmann.manuel@gmail.com>
pkgname=ompload-git
pkgver=20130405
pkgrel=1
pkgdesc="Script to upload files to ompldr.org"
arch=("any")
url="http://ompldr.org"
license=('GPL')
depends=('ruby' 'curl')
makedepends=('git')
provides=('ompload')
conflicts=('ompload')
md5sums=('SKIP')
source=('git://git.omp.am/omploader.git')
_gitname="omploader"

package() {
  cd $_gitname
  install -D -m755 ompload ${pkgdir}/usr/bin/ompload
} 
