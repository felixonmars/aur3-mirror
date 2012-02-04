# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=cdgtools
pkgver=0.3.2
pkgrel=2
pkgdesc="A suite of tools for handling CD+G karaoke disks and files"
arch=('any')
url="http://www.kibosh.org/$pkgname/"
license=('LGPL')
depends=('wxpython' 'cdrdao' 'lame' 'vorbis-tools')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('8207b8c8d06a9c31b85ed0674a192547')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Python2 fix
  sed -i "s|bin/python|&2|;s|env python|&2|" *.py
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/bin"

  for i in *.py; do
    install -Dm755 $i "$pkgdir/usr/lib/python2.7/$i"
    ln -s /usr/lib/python2.7/$i "$pkgdir/usr/bin/${i/.py}"
  done
}
