# Contributor: Sven Salzwedel <sven_salzwedel@web.de>
# Maintainer: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=coverfinder
pkgver=0.2.1
pkgrel=3
pkgdesc='Find and download cover images from Amazon'
arch=('i686' 'x86_64')
url='http://linux.softpedia.com/get/Utilities/CoverFinder-30328.shtml'
license=('GPL')
depends=('gtk2' 'gvfs')
options=('strip')
install='coverfinder.install'
source=("http://repository.slacky.eu/slackware-12.2/multimedia/${pkgname}/${pkgver}/src/${pkgname}-${pkgver}.tar.gz")
md5sums=('b91082c06b76f377e7ac54432abc70f7')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}
package(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
