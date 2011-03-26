# Package: tss2_rc2
# Contributor: Jerry de Swart <JerrydeSwart@gmail.com>
pkgname=tss2_rc2
pkgver=2.0.24.1
pkgrel=4
pkgdesc="Closed source TeamSpeak voice-communication server - binary version"
arch=('x86_64' 'i686')
url="http://www.goteamspeak.com"
license=('custom')
depends=('sqlite3')
[[ "${CARCH}" == 'x86_64' ]] && depends=('sqlite3' 'lib32-glibc' 'lib32-gcc-libs')
makedepends=('patch')
install=tss2_rc2.install
source=('ftp://ftp.freenet.de/pub/4players/teamspeak.org/releases/ts2_server_rc2_202319.tar.bz2'
	'ftp://ftp.freenet.de/pub/4players/teamspeak.org/developer/server/202401/server_linux'
	'tss2.conf'
	'teamspeak2-server.patch'
	'tss2_rc2.install')
md5sums=('05e2bdec80eeed3d935eacb9ada3623e'
         '55dac0e5c05760f1e8232b32a2920db0'
         'bb707bd27db6d3142dd865ff485a9287'
         '93ffcc1534f51a7d021c46256d245e02'
         '844d93f1ea68f6821abdd35dc6cad46a')

build() {
  mkdir -p \
	$startdir/pkg/etc/rc.d \
	$startdir/pkg/opt \
	$startdir/pkg/var/run/tss2_rc2 \

# Moving files into their place
  cd $startdir/pkg/opt
  cp -R $srcdir/$pkgname .

  install -D -m755  $startdir/pkg/opt/$pkgname/teamspeak2-server_startscript $startdir/pkg/etc/rc.d/teamspeak2-server

  install -D -m644 "$srcdir/tss2.conf" "$pkgdir/etc/conf.d/tss2d" || return 1

# Overwriting the binary to the latest version (2.0.24.1)
  install -D -m755 $srcdir/server_linux $startdir/pkg/opt/$pkgname/server_linux

# Patching the initscript
  cd $startdir/pkg/etc/rc.d/
  patch -N < $srcdir/teamspeak2-server.patch || return 1

# Link license
  mkdir -p $startdir/pkg/usr/share/licenses/$pkgname
  ln -s /opt/$pkgname/LICENSE $startdir/pkg/usr/share/licenses/$pkgname/LICENSE

}
