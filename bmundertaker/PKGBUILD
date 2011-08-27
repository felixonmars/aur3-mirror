# Maintainer: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=bmundertaker
pkgver=0.3
pkgrel=1
pkgdesc="A PyGTK application which imports Firefox's bookmarks, updates their status and exports them back to a compatible HTML file."
url="https://launchpad.net/bmundertaker/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('pygtk' 'beautiful-soup')
source=(http://launchpad.net/bmundertaker/trunk/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz bmundertaker.desktop)
md5sums=('a66c9355364cd8c561e2f8c096012912' 'cf1425c85cc34bfd77640f8147c2fc2d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  PREFIX="$pkgdir/usr" python setup.py install --root="$pkgdir" --optimize=1 || return 1
  mkdir -p ${pkgdir}/usr/share/applications
  install ${srcdir}/bmundertaker.desktop ${pkgdir}/usr/share/applications
}
