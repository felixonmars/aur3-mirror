# Maintainer: AndyRTR <andyrtr@archlinux.org>

pkgname=linux-mtp-streaming-server
pkgver=1.1.2
pkgrel=1
pkgdesc="streaming server for Linux MTPCenter 2.0 server solution for Pinnacle Showcenter and compatible media clients"
arch=('i686' 'x86_64')
url="http://www.panczyk.eu/linux/mtp_center_eng.html"
license=('GPL2')
groups=()
depends=('libmysqlclient')
makedepends=('autoconf')
provides=()
conflicts=()
replaces=()
backup=(etc/linux-mtp-streaming-server/mtpserver.ini
	etc/rc.d/linux-mtp-streaming-server)
options=()
install=$pkgname.install
source=(http://www.panczyk.eu/linux/download/linux_mtp_streaming_server-$pkgver.tar.gz
	compile.patch
	fix_docdir.patch
	linux-mtp-streaming-server.sh)
md5sums=('d7650ee70282c8d262d68274ae10bc11'
         '8c522435e9ee56997b94574e27af25e3'
         '544edc96edfe790a3ec4b5f565d64a1f'
         'ef02cd26ab8836c069ea3e1ab71fd67d')

build() {
  cd "$srcdir/linux_mtp_streaming_server-$pkgver"
  patch -Np0 -i $srcdir/compile.patch
  patch -Np0 -i $srcdir/fix_docdir.patch
  autoreconf
  libtoolize --force
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd "$srcdir/linux_mtp_streaming_server-$pkgver"
  make DESTDIR="$pkgdir/" install || return 1
  # fix ChangLog file
  install -D -m644 doc/ChangeLog ${pkgdir}/usr/share/doc/linux_mtp_streaming_server/
  # install daemon init script
  install -D -m755 ${srcdir}/linux-mtp-streaming-server.sh ${pkgdir}/etc/rc.d/${pkgname}
  # create config sample and folder
  install -D -m755 ${srcdir}/linux_mtp_streaming_server-$pkgver/data/mtpserver.ini.sample ${pkgdir}/etc/${pkgname}/mtpserver.ini

}


#[root@workstation64 ~]# /usr/bin/linux_mtp_streaming_server -h
#Linux_MTPServer 1.1.2 (Linux)
#Usage:			linux_mtp_streaming_server
#			[-i mtpcenter main directory]
#			[-d daemon mode]
#			[-D Debug]
#			[-U UPNP Debug]
#			[-p path of mtpserver.ini configuration file]
#			[-P path and name of PID file]
#			[-l path for mtpserver logging files]
#			[-h this help screen]
#
#You need to use the -i option with path to Linux MTPCenter
