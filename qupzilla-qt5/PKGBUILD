# Maintainer: speps <speps at aur dot archlinux dot org>

_name=qupzilla
pkgname=qupzilla-qt5
pkgver=1.4.4
pkgrel=1
pkgdesc="Cross-platform QtWebKit browser (Qt5)"
arch=(i686 x86_64)
url="http://www.qupzilla.com/"
license=('GPL3')
depends=('qt5-webkit' 'qt5-script' 'hunspell' 'desktop-file-utils')
optdepends=('bash-completion: bash completion support')
provides=('qupzilla')
conflicts=('qupzilla')
install="qupzilla.install"
source=("qupzilla-$pkgver.tar.gz::https://github.com/QupZilla/qupzilla/tarball/v$pkgver")
md5sums=('cfbf5cd23d184275c389c79a39a28631')

build() {
  cd "$srcdir/QupZilla-qupzilla-"*

  # enable webgl support
  export USE_WEBGL=true

  qmake QUPZILLA_PREFIX=/usr/
  make
}

package() {
  cd "$srcdir/QupZilla-qupzilla-"*
  make INSTALL_ROOT="$pkgdir/" install

  # zsh completion
  install -Dm644 linux/completion/zsh_completion.sh \
    "$pkgdir/usr/share/zsh/site-functions/_qupzilla"
}

# vim:set ts=2 sw=2 et:
