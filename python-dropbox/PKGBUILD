# Maintainer: Andrey Mivrenik <gim at fastmail dot fm>
pkgname=python-dropbox
pkgver=2.2.0
pkgrel=1
pkgdesc="Python SDK for Dropbox Core APIs"
arch=('any')
url="https://www.dropbox.com/developers/core/sdks/python"
license=('MIT')
depends=('python' 'python-urllib3')
makedepends=('python-setuptools')
replaces=('python-dropbox-sdk')
conflicts=('python-dropbox-sdk')
source=("https://www.dropbox.com/developers/downloads/sdks/core/python/dropbox-python-sdk-$pkgver.zip")
sha256sums=('7886c816fddbda6fa0ee707e6f30b1be8b5b2c4298385edceed01e9d5d98c43a')

build() {
  msg "Starting build"
  cd "$srcdir/dropbox-python-sdk-$pkgver"
  python setup.py build
}
package() {
  msg "Running setup"
  cd "$srcdir/dropbox-python-sdk-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
  
  msg "Adding license file"
  licensedir=$pkgdir/usr/share/licenses/$pkgname/
  install -d $licensedir
  cp -ra $srcdir/dropbox-python-sdk-$pkgver/LICENSE* $licensedir
}
