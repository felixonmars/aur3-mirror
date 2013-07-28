# Contributor: Jonathan Liu <net147@hotmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: menta

pkgname=sam2p-svn
pkgver=125
pkgrel=1
pkgdesc="A bitmap-to-eps-or-pdf-converter that produces very small files. SVN version"
arch=('i686' 'x86_64')
url="http://code.google.com/p/sam2p/"
license=('GPL2')
optdepends=('ghostscript: PS, EPS, PDF support'
'libjpeg: JPEG support'
'tif22pnm: for tiff and png support')
# 'netpbm: PNG support'
provides=('sam2p')
conflicts=('sam2p')
source=("$pkgname::svn+http://sam2p.googlecode.com/svn/trunk/" "rule.patch")

pkgver() {
  cd $pkgname
  svnversion | tr -d [A-z]
}

build() {
  patch -p0 -i rule.patch
  cd $pkgname
  ./configure --prefix="$pkgdir"/usr --enable-lzw --enable-gif
  make 
}

package() {
  cd $pkgname

  make install
  install -D -m644 README "$pkgdir"/usr/share/sam2p/docs/README
}
sha256sums=('SKIP'
            '24239182608651136c7d4fabe987f89adbdc2df6287e9f22159768a39ca8581e')
