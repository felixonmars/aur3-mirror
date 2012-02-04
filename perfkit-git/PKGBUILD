# Contributor: Mikael Eriksson <mikael_eriksson@miffe.org>
pkgname=perfkit-git
pkgver=20101104
pkgrel=1
pkgdesc="Perfkit is a performance recording toolkit for developers and system administrators."
arch=('i686' 'x86_64')
url="https://github.com/chergert/perfkit"
license=('GPL')
depends=('clutter-gtk' 'dbus-glib')
makedepends=('git' 'vala' 'gtk-doc')

_gitroot="https://github.com/chergert/perfkit.git"
_gitname="perfkit"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  ./autogen.sh --prefix=/usr
  sed -i 's,\(.\$(AM_V_CCLD)\$(perfkit_shell_LINK) \$(perfkit_shell_OBJECTS) \$(perfkit_shell_LDADD) \$(LIBS)\),\1 -lgio-2.0,' tools/Makefile
  sed -i 's,\(.\$(AM_V_CCLD)\$(LINK) \$(test_pk_connection_OBJECTS) \$(test_pk_connection_LDADD) \$(LIBS)\),\1 -lgio-2.0,' tests/perfkit/Makefile
  make || return 1
  make DESTDIR="$pkgdir/" install
} 
