# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=linuxvideoconverter
pkgver=0.9.1
pkgrel=1
pkgdesc="The simple video transcoder for Linux."
arch=('i686')
url="http://rudd-o.com/new-projects/linuxvideoconverter"
license=('GPL')
depends=('mplayer' 'pygtk' 'python')
source=(http://rudd-o.com/new-projects/$pkgname/releases/$pkgver/$pkgname-$pkgver.tar.gz)

md5sums=('8bdfd3917278c14edc3d9370ad898a06')

build() {
  cd "${srcdir}/$pkgname-$pkgver"

  python setup.py install --root="${pkgdir}" || return 1
}
