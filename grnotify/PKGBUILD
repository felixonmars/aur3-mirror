# Contributor: Javier ‘Phrodo_00’ Aravena <phrodo.00@gmail.com>
pkgname=grnotify
pkgver='1.0.0rc1'
_realpkgver='1.0.0-RC1'
pkgrel=1
pkgdesc="Google Reader notifier"
arch=('i686' 'x86_64')
url="http://grnotify.sourceforge.net/"
license=('GPL')
depends=('pygtk>=2.0' 'pyxml>=0.8.3' 'python-notify>=0.1' 'gnome-python-extras')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${_realpkgver}.tar.gz")
md5sums=('49c374d3dbcebeb89ded3e7474293b61')

build() {
  cd "${startdir}/src/${pkgname}-${_realpkgver}"
  install -d -m755 -T ${startdir}/pkg/usr/share/{grnotify,pixmaps/grnotify}
  install -m644 pixmaps/* ${startdir}/pkg/usr/share/pixmaps/grnotify
  install -m644 share/*.glade ${startdir}/pkg/usr/share/grnotify
  install -D -m644 share/grnotify.desktop ${pkgdir}/usr/share/applications/grnotify.desktop
  install -D -m755 grnotify ${startdir}/pkg/usr/bin/grnotify
}

# vim:set ts=2 sw=2 et:
