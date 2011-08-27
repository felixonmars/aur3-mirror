# Maintainer: Robert Chmielowiec <robert@chmielowiec.net>
pkgname=contacts-git
_pkgname=contacts
pkgver=20100411
pkgrel=1
pkgdesc="A small, lightweight addressbook that uses libebook, part of EDS (Git version)"
url="http://pimlico-project.org/contacts.html"
license="GPL"
depends=('evolution-data-server')
makedepends=('git' 'intltool')
arch=('i686' 'x86_64')
install="contacts.install"
provides=('contacts')
replaces=('contacts')

_gitroot=git://git.gnome.org/contacts
_gitname=contacts
 	
build() {
  cd $srcdir
  if [ -d ${_gitname} ]; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}
    cd $_pkgname
  fi
  msg "GIT checkout done or server timeout"
  msg "Starting make..."
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --enable-gconf --enable-gnome-vfs
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=$pkgdir install || return 1
  
  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${_pkgname}.schemas" ${pkgdir}/etc/gconf/schemas/*.schemas || return 1
}
