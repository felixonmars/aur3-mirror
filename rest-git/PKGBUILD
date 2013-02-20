# Maintainer Yichao Yu <yyc1992@gmail.com>
# Contributor kfgz <kfgz at interia pl>
# Package based on glib2

pkgname=rest-git
pkgver=20130220
pkgrel=1
_realver=0.80
pkgdesc="librest, git version"
url="http://git.gnome.org/browse/librest"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('glib2' 'libsoup-gnome' 'libxml2')
makedepends=('pkgconfig' 'gettext' 'gtk-doc' 'git' 'python2')
conflicts=('rest')
provides=("rest=${_realver}")
options=('!libtool' '!docs')

_gitroot="git://git.gnome.org/librest"
_gitname="librest"

build() {
  msg "Connecting to gnome.org GIT server...."

  if [ -d ${srcdir}/${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
  msg "Creating build directory"
  if [ -d ${srcdir}/${_gitname}-build ]; then rm -rf ${srcdir}/${_gitname}-build; fi
  cp -R ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build

  msg "Starting make..."
  cd ${srcdir}/${_gitname}-build
  PYTHON=/usr/bin/python2 ./autogen.sh --prefix=/usr --libdir=/usr/lib \
      --sysconfdir=/etc \
	  --localstatedir=/var \
      --with-pcre=system \
      --disable-fam \
	  --disable-selinux

  make
}

package() {
  cd ${srcdir}/${_gitname}-build
  make DESTDIR="${pkgdir}" install

}

