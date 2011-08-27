# Maintainer: Bruno Tsubouchi Yporti <yportimd@archlinux.us>
# Adopted by: Fernando Marcelo <el.zoona@gmail.com>

pkgname=skychart-beta
pkgver=3.0.1.6
pkgrel=1
pkgdesc="Free software to draw sky charts"
arch=(i686)
license=('GPL')
depends=('gtk2')
makedepends=('binutils')
url="http://www.ap-i.net/skychart/start"
source=(http://ufpr.dl.sourceforge.net/sourceforge/skychart/skychart_3.0.1.6-1202_i386.deb)
md5sums=('ce52d4a43a92bf43471e9cbe65f07192')

build() {
ar x ${srcdir}/skychart_3.0.1.6-1202_i386.deb
tar xvzf data.tar.gz -C ${pkgdir}/
}
