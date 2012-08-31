# Maintainer: msimav

pkgname=discvur
pkgver=12.07.5
pkgrel=1
pkgdesc="a simple Imgur viewer"
arch=('any')
url="https://launchpad.net/discvur"
license=('GPLv3')
depends=('gtk3' 'python2-xdg' 'glib2' 'gdk-pixbuf2' 'gwibber' 'imagemagick')
makedepends=('python2-distutils-extra')
install=$pkgname.install
source=("https://launchpad.net/${pkgname}/trunk/${pkgver}/+download/${pkgname}_${pkgver}.tar.gz")
md5sums=('e0af6b59105e792cdf531c7341c962fc')

package() {
  cd ${pkgname}
  
  python2 setup.py install --root="$pkgdir/"
  
}
