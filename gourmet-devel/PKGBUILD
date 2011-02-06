# Contributor: rxvt <artwithin@gmail.com>

pkgname=gourmet-devel
pkgver=0.11.2
pkgrel=2
pkgdesc="Gourmet Recipe Manager is a simple but powerful recipe-managing application.  This is its development branch."
url="http://grecipe-manager.sourceforge.net/"
license="GPL"
depends=('metakit' 'pil' 'pygtk>=2.4' 'gnome-python-extras' 'libglade')
makedepends=()
conflicts=('gourmet')
replaces=('gourmet')
provides=('gourmet')
backup=()
install=gourmet.install
source=(http://dl.sourceforge.net/sourceforge/grecipe-manager/gourmet-$pkgver-3.tar.gz)
md5sums=('afb10f359e454c9fdf31e13565661101')

build() {
  cd $startdir/src/gourmet-$pkgver
  python setup.py install --prefix=$startdir/pkg/usr
}
