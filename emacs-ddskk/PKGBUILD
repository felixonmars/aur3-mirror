# Maintainer: eagletmt <eagletmt@gmail.com>
pkgname=emacs-ddskk
_pkgname=ddskk
pkgver=15.1
pkgrel=1
pkgdesc='An Emacs Lisp version of SKK Japanese input method'
arch=('any')
url='http://openlab.ring.gr.jp/skk/ddskk-ja.html'
license=('GPL')
depends=('emacs')
optdepends=('skk-jisyo: large jisyo'
            'dbskk-cdb: SKK server')
source=(http://openlab.ring.gr.jp/skk/maintrunk/$_pkgname-$pkgver.tar.gz)
install=emacs-ddskk.install
_lispdir=/usr/share/emacs/site-lisp/skk
_infodir=/usr/share/info
_datadir=/usr/share/skk

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  cat >> SKK-CFG <<EOM
(setq APEL_DIR "/usr/share/emacs/site-lisp/apel")
(setq EMU_DIR "/usr/share/emacs/site-lisp/emu")
(setq SKK_DATADIR "$_datadir")
(setq SKK_INFODIR "$_infodir")
(setq SKK_LISPDIR "$_lispdir")
EOM
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  cat >> SKK-CFG <<EOM
(setq SKK_DATADIR "$pkgdir/$_datadir")
(setq SKK_INFODIR "$pkgdir/$_infodir")
(setq SKK_LISPDIR "$pkgdir/$_lispdir")
EOM
  make install
}

# vim:set ts=2 sw=2 et:
md5sums=('c33f335994b93ea91783bf5b42663f07')
