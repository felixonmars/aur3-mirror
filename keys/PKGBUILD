# Maintainer: Franco Bersani <franco dot bersani @at@ zoho .dot. com>
 
pkgname=keys
pkgver=1.0.0
pkgrel=1
pkgdesc="Password manager for linux systems with ncurses interface using strong GPG technology"
arch=('any')
url="https://sf.net/p/keys"
license=('GPL')
depends=('rdesktop' 'gnupg' 'xdotool' 'xsel' 'dialog' 'coreutils' 'sed' 'gawk' 'grep' 'sshpass')
optdepends=('firefox: default supported web browser used to open/logon to web sites with provided credentials')
source=(http://sourceforge.net/projects/keys/files/$pkgver/binaries/$pkgname-$pkgver.tar.gz)
md5sums=('a4b272cd591f46c3bd5dd1b8eb55ad11')
 
package() {
cp -r * "${pkgdir}"
rm "${pkgdir}"/$pkgname-$pkgver.tar.gz
} 