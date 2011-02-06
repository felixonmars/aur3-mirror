# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from SVN sources.

# Maintainer: James Buckley <xanium4332@gmail.com>
pkgname=nfcd-svn
pkgver=687
pkgrel=1
pkgdesc="Daemon which access NFC devices and targets, offering D-Bus services to get devices list, targets list, target content..."
arch=('i686' 'x86_64')
url="http://code.google.com/p/nfc-tools/"
license=('LGPL3')
depends=('qt' 'libnfc>=1.4.0' 'libfreefare>=0.3.0' 'libndef>=1.1.0')
makedepends=('subversion' 'cmake')
provides=('nfcd')
conflicts=('nfcd')
_svntrunk=http://nfc-tools.googlecode.com/svn/trunk/nfcd
_svnmod=nfcd

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD
  #
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  
  make
}

package() {
  cd "$srcdir/$_svnmod-build/build"
  make DESTDIR="$pkgdir/" install

  cd "$srcdir/$_svnmod-build"
  install -D -m 644 nfcd.conf "$pkgdir/etc/dbus-1/system.d/nfcd.conf"
}
