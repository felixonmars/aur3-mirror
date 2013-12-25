# Maintainer: perlawk
pkgname=gpmi
pkgver=0.9.3
pkgrel=1
pkgdesc="General Package/Module Interface. This library is intended to provide a simple intarface for your application to run modules and scripts."
url="http://repo.hu/projects/gpmi"
arch=('x86_64' 'i686')
license=('GPLv3')
install=
source=("http://repo.hu/projects/gpmi/releases/gpmi-0.9.3.tar.gz")
 
build() {
  cd "${srcdir}/${pkgver}"
	./configure --prefix=/usr --with_install_prefix="$pkgdir/usr" 
  make
}
 
package() {
  cd "${srcdir}/${pkgver}"
  make DESTDIR="${pkgdir}" install
}
md5sums=('49a17644f5ea235102e24f0d72cddfc3')
