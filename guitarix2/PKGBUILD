# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=guitarix2
pkgver=0.25.2
pkgrel=1
pkgdesc="A simple mono guitar amplifier and FX for JACK using Faust"
arch=('i686' 'x86_64')
url="http://sourceforge.net/apps/wordpress/guitarix/"
license=('GPL')
depends=('gtkmm' 'jack' 'fftw' 'liblrdf' 'boost-libs')
makedepends=('python2' 'boost' 'intltool' 'lv2')
optdepends=('meterbridge: sound meters')
conflicts=("guitarix" 'gx_head')
replaces=("guitarix" 'gx_head')
install="$pkgname.install"
source=("http://download.sourceforge.net/project/guitarix/guitarix/$pkgname-$pkgver.tar.bz2")
md5sums=('6471c01705c724d80fac0d31168979db')

build() {
  cd "$srcdir/guitarix-$pkgver"

  # do not call both ldconfig
  # and update-desktop-database
  sed -e '/bld.env..GX_LIB_SHARED/,+1d' \
      -e "/\.commands/,/pass/d" -i wscript

  python2 waf configure --prefix=/usr \
                        --includeresampler \
                        --includeconvolver \
                        --no-faust \
                        --optimization \
                        --shared-lib \
                        --lib-dev \
                        --build-lv2
  python2 waf build
}

package() {
  cd "$srcdir/guitarix-$pkgver"
  python2 waf install --destdir="$pkgdir"
}
