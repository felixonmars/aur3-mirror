# Contributor: Dejan Čabrilo <dejan@studioblue38.com>
pkgname=inksmoto
pkgver=0.7.0
pkgrel=1
pkgdesc="Set of Inkscape extensions to create and edit Xmoto levels."
arch=('x86_64' 'i686')
url="http://xmoto.tuxfamily.org/"
license=('GPL')
depends=('inkscape>=0.46' 'python>=2.5' 'python-lxml' 'pygtk')
source=(http://download.tuxfamily.org/xmoto/svg2lvl/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=(1a8055501dc03cccce4adc331f5815d9)

build() {
  cd "$srcdir"/extensions
  # Remove files that are of no use
  rm "$srcdir"/extensions/{INSTALL,AUTHORS,README,COPYING,Makefile.am}
  install -m755 -d "$pkgdir"/usr/share/inkscape/extensions
  cp -Rv "$srcdir"/extensions/* "$pkgdir"/usr/share/inkscape/extensions
}
