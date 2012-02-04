# Contributor: Bruno Galeotti <bravox87 at gmail dot com>
pkgname=unladen-swallow
pkgver=2009Q4
pkgrel=1
pkgdesc="Python compiled with LLVM (a quicker Python than CPython)"
arch=('i686' 'x86_64')
url="http://code.google.com/p/unladen-swallow/"
license=('custom')
depends=('db' 'bzip2' 'gdbm' 'openssl>=0.9.8d' 'zlib')
makedepends=('subversion' 'tk>=8.5.0' 'sqlite3')
provides=('python=2.6.4-1')
conflicts=('python')
_svntrunk=http://unladen-swallow.googlecode.com/svn/branches/release-2009Q4-maint
_svnmod=unladen

build() {
  cd ${srcdir}
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg "SVN checkout done or server timeout"
  cd $_svnmod

  msg "Configuring..."
  #./configure --prefix=/usr --enable-shared --with-threads --enable-unicode
  ./configure --prefix=/usr

  msg "Building..."
  make || return 1
  make DESTDIR="$pkgdir/" install

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et: 
