# Maintainer: chol <chol at localhosted dot net>

pkgname=haveged
pkgver=1.4
_r_ver=1.4
pkgrel=2
pkgdesc="A simple entropy daemon."
arch=('i686' 'x86_64')
url="http://www.issihosts.com/haveged"
license=('GPL')
source=(${url}/${pkgname}-${pkgver}.tar.gz haveged)
md5sums=('39a03d4b8a4225706f78dbef3f623b0e'
	'6478347e8c246ee89a8db4fc37a858f9')

build() {
  cd "${srcdir}"/${pkgname}-${_r_ver}
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${_r_ver}
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/etc/init.d
  cd "${srcdir}"
  install -D -m755 haveged "${pkgdir}"/etc/rc.d/haveged
}
