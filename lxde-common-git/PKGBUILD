
pkgname=lxde-common-git
pkgver=20121014
pkgrel=1
pkgdesc="Common files of the LXDE Desktop"
arch=('i686' 'x86_64')
license=('GPL2')
groups=('lxde-git')
depends=('libx11' 'glib2' 'gtk-update-icon-cache')
provides=('lxde-common')
conflicts=('lxde-common')
url="http://lxde.org/"
# startlxde is useless without lxsession 
optdepends=(lxsession-lite)
backup=(etc/xdg/lxsession/LXDE/{desktop.conf,autostart})
# install=lxde-common.install
_gitroot=git://pcmanfm.git.sourceforge.net/gitroot/lxde/lxde-common/
_gitname=lxde-common

build() {
  cd "$srcdir"

  cd $srcdir
  msg "Connecting to GIT server...."

  if [ -d $startdir/src/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf $srcdir/$_gitname-build
  cp -r $srcdir/$_gitname $srcdir/$_gitname-build
  cd $srcdir/$_gitname-build

  msg "Starting make..."
  sed -i -e "s/SUBDIRS = man/ /" Makefile.am
  sed -i -e "s/lxde.conf/LXDE.conf/" Makefile.am
  sed -i -e "s/1.11/1.12/" autogen.sh

  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir" install
    install -d $pkgdir/usr/share/applications/
    install $srcdir/${_gitname-build}/debian/lxde-logout.desktop $pkgdir/usr/share/applications/
    install $srcdir/${_gitname-build}/debian/lxde-screenlock.desktop $pkgdir/usr/share/applications/
}

