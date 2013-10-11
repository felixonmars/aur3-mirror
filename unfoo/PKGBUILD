# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: Nathan Owe <ndowens04 at gmail>

pkgname=unfoo
pkgver=1.0.7
pkgrel=1
pkgdesc="A tiny sh(1) wrapper to simplify file decompression"
arch=('i686' 'x86_64')
url="http://obsoleet.org/code/unfoo/"
license=('BSD')
depends=('bash')
optdepends=('bzip2: bz2 support'
            'gzip:  gz support'
            'p7zip: 7zip support'
            'tar:   tar support'
            'unace: ace support'
            'unrar: rar support'
            'unzip: zip support')
source=(https://github.com/vitaminmoo/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('0c0c1692c66a78ef673a5b1b5248184923782e375184a1d532330501e512f6ff')

package() {
  cd $pkgname-$pkgver
  sed -n '4,10 s/# //p' $pkgname > COPYING
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
