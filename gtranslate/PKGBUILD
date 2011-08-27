# Maintainer: Otto Sabart <seberm[at]gmail[dot]com>
# Script author: MRashad10 <http://www.linuxac.org/forum/showthread.php?51755-%DE%C7%E3%E6%D3-%DD%ED-%D3%D8%D1-%C7%E1%C3%E6%C7%E3%D1-..&p=406975#post406975>

pkgname=gtranslate
pkgver=0.1
pkgrel=2
pkgdesc="Script for google translation"
url="http://www.howtoforge.com/using-google-translate-from-the-command-line"
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('lynx')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(gtranslate)

md5sums=('1cd420bbcd7fc8ffaed5f1c60d45bbce')

package() {
	
    install -D -m755 $srcdir/$pkgname "${pkgdir}/usr/sbin/${pkgname}"
}
