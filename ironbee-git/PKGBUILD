# Contributor: Michael Asher <michael at wesolveeverything [dot] com>
# Maintainer: Michael Asher <michael at wesolveeverything [dot] com>
#
pkgname=ironbee-git
pkgdesc="Open-Source Web Application Firewall"
url="https://www.ironbee.com"
pkgver=20120403
pkgrel=1
arch=('any')
license=('APACHE')
options=('makeflags' '!ccache' '!libtool')
depends=('apache' 'libhtp-git' 'uuid')
source=('mod_ironbee.conf')
md5sums=('6aec65343e39f016753ba2be7b6027c1')
install=ironbee-git.install

_gitroot="http://github.com/ironbee/ironbee.git"
_gitname="ironbee"

build() {
  cd "${srcdir}"
  msg "Pulling source from ${_gitroot}"

  if [ -d $_gitname ] ; then
    msg2 "Local Repo Exists. Updating local files"
    cd $_gitname && git pull origin 
  else
    git clone $_gitroot $_gitname 
  fi

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build" 
  cd "$srcdir/$_gitname-build"
  msg2 "Fetching additional modules"
  git submodule init  
  git submodule update 
  msg "Generating \'configure\' files"
  ./autogen.sh 
  msg "Running configure scripts"
  ./configure --prefix=/usr 
  #
  # For some reason running a 'make' here fails unless I compile the luajit release first.
  #
  msg "Compiling sources"
  cd libs
  cd luajit-2.0-ironbee 
  make amalg 
  cd .. 
  cd ..
  make  
  make check  
  msg "Generating Documentation"
  make manual 
  make doxygen 
  make DESTDIR=${pkgdir} install 
  msg "Installing to \$pkgdir"
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
  cp -r docs/docbook/manual/output/* ${pkgdir}/usr/share/doc/${pkgname}/
  cd ${srcdir}
  install -Dm644 mod_ironbee.conf ${pkgdir}/etc/httpd/conf/extra/mod_ironbee.conf
} 
# vim: ts=2 sw=2 et:
