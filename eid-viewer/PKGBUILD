# Maintainer: Vianney le Clément <vleclement AT gmail·com>
# Contributor: Valère Monseur <valere DOT monseur AT ymail·com>
pkgname=eid-viewer
pkgver=4.0.4
pkgrel=1
pkgdesc="Viewer for Belgian Electronic Identity Card"
arch=(any)
url="http://eid.belgium.be/"
license=('LGPL3')
depends=('bash' 'java-runtime' 'pcsclite')
source=('http://eid.belgium.be/fr/binaries/eid-viewer-4.0.4-146.src_tcm226-178483.tgz')
md5sums=('c2ce4921e49abe7bdbedfaf05f78c170')
sha1sums=('ed8f9ca3ae78b5db06c6e9ec2849246d188c51aa')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install DESTDIR="$pkgdir"
}

# vim:set ts=2 sw=2 et:
