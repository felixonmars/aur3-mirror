# Maintainer: Gabriel Ebner <gebner@gebner.org>
pkgname=compiz-cms-git
pkgver=0.5.r1.g6d924c4
pkgrel=1
pkgdesc="Color management plugin for compiz"
arch=('x86_64')
url="https://github.com/gebner/compiz-cms"
license=('GPL2')
depends=('compiz-ubuntu' 'lcms' 'colord')
makedepends=('cmake' 'boost')
install=compiz-cms.install
source=("$pkgname::git+https://github.com/gebner/compiz-cms.git")
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  mkdir build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCOMPIZ_PLUGIN_INSTALL_TYPE=package \
    -DCOMPIZ_PACKAGING_ENABLED=true \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_GSETTINGS=true \
    -DCOMPIZ_DISABLE_SCHEMAS_INSTALL=true \
    ..
  make
}

package() {
  cd "$srcdir/$pkgname/build"
  make DESTDIR="$pkgdir/" install
  install -dm755 "$pkgdir/usr/share/glib-2.0/schemas"
  install -m644 generated/glib-2.0/schemas/org.compiz.cms.gschema.xml \
    "$pkgdir/usr/share/glib-2.0/schemas/org.compiz.cms.gschema.xml"
}
