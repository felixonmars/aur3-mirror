# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: archtux <antonio.arias99999@gmail.com>

_commit=28117581010b
pkgname=gsharkdown
pkgver=0.7.1
pkgrel=1
pkgdesc="Application for downloading and playing music from grooveshark.com"
arch=('any')
url="https://bitbucket.org/vkolev/gsharkdown"
license=('GPL3')
depends=('gstreamer0.10-python' 'python2-configobj' 'python2-dbus' 'python2-pycurl' 'libproxy')
optdepends=('python2-pylast: last.fm support'
            'python2-notify: notification support'
            'xdg-user-dirs: autodetect xdg music dir'
            'libappindicator: indicator integration')
install="$pkgname.install"
source=("$url/get/$_commit.tar.bz2" $pkgname.{desktop,sh})
md5sums=('33bfac45ab16d7a0ca5232646f53004f'
         '81869090135791eba7e658619f4eafdd'
         'ede76e8bd3dcb1156e01f377a6c49cac')

prepare() {
  cd vkolev-$pkgname-$_commit

  # suggest to install python2-pylast
  sed "s/pip install /pacman -S python2-/" \
      -i data/*.ui po/*.po* $pkgname.py

  # python2 shebang
  sed -i "s|env python|&2|" {,lib/}*.py
}

package() {
  cd vkolev-$pkgname-$_commit

  # bin
  install -Dm755 ../$pkgname.sh \
    "$pkgdir/usr/bin/$pkgname"

  # data
  install -d "$pkgdir/usr/share/$pkgname"
  cp -a * "$pkgdir/usr/share/$pkgname"

  # icon
  install -Dm644 data/gsharkdown_64.png \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"

  # desktop file
  install -Dm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}
