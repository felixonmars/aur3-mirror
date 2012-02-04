# Contributor: riverscn<riverscn at gmail.com>
# Contributor: Lee.MaRS<leemars at gmail.com>
pkgname=ibus-git-test
pkgver=20101020
pkgrel=1
pkgdesc="Next Generation Input Bus for Linux"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://ibus.googlecode.com"
depends=('dbus-python>=0.83.0' 'gconf' 'python2' 'pygtk' 'pyxdg' 'iso-codes' \
         'librsvg' 'python-notify' 'hicolor-icon-theme' 'gobject-introspection')
optdepends=('notification-daemon')
makedepends=('git' 'cvs' 'gtk-doc' 'intltool' 'gnome-common')
provides=('ibus=1.3')
options=('!libtool')
conflicts=('ibus')
install=ibus.install

_gitname="ibus"
_gitroot="git://github.com/phuang/ibus.git"

build() {
  cd ${srcdir}

  msg "Connecting to ${_gitname} GIT server..."
  if [ -d ${_gitname} ]; then
      cd ${_gitname} && git pull origin master
      msg "The local files are updated."
  else
      git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout. Preparing sources..."
  rm -rf "${srcdir}/${_gitname}-build"
  cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  cd "${srcdir}/${_gitname}-build"

  # Add a missing file which breaks gnome-autogen.sh
  touch ChangeLog

  msg "Starting make..."

  # python2 fix
  for file in setup/ibus-setup.in ui/gtk/ibus-ui-gtk.in; do
    sed -i 's_exec python_exec python2_' $file
  done

  ./autogen.sh --break-configure || :

  ./configure \
    PYTHON=/usr/bin/python2 \
    --prefix=/usr \
    --libexecdir=/usr/lib/ibus \
    --sysconfdir=/etc \
    --with-gconf-schema-file-dir=/usr/share/gconf/schemas || return 1
  make || return 1
}

package() {
  cd "${srcdir}/${_gitname}-build"
  make DESTDIR=${pkgdir} install || return 1
}  
   
# vim:set ts=2 sw=2 et:
   
   
   
   
   
   
   
 
   
   
   
   
 
   
   
 
   
   
   
   
   
   
   
 
   
   
   
   
   
