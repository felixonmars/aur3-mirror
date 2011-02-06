# Maintainer: Bernhard Walle <bernhard.walle@gmx.de>
# AUR Category: gnome

pkgname=vte-svn
pkgver=2127
pkgrel=1
pkgdesc="VTE - Virtual Terminal Emulator"
arch=(i686 x86_64)
license=('LGPL')
depends=('gtk2>=2.12.10' 'libsm')
options=('!libtool')
makedepends=('pygtk>=2.12.1' 'pkgconfig' 'intltool' 'subversion')
url="http://www.gnome.org"
source=(vte-0.16.0-reaper-python-bindings.patch)
md5sums=('efe29cd40635e73fa3152f77d91a4f39')
provides=('vte')

_svntrunk=http://svn.gnome.org/svn/vte/trunk
_svnmod=vte

build() {
  cd $srcdir

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -r "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD
  #

  patch -Np1 -i $srcdir/vte-0.16.0-reaper-python-bindings.patch || return 1
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc \
              --libexecdir=/usr/lib/vte \
              --localstatedir=/var --disable-static || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
