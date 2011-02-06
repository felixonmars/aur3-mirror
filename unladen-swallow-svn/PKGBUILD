# Contributor: Alexander Rødseth <rodseth@gmail.com>
pkgname=unladen-swallow-svn
pkgver=1171
pkgrel=1
pkgdesc="Python compiled with LLVM (a quicker Python than CPython)"
arch=('i686' 'x86_64')
url="http://code.google.com/p/unladen-swallow/"
license=('custom')
depends=('db' 'bzip2' 'gdbm' 'openssl>=0.9.8d' 'zlib' 'clang')
makedepends=('subversion' 'tk>=8.5.0' 'sqlite3' 'setconf')
conflicts=('python26')
_svntrunk=http://unladen-swallow.googlecode.com/svn/trunk/
_svnmod=unladen-swallow

build() {
  cd $srcdir
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg "SVN checkout done or server timeout"
  cd $_svnmod

  msg "Configuring..."
  setconf Makefile.pre.in ASDLGEN "python2 \$(srcdir)/Parser/asdl_c.py"
  ./configure --prefix=/opt/${pkgname} --enable-shared --with-threads --enable-unicode --enable-readline --without-llvm

  msg "Compiling..."
  make || return 1

  msg "Packaging..."
  make DESTDIR="$pkgdir/" install

  msg "Creating wrapperscript..."
  echo "#!/bin/sh" > unladen.sh
  echo "PYTHONHOME=/opt/${pkgname}" >> unladen.sh
  echo "PYTHONPATH=/opt/${pkgname}" >> unladen.sh
  echo "LD_LIBRARY_PATH="\$LD_LIBRARY_PATH:/opt/${pkgname}/lib" \$PYTHONHOME/bin/python \$*" >> unladen.sh
  install -Dm755 unladen.sh $pkgdir/usr/bin/unladen

  msg "Packaging license..."
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
