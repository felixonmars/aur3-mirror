# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
pkgname=pytraffic
pkgver=2.5.4
pkgrel=2
pkgdesc="A Python version of the board game Rush Hour"
arch=('i686' 'x86_64')
license="GPL"
url="http://alpha.uhasselt.be/Research/Algebra/Members/pytraffic/"
depends=('pygtk' 'sdl_mixer')
source=(http://alpha.uhasselt.be/Research/Algebra/Members/pytraffic/$pkgname-$pkgver.tar.gz)
md5sums=('a50daed7c9e0070443f6a1b696c56db7')

build() {
  cd $startdir/src/$pkgname-$pkgver
  python setup.py install --root=$startdir/pkg --prefix=/usr
}
