# Contributor: Blaž Tomažič <blaz.tomazic@gmail.com>
pkgname=ruby1.8-rmagick
pkgver=2.13.1
_sfdlid=70067
pkgrel=4
pkgdesc="RMagick is an interface between the Ruby programming language and the ImageMagick and GraphicsMagick image processing libraries"
arch=('i686' 'x86_64')
url="http://rmagick.rubyforge.org"
license=('GPL')
#depends=('ruby1.8' 'imagemagick=6.6.9.8' 'graphicsmagick=1.3.12')
depends=('ruby1.8' 'imagemagick' 'graphicsmagick')
source=("http://rubyforge.org/frs/download.php/${_sfdlid}/RMagick-${pkgver}.tar.bz2")

build() {
  cd "$srcdir/RMagick-$pkgver"
  # the post-install.rb script does not seem to take the prefix into account
  # when installing docs, we have to force it
  ruby-1.8 setup.rb all --doc-dir=${pkgdir}/usr/share/doc/rmagic || exit 1
  ruby-1.8 setup.rb install --prefix=$pkgdir || exit 3
}
md5sums=('fa419869d5533884e4556c8b8b390adb')
