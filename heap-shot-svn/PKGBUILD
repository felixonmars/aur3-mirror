# Contributor:  Nicklas Overgaard <nicklas@isharp.dk>

pkgname=heap-shot-svn
pkgver=157314
pkgrel=1
pkgdesc="Bleeding edge Mono heap-shot profiler"
url="http://www.mono-project.com/HeapShot"
arch=('i686' 'x86_64')
license=('GPL')
depends=('mono' 'glib2' 'gtk-sharp-2')
makedepends=('subversion')
provides=('heap-shot'=$pkgver-$pgkrel)

source=(configure.patch)
md5sums=('6d7857faecb158569e916c38b9d2fbbc')

_svntrunk=svn://anonsvn.mono-project.com/source/trunk/heap-shot
_svnmod=heap-shot

build() {
  cd ${srcdir}

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  # patch the configure.in file
  msg "Patching"
  patch -p0 ./configure.in ../configure.patch || return 1
  
  ./autogen.sh --prefix=/usr
  make || return 1
  make DESTDIR=${pkgdir} install || return 1

  rm -rf ${srcdir}/$_svnmod-build
}
# vim:syntax=sh
