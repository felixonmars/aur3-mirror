# Maintainer: Dany Martineau <dany.luc.martineau gmail.com>

pkgname=intipunku
pkgver=0.54
pkgrel=2
pkgdesc="Photo manager which aims at feature richness and ease of use.."
arch=('i686' 'x86_64')
url="http://intipunku.berlios.de/drupal/"
license=('GNU Affero GPL v3 ')
depends=('pygtk' 'python-imaging' 'python-pysqlite' 'pygtkimageview' 'pyexiv2')
optdepends=('gphoto2' 'hugin' 'python-gdata' 'panomatic' 'gnome-python-desktop')
madepends=('make')
source=(https://launchpad.net/~intipunku/+archive/intipunku-karmic/+files/${pkgname}_${pkgver}-0sol1.tar.gz)
md5sums=('c6e04f8c94a9d49d9e880cb7362b5c7e')

build() {
cd ${srcdir}/$pkgname-$pkgver
python setup.py install --root=${pkgdir} --prefix=/usr
}
