# Maintainer: Ray Rashif <schiv@archlinux.org>

pkgname=flyback
pkgver=0.6.5_1
_debname=flyback-lucid
_realver=0.6.5-1
pkgrel=2
pkgdesc="Backup utility inspired by Apple's Time Machine"
url="http://code.google.com/p/flyback/"
license=('GPL')
arch=(any)
depends=('git' 'libglade' 'gnome-python')
source=(http://$pkgname.googlecode.com/files/${_debname}_${_realver}_all.deb
        $pkgname.sh)
md5sums=('119986044290d9933ec092d6518b2e60'
         'efc753a41a35258ba0b99bc1f8fcbd83')

package() {
  cd "$srcdir"

  # unpack
  [ -d $pkgname-build ] && rm -rf $pkgname-build
  mkdir $pkgname-build
  bsdtar -xf data.tar.gz -C $pkgname-build/

  # move stuff around
  cp -a $pkgname-build/* "$pkgdir/"
  install -Dm755 "$srcdir/$pkgname.sh" \
    "$pkgdir/usr/bin/$pkgname"

  # python2 fix
  cd "$pkgdir"

  sed -i 's:usr/bin/python:usr/bin/python2:' \
    usr/share/$pkgname/$pkgname.py

  # remove redundant dir
  rm -r usr/sbin
}

# vim:set ts=2 sw=2 et:
