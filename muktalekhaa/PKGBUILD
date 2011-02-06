# Maintainer: PDG ~sHyLoCk~ <pdg@archlinux.us>
pkgname=muktalekhaa
pkgver=1.2
pkgrel=1
pkgdesc="A Bangla Phonetic Text Editor"
arch=('i686' 'x86_64')
url="http://code.google.com/p/muktalekhaa"
license=('GPL')
depends=('python>=2.5' 'wxpython>=2.8' 'ttf-freebanglafont>=0.5-6')
source=(http://muktalekhaa.googlecode.com/files/$pkgname-editor-$pkgver.tar.gz)
md5sums=('d5a5f2abf8d1d46295a2ca29faf265a0')
install=muktalekhaa.install
build() {
  cd "$srcdir/$pkgname"
  install -d -m755 $pkgdir/usr/share/ || return 1
  mv ../muktalekhaa/ $pkgdir/usr/share/ || return 1
  install -D -m755 ../muktalekhaa/muktalekhaa.run \
  $pkgdir/usr/bin/muktalekhaa || return 1
  install -D -m644 ../muktalekhaa/muktalekhaa.desktop \
  $pkgdir/usr/share/applications/$pkgname.desktop || return 1
}