# Maintainer : speps <speps at aur at archlinux dot org>
# Contributor: Philipp Überbacher <murks at lavabit dot com>

pkgname=jcgui
pkgver=0.8.r4.446b5e6
pkgrel=1
pkgdesc="A simple little gui for jconvolver"
arch=('i686' 'x86_64')
#url="http://jcgui.sourceforge.net/"
url="https://github.com/zzzzrrr/jcgui"
license=('GPL')
depends=('gtk2' 'jack' 'zita-resampler' 'desktop-file-utils')
install="$pkgname.install"
#source=("http://downloads.sourceforge.net/project/jcgui/jcgui/$pkgname-$pkgver.tar.bz2")
source=("https://github.com/zzzzrrr/jcgui/archive/446b5e6.tar.gz")
md5sums=('0ec6a1e4f1011a58fdc35576e694c6bd')

build() {
  cd $pkgname-*
  python2 waf configure --prefix=/usr
  python2 waf build
}

package(){
  cd $pkgname-*
  python2 waf --destdir="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
