pkgname=uget-svn
pkgver=324
pkgrel=1
pkgdesc="UrlGfe is a GTK2 download manager"
arch=('i686' 'x86_64')
url="http://urlget.sourceforge.net/"
license=('LGPL')
depends=('gtk2' 'curl' 'startup-notification' 'gstreamer0.10-base' 'libnotify') 
makepdepends=('subversion')
install=$pkgname.install
source=(fix.patch)
md5sums=(59865a98bfd192e966a28963da821440)

_svntrunk=http://urlget.svn.sourceforge.net/svnroot/urlget/trunk/
_svnmod=uget

build() {
  cd $srcdir/
  msg "Getting source..."
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn --config-dir ../ up -r $pkgver)
  else
    svn --config-dir ./ co $_svntrunk  -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Creating make environment..."
  rm -rf $srcdir/$_svnmod-build
  cp -r $srcdir/$_svnmod $srcdir/$_svnmod-build
  cd $srcdir/$_svnmod-build

  msg "Starting make..."

  patch -Np1 -i $srcdir/fix.patch
  . autogen.sh
  ./configure --prefix=/usr --enable-notify --enable-gstreamer

  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
  install -Dm755 uget-cmd/uget-cmd $pkgdir/usr/bin/uget-cmd
  echo "StartupNotify=true" >> $pkgdir/usr/share/applications/uget-gtk.desktop
}
