# Maintainer: Musikolo <musikolo {at} hotmail [dot] com>

packager=('Musikolo')
pkgname=eyasdp
pkgver=0.5.0
pkgdesc="Enhanced yaSDP(alternative ShutDown plasmoid)"
pkgrel=1
arch=(i686 x86_64)
url="http://kde-look.org/content/show.php?content=146530"
license=(GPL3)
groups=('kde' 'plasmoid')
makedepends=(cmake automoc4)
depends=(kdebase-workspace)
options=()
source=(http://kde-look.org/CONTENT/content-files/146530-${pkgname}-${pkgver}.tar.bz2)
md5sums=('222cd41618851af9f512d363006b93b2')
sha1sums=('d0a08e010762474c419fb166c9f68a701809d880')

build() {
  cd "${pkgname}-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
  make
  make DESTDIR=${pkgdir} install

  _licenses_dir="${pkgdir}`kde4-config --prefix`/share/licenses/${pkgname}"
  install -D AUTHORS ${_licenses_dir}/AUTHORS
  install -D ChangeLog ${_licenses_dir}/ChangeLog
  install -D COPYING ${_licenses_dir}/COPYING
  install -D TODO ${_licenses_dir}/TODO
}
