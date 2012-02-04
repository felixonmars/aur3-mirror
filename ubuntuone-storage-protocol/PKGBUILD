# Maintainer: Leonid Selivanov <bravebug at gmail dot com>

pkgname=ubuntuone-storage-protocol
pkgver=2.99.1
pkgrel=1
pkgdesc="Python library for Ubuntu One file storage and sharing service"
arch=('i686' 'x86_64')
url="https://launchpad.net/ubuntuone-storage-protocol"
license=('GPL3')
groups=('ubuntuone')
depends=('protobuf-python>=2.0.3' 'python2>=2.7.1' 'python2<<2.8' 'python2-oauth>=1.0' 'python2-pyopenssl' 'pyxdg' 'twisted')
makedepends=('python2-distribute')
optdepends=()
provides=('ubuntuone-storage-protocol=$pkgver')
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://launchpad.net/$pkgname/stable-3-0/$pkgver/+download/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('597cc9ef3b2575a1f990deb7ac151641')

build() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root=$pkgdir/
}