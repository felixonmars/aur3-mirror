# Maintainer: msimav

pkgname=xkcd-browser
pkgver=12.08.4
pkgrel=1
pkgdesc="a simple way to browse through your favorite XKCD comics"
arch=('any')
url="https://launchpad.net/xkcd-browser"
license=('GPLv3')
depends=('gtk3' 'pango' 'glib2' 'gdk-pixbuf2' 'gwibber')
makedepends=('python2-distutils-extra')
install=$pkgname.install
source=("https://launchpad.net/${pkgname}/trunk/${pkgver}/+download/${pkgname}_${pkgver}.tar.gz")
md5sums=('f5ad71d0e01c63717fa05dc24e9dd362')

package() {
  cd ${pkgname}

  python2 setup.py install --root="$pkgdir/"

}
