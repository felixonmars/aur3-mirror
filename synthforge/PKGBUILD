# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: Philipp Überbacher <murks at lavabit dot com>

pkgname=synthforge
pkgver=0.3
pkgrel=2
pkgdesc="A modular synthesiser for creating audio synths and effects"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/synthforge/"
license=('GPL')
depends=('slv2' 'goocanvas1' 'desktop-file-utils')
makedepends=('libtool')
optdepends=('amb-plugins: ambisonic plugins'
            'njl-plugins: noise plugins'
            'mcp-plugins: phaser, chorus and moog vcf plugins'
            'rev-plugins: reverb plugins'
            'swh-plugins: Steve Harris plugins'
            'vco-plugins: oscillator plugins'
            'fil-plugins: equaliser plugins'
            'tap-plugins: toms audio plugins'
            'cmt: Computer Music Toolkit plugins'
            'vcf: EQ biquad plugins'
            'blop: bandlimited oscillator plugins'
            'pvoc: phase-vocoding plugins'
            'caps: the C* audio plugins'
            'mda-lv2: MDA port lv2 plugins'
            'll-plugins: Lars Luthman lv2 plugins'
            'lv2fil: four-band parametric lv2 plugins'
            'invada-studio-plugins: invada plugins'
            'invada-studio-plugins-lv2: invada lv2 plugins'
            'swh-lv2: Steve Harris port lv2 plugins') # and many others
options=('!libtool')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/sourceforge/synthforge/$pkgname-$pkgver.tar.gz"
        "$pkgname.desktop" "$pkgname.png")
md5sums=('2cc06fa83ce0765ce84a0774f9366839'
         '4ab97f0ae36db65374cb03e094981dc0'
         '8eef114ffac031644ecc1c2c6abb06fd')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  # desktop file
  install -Dm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # icon
  install -Dm644 ../$pkgname.png \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

# vim:set ts=2 sw=2 et:
