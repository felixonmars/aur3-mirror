# Maintainer: ktalog <thektalog@gmail.com>
# Maintainer: skunkos <rotter@archlinux.info>

pkgname=cinnamon-applet-weather
pkgver=1.9.14
pkgrel=2
pkgdesc="An applet for displaying local weather conditions in Cinnamon."
arch=('any')
url="https://github.com/mockturtl/cinnamon-weather/"
license=('GPL')
depends=('cinnamon' 'dconf' 'gettext' 'glib2')
install=$pkgname.install
source=("$pkgname.tar.gz::https://github.com/mockturtl/cinnamon-weather/archive/v$pkgver.tar.gz")
md5sums=('SKIP')

build() {
  cd ${srcdir}/cinnamon-weather-$pkgver*
	
  uuid="weather@mockturtl"
  cinnamon_dir="${pkgdir}/usr/share/cinnamon/applets/${uuid}"

  mkdir -p ${cinnamon_dir}
  mkdir -p ${cinnamon_dir}/po

  install -m0644 ./*.* ${cinnamon_dir}
  install -m0644 ./po/*.* ${cinnamon_dir}/po
}
