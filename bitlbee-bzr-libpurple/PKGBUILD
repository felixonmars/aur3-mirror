pkgname=bitlbee-bzr-libpurple
pkgver=1
pkgrel=1
pkgdesc="An IRC to IM gateway. Development version."
arch=('i686' 'x86_64')
url="http://bitlbee.org"
license=('GPL')
depends=('gnutls' 'glib2' 'libpurple')
makedepends=('bzr' 'xmlto' 'docbook-xsl' 'links')
provides=(bitlbee)
conflicts=(bitlbee bitlbee-bzr)
options=()
install=bitlbee.install
source=(bitlbee.rcd)
#md5sums=('07fffd4e0e2e2ab431af1a0c5ac9d4a4' 
md5sums=('90893b706e0e50d37cfe6b283bc7d46c')
backup=('etc/bitlbee/welcome.txt' 'etc/bitlbee/motd.txt' 'etc/bitlbee/bitlbee.conf')

_bzrbranch=http://code.bitlbee.org/wilmer/libpurple/                                                                                                                             
_bzrmod=bitlbee
          
build() {        
  cd ${srcdir}   
                 
  msg "Connecting to the server...."

  bzr checkout ${_bzrbranch}
                
  msg "BZR checkout done or server timeout"
  msg "Starting make..."


   cd $startdir/src/libpurple
   
  ./configure --prefix=/usr --ssl=gnutls --etcdir=/etc/bitlbee/ --purple=1  || return 1
  make || return 1

  install -m755 -d $pkgdir/var/lib
  install -o65 -g65 -d -m0770 $pkgdir/var/lib/bitlbee
  install -D -m755 $srcdir/bitlbee.rcd \
                   $pkgdir/etc/rc.d/bitlbee || return 1

  make DESTDIR=${pkgdir} install || return 1
  make DESTDIR=${pkgdir} install-etc || return 1
  make DESTDIR=${pkgdir} install-dev || return 1

}

# vim:set ts=2 sw=2 et:
