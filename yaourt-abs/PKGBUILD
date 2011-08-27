# Author: Julien MISCHKOWITZ <wain@archlinux.fr>
# Contributor: Aliaksandr Stelmachonak <mail.avatar at gmail dot com>

pkgname=yaourt-abs
pkgver=0.9.3
pkgrel=1
pkgdesc="Fork of yaourt with patch for abs and more features comming..." 
arch=('any')
url="http://www.archlinux.fr/yaourt-en/" 
license=('GPL')
depends=('bash' 'gettext' 'wget' 'coreutils' 'diffutils' 'pacman' 'abs' 'patch') 
makedepends=()
optdepends=(
  'aurvote: vote for favorite packages from AUR for inclusion in [community]'
  'zsh-yaourt: ZSH functions to tab-complete repo package names for yaourt'
  'customizepkg-new: A tool to automatically modify PKGBUILD before makepkg'
)
conflicts=('yaourt' 'yaourt-git')
backup=(etc/yaourtrc)
install=yaourt.install
source=(http://dl.dropbox.com/u/4514366/${pkgname}-${pkgver}.tar.gz)
md5sums=('dc01d8570d867d354ac981d898bb1d8f')

build() { 
  cd $srcdir/${pkgname}-${pkgver}
  cp -R * $pkgdir 
}
