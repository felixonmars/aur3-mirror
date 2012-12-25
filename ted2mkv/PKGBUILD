# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/Python_Package_Guidelines for more
# information on Python packaging.

# Maintainer: Colin Shea <colin@evaryont.me>
pkgname=ted2mkv
pkgver=20121224
pkgrel=1
pkgdesc="Downloads and converts TED videos to MKV format"
arch=('any')
url="https://github.com/oxplot/ted2mkv"
license=('GPL3')
depends=('python2' 'mkvtoolnix-cli')

_gitroot=https://github.com/oxplot/ted2mkv
_gitname=ted2mkv

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
}

package() {
  cd "$srcdir/$_gitname"
  mkdir -p $pkgdir/usr/bin
  cp ted2mkv.py $pkgdir/usr/bin/ted2mkv
  chmod 755 $pkgdir/usr/bin/ted2mkv
  cp get-full-list.py $pkgdir/usr/bin/ted-get-full-list
  chmod 755 $pkgdir/usr/bin/ted-get-full-list
  sed -i 's/env python$/&2/' $pkgdir/usr/bin/*
}

# vim:set ts=2 sw=2 et:
