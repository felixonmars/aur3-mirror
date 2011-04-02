# Maintainer: Dimitrije Radojevic <templaryum@gmail.com>
pkgname=evemu-svn
pkgver=893
pkgrel=1
pkgdesc="An EVE Online emulator"
arch=('i686' 'x86_64')
url="http://forum.evemu.org/"
license=('LGPL')
depends=('mysql>=5' 'libmysqlclient' 'zlib')
makedepends=('subversion' 'gcc>=4.2' 'cmake>=2.8')
options=(!strip) 
backup=(opt/evemu/etc/eve-server.xml)
install=evemu-svn.install
source=(http://eve.no-ip.de/apo15/apo15-mysql5-v1.sql.bz2)
md5sums=('f11c2224853d774636531d4369ce48dc')

# Note: if svn asks for password, just hit enter
_svntrunk=http://svn.evemu.org/trunk
_svnmod=evemu
_svnuser=anonymous
_svnpass=''
_SVN="svn --password=\"${_svnpass}\" --username ${_svnuser}"

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up --username anonymous --password "" -r $pkgver)
  else
    svn co --username anonymous --password "" $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  
  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD
  #

  # won't build without these (at least on my system)
  unset LDFLAGS
  unset CPPFLAGS
  unset CXXFLAGS
  unset CFLAGS
  
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/opt/evemu ../ || return 1
  make || return 1
}

package() {
  #
  # INSTALL
  #
  cd "$srcdir/$_svnmod-build/build"
  make DESTDIR="$pkgdir/" install

  # SQL dir and files
  cd ../sql/utils/

  # merge SQL updates to one file
  ./merge-evemu-updates.sh || return 1
  ./merge-ofic-updates.sh || return 1

  cd "$srcdir/$_svnmod-build"
  install -m755 -d "${pkgdir}/opt/evemu/sql" || return 1
  install -m644 sql/*.sql "${pkgdir}/opt/evemu/sql/" || return 1
  install -m644 "${srcdir}/apo15-mysql5-v1.sql" "${pkgdir}/opt/evemu/sql/" || return 1
  install -m644 sql/README "${pkgdir}/opt/evemu/sql/" || return 1
  
  # Log dir and files
  install -m777 -d "$pkgdir/opt/evemu/log/" || return 1	
  (umask 111 && touch "${pkgdir}/opt/evemu/log/log.ini" \
  && touch "${pkgdir}/opt/evemu/log/eve-server.log") || return 1
}
