# Maintainer: Giancarlo Bianchi <giancarlobianchi76@gmail.com>

pkgname=realtimeconfigquickscan
pkgver=20130403
pkgrel=2
pkgdesc="Inspect a linux system configuration and make suggestions for improving realtime performance."
arch=('any')
url="https://github.com/raboof/realtimeconfigquickscan"
license=('GPL')
depends=('jack' 'perl' 'perl-tk')
makedepends=('git')
conflicts=('realtimeconfigquickscan-git' 'realtimeconfigquickscan-hg')

_gitroot=https://github.com/raboof/realtimeconfigquickscan.git
_gitname=$pkgname

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
}

package() {
  cd "$srcdir/$_gitname-build"

  install -dm 0755 "$pkgdir/usr/share/$pkgname"
  install -dm 0755 "$pkgdir/usr/bin/"

  # Data files
  for i in *; do
    install -m 0644 "$i" "$pkgdir/usr/share/$pkgname/$i"
  done

  # Bin1
  cat << EOF > "$pkgdir/usr/bin/realTimeConfigQuickScan"
#!/bin/bash
set -e
cd /usr/share/$pkgname
exec perl realTimeConfigQuickScan.pl
EOF
  chmod 755 "$pkgdir/usr/bin/realTimeConfigQuickScan"

  # Bin2
  cat << EOF > "$pkgdir/usr/bin/QuickScan"
#!/bin/bash
set -e
cd /usr/share/$pkgname
exec perl QuickScan.pl
EOF
  chmod 755 "$pkgdir/usr/bin/QuickScan"

}

# vim:set ts=2 sw=2 et:
