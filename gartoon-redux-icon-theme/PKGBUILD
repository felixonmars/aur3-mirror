# Maintainer: boenki <boenki at gmx dot de>
# Contributor: grimi <grimi at poczta dot fm>

pkgname=gartoon-redux-icon-theme
pkgver=1.11
pkgrel=1
pkgdesc="Massively improved variant of the much-beloved Gartoon theme"
arch=('any')
url="http://www.gnome-look.org/content/show.php/Gartoon+Redux?content=74841"
license=('GPL')
makedepends=('librsvg' 'perl')
install=gartoon-redux.install
options=(!strip !zipman)
source=("https://launchpad.net/gartoon-redux/1.x/$pkgver/+download/gartoon-redux-$pkgver.tar.gz"
        "distribution-arch-linux.svg"
        "application-x-archpkg.svg")
md5sums=('3692f68c8f2e68f15f56b036bcda36f6'
         '1d6c5095efa1d5205d0e9cf43b35bafd'
         'de5b7a97d72848e6ea57dedac8e2565d')

prepare() {
  cd gartoon-redux-$pkgver

  # a bit hackish, fix logo install script (this way no needed "lsb-release")
  sed "s|\`lsb_release -si\`|'arch linux'|g" -i fix-logo.pl

  # fix the configure script
  sed 's|rsvg -x $zoom_factor -y $zoom_factor $source $target|rsvg-convert -x $zoom_factor -y $zoom_factor $source -o $target|g' -i configure

  # fix the "fix-logo.pl" script
  sed 's|use Switch;|use feature "switch";|g' -i fix-logo.pl

  # wrong size of orginal distribution-arch-linux.svg, copy right size (90x90)
  cp -f $srcdir/distribution-arch-linux.svg src/extras/

  # copy archpkg mime icon
  cp $srcdir/application-x-archpkg.svg src/mimetypes/
}

build() {
  cd gartoon-redux-$pkgver
  ./configure --sizes=16,22,24,32 --prefix=$pkgdir/usr
  make
}

package() {
  cd gartoon-redux-$pkgver
  make install
}