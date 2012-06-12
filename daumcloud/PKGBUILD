pkgname=('daumcloud')
pkgver=1.1.0.24
pkgrel=1
pkgdesc="daum cloud nautilus extension"
arch=('i686' 'x86_64')
url='http://cloud.daum.net'
license=('daum custom license (see copyright in control.tar.gz)')
#depends=(libatk1.0-0 (>= 1.20.0), libc6 (>= 2.4), libcairo2 (>= 1.6.0), libglib2.0-0 (>= 2.16.0), libgtk2.0-0 (>= 2.12.0), libnautilus-extension1 (>= 1:2.22.2), libpango1.0-0 (>= 1.20.1), openssl (>= 0.9.8))
source=("http://get.daum.net/cloud/daumcloud_${pkgver}.deb")
md5sums=('7ecf906459783eff88a709234dea59b1')
build() {
  cd "$srcdir"
  ar xv daumcloud_${pkgver}.deb
  tar -xvf data.tar.gz -C ${pkgdir}
}