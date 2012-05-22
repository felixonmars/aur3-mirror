# Maintainer: speps <speps at aur at archlinux dot org>

pkgname=cecilia4
pkgver=4.2_beta
pkgrel=2
pkgdesc="An audio signal processing environment using Csound as its audio engine. Python rewrite."
arch=('any')
url="http://code.google.com/p/cecilia4/"
license=('GPL')
depends=('csound' 'python2-pyaudio' 'python2-pyo' 'wxpython')
install="$pkgname.install"
source=("http://cecilia4.googlecode.com/files/Cecilia_$pkgver-src.tar.bz2"
        $pkgname.{sh,desktop} "${url}logo")
md5sums=('a0c1fc7a3bec3f75d0a8674cf164e062'
         'a05ece457381cf0b0de5585e961657f3'
         'f3f3896e4706562f41c5900b1a3f616d'
         '85b54c95a8b7ff6eb477f83f81b465d8')

package() {
  cd "$srcdir/Cecilia_$pkgver-src"

  # bin
  install -Dm755 ../$pkgname.sh \
    "$pkgdir/usr/bin/$pkgname"

  # data
  install -d "$pkgdir/usr/share/$pkgname"
  cp -a Cecilia.py doc Resources tests \
    "$pkgdir/usr/share/$pkgname"

  # desktop file
  install -Dm 644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # icon
  install -Dm 644 ../logo \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"

  # python2 fix
  sed -i "s|env python|&2|" `find "$pkgdir" -name "*.py"`
}

# vim:set ts=2 sw=2 et:
