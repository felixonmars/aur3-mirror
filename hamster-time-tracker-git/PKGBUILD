# $Id$
# Maintainer: Manuel Transfeld <manuel@auipga.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Georg Vogetseder <georg.vogetseder@gmail.com>
# Contributor: Pablo Recio <rikutheronin@gmail.com>

_pkgname=hamster-time-tracker
_gitname=hamster
_giturl="https://github.com/projecthamster/$_gitname"
pkgname=$_pkgname-git
pkgver=20150128.r2506.bad898a
pkgrel=1
pkgdesc="GNOME time tracking standalone application"
arch=('any')
url=http://projecthamster.wordpress.com/
license=('GPL')
depends=(python2-libgnome python2-gconf python2-gnomecanvas 'dbus-python>=0.83.1' 'python2-wnck>=2.32' pyxdg docbook2x)
makedepends=(intltool 'python2-pysqlite>=2.6.0' 'gnome-doc-utils>=0.20.1' gnome-control-center)
options=('!libtool' '!emptydirs')
optdepends=("hamster-shell-extension-git: Gnome-Shell integration"
            "hamster-time-tracker-git-redmine: Redmine's Time Entries integration")
source=("git+$_giturl")
sha512sums=('SKIP')
conflicts=("$_pkgname")
provides=("$_pkgname")
install="$pkgname.install"

pkgver() {
  cd $_gitname
  printf "%s.r%s.%s" "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd $_gitname
  ./waf configure build --prefix=/usr
}

package() {
  cd $_gitname

  ./waf install --destdir=${pkgdir} --libdir=/usr/lib \
      --libexecdir=/usr/lib/${_pkgname} \
      --sysconfdir=/etc \
      --localstatedir=/var

  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  #gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${_pkgname}.schemas" --domain ${_pkgname} "${pkgdir}/etc/gconf/schemas/*.schemas"
  #rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
  # gconf-merge-schema seems not to work
  # I simply move that file
  mv ${pkgdir}/etc/gconf/schemas/hamster-time-tracker.schemas ${pkgdir}/usr/share/gconf/schemas/hamster-time-tracker.schemas
}
