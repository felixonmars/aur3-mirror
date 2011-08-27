# $Id: PKGBUILD, v.1.1 2005/08/01 
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
pkgname=gideo
_realname=Gideo
pkgver=0.1
pkgdesc="A GTK webcam grabber"
pkgrel=1
arch=('i686')   # x86_64 untested
url="http://mxhaard.free.fr/download.html"
license=('GPL')
depends=('libgnomeui' 'sdl')
source=(http://mxhaard.free.fr/spca50x/Download/${_realname}-${pkgver}.tar.gz)
md5sums=('7b3cd279e4999a3562798d64da9f31fe')

build() {
  cd ${srcdir}/${_realname}-${pkgver}
  ./configure --prefix=/usr
  sed -i -e 's|doc/|share/doc/|' -e 's|gnome/apps/A|a|' Makefile
  make || return 1
  make DESTDIR=${pkgdir} install

  #install -Dm644 ${srcdir}/${_realname}-${pkgver}/Gideo.desktop ${pkgdir}/usr/share/applications/Gideo.desktop
}

# vim:set ts=2 sw=2 et:
