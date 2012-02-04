# Author: David Manouchehri <me@davidmanouchehri.com>
# Modified from Ermenegildo Fiorito's PKGBUILD <fiorito.g@gmail.com>

pkgname=nmap-exp
pkgver=4.85BETA10
pkgrel=1
pkgdesc="A network exploration tool and security/port scanner, experimental branch"
arch=('i686' 'x86_64')
url="http://nmap.org"
license=('custom:GPL')
depends=('pcre' 'openssl' 'libpcap>=1.0.0' 'lua')
makedepends=('python3' 'subversion') # remove python3 if you don't need zenmap
conflicts=('nmap' 'nmap-svn' 'nmap-dev' 'nmap-nogui')
options=('!makeflags')
source=()
md5sums=()

_svntrunk=svn://svn.insecure.org/nmap-exp/dev

build() {
  cd "$srcdir"
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
svn co --username guest --password "" --no-auth-cache $_svntrunk
  fi
  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd dev/nmap

  echo "TryExec=/usr/bin/pygtk-demo" >> zenmap/install_scripts/unix/zenmap.desktop
   echo "TryExec=/usr/bin/pygtk-demo" >> zenmap/install_scripts/unix/zenmap-root.desktop

  ./configure --prefix=/usr --mandir=/usr/share/man
  make || return 1
  make DESTDIR="${pkgdir}" install
  make clean
  make distclean
  # remove zenmap uninstall script
  rm "${pkgdir}/usr/bin/uninstall_zenmap"

  # install custom GPL2 license
  install -D -m644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

