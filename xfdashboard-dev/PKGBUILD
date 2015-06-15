# Maintainer: Rob McCathie <korrode AT gmail>

_name=xfdashboard
pkgname=xfdashboard-dev
_series=0.5
pkgver=${_series}.0
pkgrel=1
pkgdesc="Maybe a Gnome shell like dashboard for Xfce - Development release"
arch=('i686' 'x86_64')
url="http://goodies.xfce.org/projects/applications/${_name}/start"
license=('GPL')
depends=('clutter>=1.12' 'dbus-glib>=0.98' 'garcon>=0.2.0' 'glib2>=2.32' 'libwnck3' 'xfconf>=4.10.0' 'gtk3>=3.2')
makedepends=('xfce4-dev-tools')
conflicts=("${_name}")
provides=("${_name}=${pkgver}")
source=("http://archive.xfce.org/src/apps/${_name}/${_series}/${_name}-${pkgver}.tar.bz2")
sha1sums=('7f3699143e4a5ed7dce3329a4deb6b573c22ec29')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
