# Contributor: Vadim Abramchuk <abram@uainet.net>
pkgname=accel-pptp-server-git
pkgver=20091126
pkgrel=1
pkgdesc="Kernelspace PPTP server"
arch=('i686' 'x86_64')
url="http://accel-pptp.sourceforge.net/"
license=('GPL')
groups=()
depends=('ppp','accel-pptp-kernel-git')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
#install='accel-pptp.install'
install=
source=(fix-accel-pptp-install.patch)
noextract=()
md5sums=('b9a70799466564c1307b52c4159f8163')

_gitroot="git://accel-pptp.git.sourceforge.net/gitroot/accel-pptp/accel-pptp"
_gitname="accel-pptp"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  export PPPD_VERSION=`/usr/sbin/pppd --version 2>&1|grep version|awk '{print $3}'`
  echo ">>> Building pppd plugin"
  cd pppd_plugin
  ./configure 
  make
  mkdir -p $pkgdir/usr/lib/pppd/${PPPD_VERSION}
  install -m 0644 src/.libs/pptp.so.0.0.0 $pkgdir/usr/lib/pppd/$PPPD_VERSION/pptp.so
  echo ">>> OK"
  echo ">>> Plugin install dir is $pkgdir/usr/lib/pppd/$PPPD_VERSION"
  echo ">>> Patching the source..."
  cd ../pptpd-1.3.3/
  
  patch -p1 < ${startdir}/fix-accel-pptp-install.patch 
  echo ">>> Building PPTP server..."
  ./configure --prefix=/usr
  make
  make DESTDIR=${pkgdir} install

} 
