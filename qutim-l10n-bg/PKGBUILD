# Contributor: Borislav Gerassimov (slimmer) <borislavba (at) gmail.com>
pkgname=qutim-l10n-bg
pkgver=0
pkgrel=2
pkgdesc="Bulgarian localization for Qutim"
arch=('i686' 'x86_64')
url="http://qutim.org"
license=('GPL')
depends=('qutim')
source=('http://qutim.kiroff.org/translations/bg_BG/main.qm')
md5sums=('e1f6b05c66fae059d0f53883bd5b7b62')

build() {
  install -Dm644 $srcdir/main.qm \
		 $pkgdir/usr/share/qutim/languages/Bulgarian/main.qm || return 1
} 
