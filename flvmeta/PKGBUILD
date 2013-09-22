# Maintainer: Stéphane Marguet (Stemp) <smarguet@gmail.com>
# Contributor: Sébastien Luttringer <seblu@aur.archlinux.org>
# Contributor: Fedor Suchkov <f.suchkov@gmail.com>
# Contributor: Nathan O <ndowens.aur at gmail dot com>
pkgname=flvmeta
pkgver=1.1.2
pkgrel=1
pkgdesc='flvmeta is a command-line utility aimed at manipulating Adobe(tm) Flash Video files'
arch=('i686' 'x86_64')
url="https://github.com/noirotm/${pkgname}/"
license=('GPL2')
depends=('libyaml')
makedepends=('cmake')
changelog=ChangeLog
source=("https://github.com/noirotm/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('0a9d799d8dca0fa4a412f9adb82a08af')

build() {
  cd ${pkgname}-${pkgver}
  cmake . 
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}