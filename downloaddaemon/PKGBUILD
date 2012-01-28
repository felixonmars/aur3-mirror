# Contributor: Danilo T. <tillocad@libero.it>
# ------------------------------------------
# Build: daemon, ddconsole
 
pkgname=downloaddaemon
pkgver=1284
pkgrel=1
pkgdesc="Download Manager for Special Hosters (rapidshare.com/megaupload.com/youtube.com/...)"
arch=('i686' 'x86_64' 'arm')
url="http://downloaddaemon.sourceforge.net/"
license=('GPL')
depends=('curl' 'gcc-libs' 'glibc')
backup=('etc/downloaddaemon/downloaddaemon.conf' 'etc/downloaddaemon/premium_accounts.conf' 'etc/downloaddaemon/routerinfo.conf')
conflicts=('downloaddaemon')
makedepends=('subversion' 'cmake')


_svntrunk="https://downloaddaemon.svn.sourceforge.net/svnroot/downloaddaemon/trunk/"
_svnmod="dd"

build() {

cd $startdir/src
mkdir -p ~/.subversion

svn co $_svntrunk $_svnmod
msg "SVN checkout done or server timeout"

msg "Starting make: ddconsole..."
cd "$srcdir/$_svnmod/src/ddconsole"
cmake . -DCMAKE_INSTALL_PREFIX=/usr 

msg "Starting make: daemon..."
cd "$srcdir/$_svnmod/src/daemon"
cmake . -DCMAKE_INSTALL_PREFIX=/usr 

}

package() {

  msg "Build: ddconsole..." 
  cd "$srcdir/$_svnmod/src/ddconsole"
  make DESTDIR=${pkgdir} install

  msg "Build: daemon..."
  cd "$srcdir/$_svnmod/src/daemon"
  make DESTDIR=${pkgdir} install
  mv "$pkgdir/etc/init.d" "$pkgdir/etc/rc.d"

}

post_install() {
if [ ! `grep downloadd /etc/group` ]; then
groupadd downloadd &>/dev/null;
fi

id downloadd &>/dev/null || \
useradd -g downloadd -d /etc/downloaddaemon -s /bin/false downloadd

chown -R downloadd:downloadd /etc/downloaddaemon
}

post_upgrade() {
post_install
}

pre_remove() {
userdel downloadd &> /dev/null
groupdel downloadd &> /dev/null
}

