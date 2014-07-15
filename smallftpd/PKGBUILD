# Maintainer: Herbert Knapp <herbert.knapp at edu.uni-graz.at>
pkgname=smallftpd
pkgver=1.0.3
pkgrel=1
pkgdesc="Smallftpd is a simple, small and free GUI FTP server"
arch=(any)
url="http://smallftpd.sourceforge.net/"
license=('unknown')
depends=(wine)
noextract=("smallftpd-1.0.3-fix.zip")
source=(smallftpd 'http://downloads.sourceforge.net/project/smallftpd/smallftpd/smallftpd-1.0.3-fix/smallftpd-1.0.3-fix.zip')
md5sums=('7f6bc45d372299a0374a79e5772562c2' '614fd5fb449605ce896af7b5c4ae31a5')

build() {
  mkdir -p "$srcdir/s"
  cd "$srcdir/s/"
  bsdtar xf "$srcdir/smallftpd-1.0.3-fix.zip"
}

package() {
  install -Dm755 "$srcdir/smallftpd" "$pkgdir/usr/bin/smallftpd"
  install -dm755 "$pkgdir/usr/share"
  mv "$srcdir/s" "$pkgdir/usr/share/smallftpd"
  if [ ! -s /usr/share/smallftpd/ftpd.ini ]; then 
    touch "$pkgdir/usr/share/smallftpd/ftpd.ini"
    chmod 666 "$pkgdir/usr/share/smallftpd/ftpd.ini"
  fi
}

# vim:set ts=2 sw=2 et: