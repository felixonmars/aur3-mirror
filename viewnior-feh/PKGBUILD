# $Id: PKGBUILD 66682 2012-02-27 10:02:48Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Maintainer: M Rawash <mrawash@gmail.com>

pkgname=viewnior-feh
_pkgname=viewnior
pkgver=1.4
pkgrel=2
pkgdesc="A simple, fast and elegant image viewer program. With patch support feh."
arch=('i686' 'x86_64')
url="http://xsisqox.github.com/Viewnior/"
license=('GPL3')
depends=('gtk2>=2.12' 'exiv2' 'feh' 'desktop-file-utils')
makedepends=('make' 'intltool>=0.35' 'pkgconfig>=0.9' 'perl>=5.8.1' 'gnome-common')
install=viewnior-feh.install
conflicts=('viewnior')
provides=('viewnior')
source=(https://github.com/xsisqox/Viewnior/archive/$_pkgname-$pkgver.tar.gz
	feh_support.patch)
sha256sums=('44beaeaadf843ce2f63e339994f18ae6c524b23c967379441738ecff6c436b00'
            '74e6caa0e07219a009cdac5cf3d38127e052c533a84d5fe07ea516ff83cc2fb1')

prepare() {
  cd Viewnior-$_pkgname-$pkgver/src
  patch -Np0 -i $srcdir/feh_support.patch
}

build() {
  cd Viewnior-$_pkgname-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd Viewnior-$_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
