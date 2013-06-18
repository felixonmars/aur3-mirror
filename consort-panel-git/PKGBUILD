#Contributor: Mihai Coman <mihai@m1x.ro>
#Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=consort-panel-git
_pkgname=consort-panel
pkgver=20130618
pkgrel=0
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="The Consort panel"
url="https://bitbucket.org/consortdesktop/consort-panel"
depends=('gnome-menus' 'gnome-desktop' 'evolution-data-server' 'librsvg' 'libwnck3' 'libsm' 'dconf'
         'gconf' 'telepathy-glib')
makedepends=('yelp-tools' 'intltool' 'gobject-introspection' 'networkmanager' 'libcanberra')
install=consort-panel.install
groups=('consort')
options=('!libtool' '!emptydirs')

_gitroot=https://bitbucket.org/consortdesktop/consort-panel
_gitname=master


build() {

  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  
  cd "$srcdir/$_gitname-build"
  PYTHON=/usr/bin/python2 ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --libexecdir=/usr/lib/consort-panel \
      --disable-scrollkeeper \
      --disable-schemas-compile
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir" install

  install -m755 -d "$pkgdir/usr/share/gconf/schemas"
  gconf-merge-schema "$pkgdir/usr/share/gconf/schemas/$_pkgname.schemas" --domain consort-panel-3.0 "$pkgdir"/etc/gconf/schemas/*.schemas
  rm -f "$pkgdir"/etc/gconf/schemas/*.schemas
}
