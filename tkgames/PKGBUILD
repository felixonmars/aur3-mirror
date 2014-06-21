# Maintainer: Brad Conte <brad AT bradconte.com >
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=tkgames
pkgver=1.2
pkgrel=1
#epoch=
pkgdesc="Games written in tcl/tk: Polypuzzle, Hearts, Spider, Yahtzee and others"
arch=('any')
url="http://tkgames.sourceforge.net/"
license=('GPL')
groups=()
depends=('tk')
makedepends=()
checkdepends=()
optdepends=('bash: for some scripts')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=$pkgname.install
#changelog=
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tgz)
noextract=()
sha512sums=('354a4f8544f30698feab4e0790798b2c927e1d6d1d40b91142c28a964099e1fc3c8730a9fccc0e187861a2aa9f37afe78712ba831e22d6dfc398bc392e333639')

_games=('tkhearts-0.91' 'tkspider-1.1' 'tktk-1.0' 'tktp-1.0' 'tkyahtzee-1.2.4'
        'polypuzzle/polypuzzle' 'tkhangman/tkhangman' 'tksol/tksol'
		'tksol/tksol_green')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # some fixes
  chmod 755 tkhangman
  sed -i "s,/usr/local/lib,/usr/share/$pkgname,g" \
    polypuzzle/polypuzzle tkhangman/tkhangman tksol/tksol
  sed -i "s,\[pwd\],/usr/share/$pkgname/tksol,g" \
    tksol/tksol_green
}

#build(){
#}

#check() {
#}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # install launchers
  for _source in ${_games[*]}; do
    _dest=${_source#*/} && _dest=${_dest%-*}
    install -Dm755 $_source "$pkgdir"/usr/bin/$_dest
  done

  # install data
  rm -f polypuzzle/polypuzzle
  mkdir -p "$pkgdir"/usr/share/$pkgname/{tkhangman,tksol}
  cp -rf -t "$pkgdir"/usr/share/$pkgname           polypuzzle
  cp -rf -t "$pkgdir"/usr/share/$pkgname/tkhangman tkhangman/{pictures,words}
  cp -rf -t "$pkgdir"/usr/share/$pkgname/tksol     tksol/{cardbacks,cards,pictures,*.xbm}

  # set permissions
  find "$pkgdir"/usr/share/$pkgname -type d -exec chmod 755 {} +
  find "$pkgdir"/usr/share/$pkgname -type f -exec chmod 644 {} +

  # install docs and manuals
  install -Dm644 tkhangman/README "$pkgdir"/usr/share/doc/$pkgname/tkhangman_README
  install -Dm644 tksol/readme     "$pkgdir"/usr/share/doc/$pkgname/tksol_README
  install -Dm644 tksol/tksol.6    "$pkgdir"/usr/share/man/man6/tksol.6
}
