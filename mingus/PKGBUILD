# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Orivej Desh <smpuj@bk.ru>

pkgname=mingus
pkgver=0.4.2.3
pkgrel=2
pkgdesc="An advanced music theory and notation package for Python with MIDI playback support"
arch=('any')
url="http://code.google.com/p/mingus/"
license=("GPL3")
depends=("python2-numpy")
optdepends=('fluidsynth: MIDI playback support'
            'lilypond: create sheet music')
source=("http://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('ef1c3a9a2b4e39806018988c62413328')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # share path fix
  sed -i "s|('\(mingus_examples\)|('share/mingus/\1|" setup.py

  python2 setup.py install --root="$pkgdir"

  # python2 fix
  sed -i "s|env python$|&2|" `grep -rl "env python" "$pkgdir/"`
}
