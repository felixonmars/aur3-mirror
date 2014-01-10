# Maintainer: William Huba <williamhuba@gmail.com>

pkgname=manager-accounting
pkgver=14.1.9
pkgrel=1
pkgdesc="Manager is free accounting software for small business."
arch=(any)
url="http://www.manager.io"
license=('custom')
groups=()
depends=('mono'
         'gtk'
         'gtk-sharp-2'
         'webkit-sharp')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://cdn.manager.io/downloads/v14.1.9/Manager.deb"
        "LICENSE")
md5sums=('279db5cee05aef8e897c5f16c4761963'
         '418e82b8160c0d263eceea76035cb570')

package() {
  cd ${startdir}/src
  tar zxf data.tar.gz
  cp -rp usr $pkgdir
  cp -rp opt $pkgdir
}
