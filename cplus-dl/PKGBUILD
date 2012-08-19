# Maintainer: Paul-Antoine Malezieux <mtroy.student@gmail.com>
# Contributor: Paul-Antoine Malezieux <mtroy.student@gmail.com>
pkgname=cplus-dl
pkgver=1
pkgrel=2
pkgdesc="Canalplus Downloader : Permet de telecharger toutes les videos et emissions du site de canal+ Par recherche d'id, de nom ou par regex avec choix de la qualité."
arch=(any)
url="http://www.intertools.net"
license=('BSD')
groups=
provides=
depends=('php>=4','rtmpdump')
makedepends=
install=
source=(http://pkg.intertools.net/$pkgname-$pkgver.tar.gz)
md5sums=('9f2f1e1f9510a055e892000c5ee7c7b7')

build() {
	echo "no compilation needed.."
}

package() {

  cd "${srcdir}/"

  install -v -D -m 0755 usr/bin/${pkgname} ${pkgdir}/usr/bin/${pkgname}

	#make INSTALL_ROOT="${pkgdir}" install
	#make DESTDIR="$pkgdir" install
  #chmod +x /usr/bin/$pkgname
}
