# Maintainer: Vadym Abramchuk <abramm@gmail.com>
pkgname=meoip-svn
pkgver=53
pkgrel=1
pkgdesc="Linux support daemon for proprietary Mikrotik EoIP protocol"
arch=(i686, x86_64)
url="http://code.google.com/p/linux-eoip/"
license=('GPL3')
makedepends=('subversion')
backup=('etc/meoip.cfg')
source=('meoip.init')
md5sums=('5920adb642f5fb14eba1c510668ca05b')

_svntrunk=http://linux-eoip.googlecode.com/svn/trunk/
_svnmod=linux-eoip

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD HERE
  #
  ./bootstrap.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir/" install
  install -Dm644 meoip.cfg "$pkgdir/etc/meoip.cfg"
  install -Dm755 "$srcdir/meoip.init" "$pkgdir/etc/rc.d/meoip"
}

# vim:set ts=2 sw=2 et:
