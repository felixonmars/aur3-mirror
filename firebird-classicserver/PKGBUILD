# Maintainer: Libernux <dutchman55@gmx.com>
pkgname=firebird-classicserver
_pkgver=2.5.2.26540
_buildver=0
pkgver=${_pkgver}_${_buildver}
pkgrel=1
pkgdesc="A open source SQL relational database management system (RDMS)"
arch=(i686 x86_64)
url="http://www.firebirdsql.org/"
license=('IPL IDPL')
provides=("libfbclient=${_pkgver}")
depends=()
conflicts=('firebird-superserver' 'libfbclient')
install=firebird-classicserver.install

_arch=i686
[[ "$CARCH" == x86_64 ]] && _arch=amd64

_filename="FirebirdCS-${_pkgver}-${_buildver}.${_arch}"
source=("http://downloads.sourceforge.net/firebird/${_filename}.tar.gz"
        'firebird-tmpfiles.conf'
        'firebird-systemd.service')
md5sums=('c6d6ba8328a041f3622577c16435009d'
         '98eff99fd8d195a45c251610d67bd473'
         'e9a658e0dfef0646de5706a100dbd6a6')       

[[ "$CARCH" == x86_64 ]] && md5sums[0]='5ca9cd7097122ed09c84cdcb31c9752f'

package() {
  cd "$srcdir/${_filename}"

  msg "Extracting firebird"
  tar -xzof buildroot.tar.gz -C $pkgdir

  [[ "$CARCH" == x86_64 ]] &&  mv $pkgdir/usr/lib64/ $pkgdir/usr/lib/

  install -Dm644 $srcdir/firebird-systemd.service $pkgdir/usr/lib/systemd/system/firebird.service
  install -Dm644 $srcdir/firebird-tmpfiles.conf $pkgdir/usr/lib/tmpfiles.d/firebird.conf

  touch $pkgdir/opt/firebird/{fb_guard,firebird.log}
 
  chmod u=rw,go= $pkgdir/opt/firebird/{fb_guard,firebird.log,security2.fdb,examples/empbuild/*.fdb}

  cat << EOT > $pkgdir/opt/firebird/SYSDBA.password
# This is the default password
# You should change this password at the earliest oportunity
# Your password can be changed to a more suitable one using the
# /opt/firebird/bin/gsec utility
ISC_USER=SYSDBA
ISC_PASSWD=masterkey
EOT

  chmod u=r,go= $pkgdir/opt/firebird/SYSDBA.password

}

# vim:set ts=2 sw=2 et:
