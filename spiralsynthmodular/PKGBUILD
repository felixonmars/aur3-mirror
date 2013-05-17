# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Flemming Madsen (arch at themadsens dot dk)

pkgname=spiralsynthmodular
pkgver=0.2.3_git
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Object orientated modular softsynth, sequencer and sampler"
url="http://www.pawfal.org/Software/SSM"
license="GPL"
depends=('fltk' 'jack')
makedepends=('ladspa' 'raptor1' 'liblrdf')
install="$pkgname.install"
source=("http://repo.or.cz/w/spiralsynthmodular.git/snapshot/aee76c9b338dd102cbfef1ca33815bedd8060403.tar.gz" "$pkgname.patch")
#source=("http://downloads.sourceforge.net/project/spiralmodular/spiralmodular/0.2.2a%20%28Latest%20Version%29/spiralmodular-${pkgver}.tar.bz2")
md5sums=('cb76653948c3f0ad151331d56fb70c5a'
         '79b107684ea6c003d4ba5adce4f0052c')

prepare() {
  cd "$srcdir/$pkgname"
  patch -p1 -i ../${source[1]}
}

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make prefix="$pkgdir/usr" install

  # examples
  install -d "$pkgdir/usr/share/SpiralSynth"
  cp -a Examples "$pkgdir/usr/share/SpiralSynth"
}
