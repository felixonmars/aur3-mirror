# Maintainer: Košava <kosava@archlinux.us>

pkgname=desktopcouch
pkgver=1.0.8
pkgrel=1
pkgdesc="A desktop implementation of couchdb"
arch=('any')
url="https://launchpad.net/desktopcouch"
license=('LGPL')
depends=('gnome-keyring' 'couchdb' 'gnome-python-desktop' 'python-couchdb' 'python-oauth-svn' 'pyxdg')
makedepends=('python-distutils-extra' 'setuptools')
source=(http://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('21d43fa1fc564f933a186610974620e1')

build() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}