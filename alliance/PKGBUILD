# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Paulo Matias <matiasΘarchlinux-br·org>

pkgname=alliance
pkgver=5.0_20120515
pkgrel=1
pkgdesc="Free CAD tools and libraries for VLSI design (complete design flow from VHDL to layout)"
arch=('i686' 'x86_64')
url="http://www-asim.lip6.fr/recherche/alliance/"
license=('GPL')
depends=('lesstif' 'libxpm')
optdepends=('zsh: bench script')
install="$pkgname.install"
source=("${url/recherche/pub}distribution/${pkgver/_*}/${pkgname}-${pkgver/_/-}.tar.gz"
        "http://ftp.de.debian.org/debian/pool/main/a/alliance/alliance_${pkgver/_/-}-6.debian.tar.gz")
md5sums=('9c09b669451e0425a2e8be3d8fb409dc'
         'b21208781b965a7efec6ee77cb55737d')

prepare() {
  cd $pkgname-${pkgver/_*}

  # use debian patches
  for _f in ../debian/patches/*.patch; do
    patch -p1 -i $_f;
  done;
}

build() {
  cd $pkgname-${pkgver/_*}
  ./autostuff
  ./configure --prefix=/usr \
              --mandir=/usr/share/man \
              --libdir=/usr/lib/$pkgname \
              --includedir=/usr/include/$pkgname \
              --sysconfdir=/etc \
              --enable-alc-shared \
              --enable-static=no
  make
}

package() {
  cd $pkgname-${pkgver/_*}
  make DESTDIR="$pkgdir/" install

  # install desktop files and pixmaps
  install -d "$pkgdir"/usr/share/{applications,pixmaps}
  install -Dm644 distrib/*.desktop "$pkgdir/usr/share/applications"
  install -Dm644 distrib/*.png "$pkgdir/usr/share/pixmaps"

  # prevent conflict with man3 log
  cd "$pkgdir/usr/share/man/man3" && mv log.3 log-$pkgname.3
}
