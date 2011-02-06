pkgname=webilder-applet
pkgver=0.7
pkgrel=1
pkgdesc="Gnome applet which allows to set your wallpapers downloading photos from Flickr and Webshots"
url="http://www.webilder.org"
depends=('gnome-panel' 'gnome-python-extras' 'pil' 'gnome-python-desktop')
source=(http://www.webilder.org/static/downloads/Webilder-$pkgver.tar.gz)
md5sums=('c82c24f9481923675944f33afab3e529')
arch=('i686' 'x86_64')
license=('GPL')
md5sums=('c82c24f9481923675944f33afab3e529')
package() {
  cd ${srcdir}/Webilder-$pkgver
  python2 setup.py install --install-data=/opt/gnome --install-scripts=/usr/bin --root=${pkgdir}
}

# vim:set ts=2 sw=2 et:

