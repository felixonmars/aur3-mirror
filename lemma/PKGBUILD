# Maintainer: SpepS <dreamspepser at yahoo dot it>
# Contributor: Eric Forgeot < http://ifiction.free.fr >

pkgname=lemma
pkgver=0.9a
pkgrel=3
pkgdesc="A simple GUI front-end written in Python for MMA (Musical MIDI Accompaniment)"
arch=('any')
url="http://welltemperedstudio.wordpress.com/code/lemma/"
license=('GPL')
depends=('python2' 'tk' 'mma')
optdepends=('python-pygame: sdl-mixer midi output')
install="$pkgname.install"
source=("http://xenon.stanford.edu/%7Egeksiong/code/lemma/LeMMA$pkgver.zip"
        "$pkgname.desktop" "$pkgname.png")
md5sums=('f7430cda43824950fab58a7058db17d0'
         'e7d62c55f904ffa848198ba70be3cca2'
         '44d9a1cc86e0422864e2756afef2eff4')

build() {
  cd "$srcdir"

  sed -i "s_\(python\).*_\12_" lemma.py
}

package() {
  cd "$srcdir"

  python2 install.py --prefix="$pkgdir/usr" --noprompt

  # Install desktop file and pixmaps
  install -Dm644 lemma.png "$pkgdir/usr/share/pixmaps/lemma.png"
  install -Dm644 lemma.desktop "$pkgdir/usr/share/applications/lemma.desktop"

  # Set right permissions
  find "$pkgdir/usr/share/lemma" -type f -exec chmod 644 {} \;
}
