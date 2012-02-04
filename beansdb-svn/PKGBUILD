# $Id$
# Maintainer: Guan 'kuno' Qing <neokuno AT gmail DOT com>

pkgname=beansdb-svn
pkgver=20110928
pkgrel=1
pkgdesc='Yet anonther distributed key-value storage system from Douban Inc, svn version'
arch=('i686' 'x86_64')
url='http://code.google.com/p/beansdb/'
license=('BSD')
depends=('tokyocabinet')
makedepends=('subversion')

build() {
  if [ ! -d "${srcdir}/${pkgname}/.svn" ]; then
    _source="http://beansdb.googlecode.com/svn/trunk/"
    svn checkout "$_source" "$srcdir/$pkgname"
  else:
    cd "${srcdir}/${pkgname}" && svn update
  fi

  cd "${srcdir}/${pkgname}"

  ./autogen.sh
  ./configure --prefix=$pkgdir/usr/
  make
  make install 
}

package() {
  cd $pkgdir || return 1
  mv usr/bin/convert usr/bin/beansdb-convert || return 1
}
