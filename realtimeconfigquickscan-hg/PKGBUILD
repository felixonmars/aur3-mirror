# Maintainer: Giancarlo Bianchi <giancarlobianchi76@gmail.com>

pkgname=realtimeconfigquickscan-hg
_pkgname=realtimeconfigquickscan
pkgver=18
pkgrel=1
pkgdesc="Inspect a linux system configuration and make suggestions for improving realtime performance."
arch=('any')
url="http://code.google.com/p/realtimeconfigquickscan/"
license=('GPL')
depends=('jack' 'perl' 'perl-tk') 
conflicts=('realtimeconfigquickscan')
makedepends=('mercurial')

_hgroot="https://realtimeconfigquickscan.googlecode.com/hg/"
_hgrepo="realtimeconfigquickscan"

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u
    msg "The local files are updated."
  else
    hg clone $_hgroot $_hgrepo
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  cd "$srcdir/$_hgrepo"

  install -dm 0755 "$pkgdir/usr/share/$_pkgname"
  install -dm 0755 "$pkgdir/usr/bin/"

  # Data files
  for i in $srcdir/$_hgrepo/*; do
    install -m 0644 "$i" "$pkgdir/usr/share/$_pkgname/"
  done

  # Bin1
  cat << EOF > "$pkgdir/usr/bin/realTimeConfigQuickScan"
#!/bin/bash
set -e
cd /usr/share/$_pkgname
exec perl realTimeConfigQuickScan.pl
EOF
  chmod 755 "$pkgdir/usr/bin/realTimeConfigQuickScan"

  # Bin2
  cat << EOF > "$pkgdir/usr/bin/QuickScan"
#!/bin/bash
set -e
cd /usr/share/$_pkgname
exec perl QuickScan.pl
EOF
  chmod 755 "$pkgdir/usr/bin/QuickScan"
}
