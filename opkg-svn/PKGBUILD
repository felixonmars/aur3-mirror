# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=opkg-svn
pkgver=649
pkgrel=1
pkgdesc="Lightweight package management system"
arch=('i686' 'x86_64')
url="http://code.google.com/p/opkg/"
license=('GPL2')
depends=('curl' 'gpgme')
options=('!libtool')
md5sums=()

_svntrunk=http://opkg.googlecode.com/svn/trunk/
_svnmod=opkg

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
  sed -i -e 's/AM_CONFIG_HEADER/AC_CONFIG_HEADER/' configure.ac
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir" install
  install -d -m 775 "$pkgdir/usr/lib/opkg"
}

# vim:set ts=2 sw=2 et:
