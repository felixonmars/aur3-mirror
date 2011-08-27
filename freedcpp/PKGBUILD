# Contributor: Alex Zinchenko mng123@gmail.com
pkgname=freedcpp
pkgver=21
pkgrel=1
pkgdesc="DC + + client based on the source code LinuxDC + +."
arch=('i686' 'x86_64')
url="http://code.google.com/p/freedcpp/"
license=('GPL')
depends=('gtk2>=2.0' 'libgnome>=2.0' 'libglade' 'bzip2' 'openssl')
makedepends=('pkgconfig' 'subversion' 'scons')
provides=(freedcpp)
conflicts=('linuxdcpp' 'linuxdcpp-bzr' 'linuxdcpp-bzr-i18n')
source=()
md5sums=('')

_svnmod="freedcpp"
_svntrunk="http://freedcpp.googlecode.com/svn/trunk/"

build() {
  cd ${srcdir}

  #####
  msg "Getting sources..."
  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn up -r ${pkgver})
  else
    svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
    cd ${_svnmod}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  #####

  # Generating build system
  scons PREFIX=/usr LIBDIR=/usr/share || return 1
  scons PREFIX=/usr LIBDIR=/usr/share install FAKE_ROOT=$startdir/pkg || return 1
  scons DESTDIR=${pkgdir} install || return 1
}
