# $Id$
# Maintainer: Emanuel Fernandes <efernandes@tektorque.com>

pkgname=clutter-box2d
pkgver=0.12.0
pkgrel=1
pkgdesc="A 2D physics engine that can be used to manipulate a Clutter scene."
arch=('i686' 'x86_64')
url="http://www.clutter-project.org/"
license=('GPL2')
depends=('clutter>=1.0.0')
makedepends=('gtk-doc' 'gobject-introspection')
options=(!emptydirs)
source=(
	https://git.gnome.org/browse/$pkgname/snapshot/CLUTTER_BOX2D_0_12_0.tar.gz
	fix_introspection_rules.patch
)
sha256sums=(
	'71ecaaf5b9727022e452f5bcc2b9f67f7674fe31e7ebbb07eceec509edc379b1'
	'27982f26b37bbc51c372976ac23093064b22505769eb7e0221be5e2ba329618a'
)

build() {
  cd CLUTTER_BOX2D_0_12_0
  patch -Np1 -i ../fix_introspection_rules.patch
  ./autogen.sh --prefix=/usr 

  make
}

package() {
  cd CLUTTER_BOX2D_0_12_0
  make DESTDIR="$pkgdir" install
}
