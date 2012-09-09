# Maintainer: Matthias Karl <matthias.karl@st.ovgu.de>
pkgname=ocaml-mindstorm
pkgver=0.5.2
pkgrel=1
epoch=
pkgdesc="A library for controlling Lego Mindstorms NXT bricks from OCaml"
arch=(x86_64)
url="http://ocaml-mindstorm.forge.ocamlcore.org/index.html"
license=('GLPL')
groups=()
depends=(ocaml bluez)
makedepends=(ocaml-findlib)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=(http://forge.ocamlcore.org/frs/download.php/284/$pkgname-$pkgver.tar.gz
				fix-paths.patch)
noextract=()
md5sums=('c925e04146543d2cd256904f5f010b73'
         '2d82b7a3802686524ddcfa7e90b353c4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 < ../fix-paths.patch
  make
}

package() {
  mkdir -p $pkgdir/usr/lib/ocaml/
  cd $srcdir/$pkgname-$pkgver
  make OCAMLFIND_DESTDIR=$pkgdir/usr/lib/ocaml/ OCAMLFIND_LDCONF=ignore install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
