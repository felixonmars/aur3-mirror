# Maintainer: FadeMind <fademind@gmail.com>

pkgname=kdeicons-faenzaflattr-green
pkgver=1.4.5
pkgrel=2
_git=f9a143e335d8d7a3271bb392454dc8577be9dbc3
pkgdesc="A mix of Faenza and Flattr icon theme. Green variant."
arch=('any')
url="https://github.com/fademind/faenzaflattr-green"
license=('CCPL')
optdepends=('kdebase-workspace: for KDE4'
            'plasma-workspace: for KF5')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/fademind/faenzaflattr-green/archive/$_git.tar.gz")
sha256sums=('SKIP')

package() {
   cd faenzaflattr-green-$_git
   install -dm755  $pkgdir/usr/share/icons/FaenzaFlattr-Green
   cp -rf  * $pkgdir/usr/share/icons/FaenzaFlattr-Green
}