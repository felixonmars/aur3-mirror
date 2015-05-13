# Maintainer: mody <modywzm at gmail dot com>
# Contributor: mody <modywzm at gmail dot com>

_pkgbase=sqlitestudio
pkgname=sqlitestudio-bin
pkgver=3.0.6
pkgrel=1
pkgdesc="Database manager for SQLite 3.x, running on Windows and Linux."
url="http://sqlitestudio.pl/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('libxft' 'libxss')
provides=('sqlitestudio')
options=(!strip)

case "$CARCH" in
    i686|i[3-5]86) 
        _md5sum='570320925cf7e016d12246bc8813c15b'
        _arch='32'
    ;;
    x86_64|amd64) 
        _md5sum='408cc582d0178071417aa43248149488'
        _arch='64'
    ;;
    *) error "Unknown or invalid CARCH=$CARCH"; exit 1
esac

md5sums=("$_md5sum"
         'faeaeb2744a050520cddd76bcbeebee4'
         '569e08dd873920bf7dba6366ff884cc1')
source=("http://sqlitestudio.pl/files/sqlitestudio3/complete/linux${_arch}/${_pkgbase}-${pkgver}.tar.xz"
        "sqlitestudio.png" "sqlitestudio.desktop")

package() {
  install -Dm644 sqlitestudio.png $pkgdir/usr/share/pixmaps/sqlitestudio.png
  install -Dm644 sqlitestudio.desktop $pkgdir/usr/share/applications/sqlitestudio.desktop
  echo -e "#!/bin/bash\n/usr/share/sqlitestudio/sqlitestudio" > $srcdir/sqlitestudio
  echo -e "#!/bin/bash\n/usr/share/sqlitestudio/sqlitestudiocli" > $srcdir/sqlitestudiocli
  install -Dm755 $srcdir/sqlitestudio $pkgdir/usr/bin/sqlitestudio
  install -Dm755 $srcdir/sqlitestudiocli $pkgdir/usr/bin/sqlitestudiocli
  cp -r "$srcdir/SQLiteStudio" $pkgdir/usr/share/sqlitestudio/
}
