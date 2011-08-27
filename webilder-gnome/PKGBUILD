# Contributor: o6n <o6n@altervista.org>
pkgname=webilder-gnome
pkgver=0.6.4
pkgrel=1
pkgdesc="Download images from Flickr and Webshots to your desktop."
url="http://www.webilder.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gnome-panel' 'gnome-python-extras' 'deskbar-applet' 'pil')
source=(http://www.webilder.org/static/downloads/Webilder-$pkgver.tar.gz)
md5sums=('54ae36a6e050b7f4fffa7a62f8f2c44b')

build() {
  cd $startdir/src/Webilder-$pkgver
  python setup.py install --install-data=/opt/gnome --install-scripts=/usr/bin --root=$startdir/pkg
}
