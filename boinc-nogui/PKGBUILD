# $Id: PKGBUILD 79673 2012-11-11 01:08:11Z fyan $
# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Michal Krenek <mikos@sg1.cz>

_basepkgname=boinc
pkgname=boinc-nogui
pkgver=7.0.28
pkgrel=1
pkgdesc="Berkeley Open Infrastructure for Network Computing for desktop with X"
arch=('i686' 'x86_64')
url="http://boinc.berkeley.edu/"
license=('LGPL')
conflicts=('boinc' 'boinc-nox')
provides=('boinc')
depends=('curl' 'libnotify' 'libxss' 'sqlite' 'mesa' 'freeglut' 'glu' 'libxmu')
makedepends=('curl' 'libxslt' 'perl-xml-sax' 'subversion' 'libnotify')
options=('!libtool')
install=$_basepkgname.install
source=(boinc.rc boinc.bash boinc.service boinc-AM_CONDITIONAL.patch)

_svnroot="http://boinc.berkeley.edu/svn/tags"
_svnmod="boinc_core_release_${pkgver//./_}"

build() {
  cd ${srcdir}

  msg "Connecting to boinc.berkeley.edu SVN server..."
  svn co ${_svnroot}/${_svnmod} || (error "SVN checkout failed" && return 1)
  msg "SVN checkout done or server timeout"

  msg "Starting make..."
  rm -fr ${_svnmod}-build
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build
  
  patch -p1 -i ${srcdir}/boinc-AM_CONDITIONAL.patch

  ./_autosetup

  ./configure --prefix=/usr --disable-server --enable-unicode --with-ssl \
              --disable-static --enable-client --disable-manager \
              --with-x LDFLAGS='-lX11' GTK2_CFLAGS=' ' GTK2_LIBS=' '
  make
}

package() {
  cd ${srcdir}/$_svnmod-build

  make DESTDIR=${pkgdir} install

#install rc-script
  install -D -m755 ${srcdir}/$_basepkgname.rc ${pkgdir}/etc/rc.d/$_basepkgname

#install systemd unit
  install -D -m644 ${srcdir}/$_basepkgname.service ${pkgdir}/usr/lib/systemd/system/$_basepkgname.service

#install bash-completion
  install -D -m644 ${srcdir}/$_basepkgname.bash ${pkgdir}/usr/share/bash-completion/completions/$_basepkgname

#killing /etc/init.d directory
  rm -rf ${pkgdir}/etc/init.d
}

md5sums=('c6dadc333f982ea7b548602a70bd1e93'
         '4d00e1aa4090a3f51feb20f5a541b9ee'
         '3d5cbab785cc8b004661b17c65883fd5'
         'e27047518dec54d4db38816487a28661')
