# Contributor: Gerhard Brauer <gerbra@archlinux.de>
# Contributor: Richard Murri <admin@richardmurri.com>
pkgname=x2goserver-one
pkgver=3.0.1_5
_dashes=${pkgver//_/-}
pkgrel=2
pkgdesc="x2go server (single node edition)"
arch=(i686 x86_64)
license=('GPL')
url="http://x2go.berlios.de"
depends=(x2goagent sqlite3 sshfs sudo)
install=x2goserver.install
conflicts=x2goserver
source=(http://x2go.obviously-nice.de/deb/pool-lenny/x2goserver/x2goserver_${_dashes}.tar.gz
        x2gostartagent.patch
        x2goserver.rc)
groups=('x2go' 'alts')
md5sums=('08f6f00b7043e998113443a57fbd091b'
         '3f4304e2e85941480a7b8eb5496b61bd'
         '4b7ffae496f4727c58237303af9edff1')

build() {
  cd "$srcdir/x2goserver-${_dashes%-*}"
  patch -Np0 < $srcdir/x2gostartagent.patch

  install -Dm755 $srcdir/x2goserver.rc ${pkgdir}/etc/rc.d/x2goserver

  install -Dm755 x2gocleansessions ${pkgdir}/usr/sbin/x2gocleansessions
  install -Dm755 x2gocmdexitmessage ${pkgdir}/usr/bin/x2gocmdexitmessage
  install -Dm755 x2gogetservers ${pkgdir}/usr/bin/x2gogetservers
  install -Dm755 x2golistsessions ${pkgdir}/usr/bin/x2golistsessions
  install -Dm755 x2golistsessions_root ${pkgdir}/usr/bin/x2golistsessions_root
  install -Dm755 x2golistsessions_sql ${pkgdir}/usr/bin/x2golistsessions_sql
  install -Dm755 x2gomountdirs ${pkgdir}/usr/bin/x2gomountdirs
  install -Dm755 x2gopgwrapper ${pkgdir}/usr/bin/x2gopgwrapper
  install -Dm755 x2gopgwrapper_sqlite ${pkgdir}/usr/bin/x2gopgwrapper_sqlite
  install -Dm755 x2goresume-session ${pkgdir}/usr/bin/x2goresume-session
  install -Dm755 x2goruncommand ${pkgdir}/usr/bin/x2goruncommand
  install -Dm755 x2gosessionlimit ${pkgdir}/usr/bin/x2gosessionlimit
  install -Dm755 x2goshowblocks ${pkgdir}/usr/bin/x2goshowblocks
  install -Dm755 x2gostartagent ${pkgdir}/usr/bin/x2gostartagent
  install -Dm755 x2gosuspend-agent ${pkgdir}/usr/bin/x2gosuspend-agent
  install -Dm755 x2gosuspend-session ${pkgdir}/usr/bin/x2gosuspend-session
  install -Dm755 x2goterminate ${pkgdir}/usr/bin/x2goterminate
  install -Dm755 x2goterminate-session ${pkgdir}/usr/bin/x2goterminate-session
  install -Dm755 x2goumount ${pkgdir}/usr/bin/x2goumount
  install -Dm755 x2goumount_session ${pkgdir}/usr/bin/x2goumount_session

  # setup sqlite files
  echo -n sqlite > sql
  install -Dm755 sql ${pkgdir}/etc/x2go/sql
  install -Dm755 x2gosqlite.sh ${pkgdir}/usr/lib/x2go/x2gosqlite.sh
  sed -i 's/sqlite/sqlite3/g' ${pkgdir}/usr/lib/x2go/x2gosqlite.sh
  sed -i 's/sqlite/sqlite3/g' ${pkgdir}/usr/bin/x2gopgwrapper_sqlite
}
