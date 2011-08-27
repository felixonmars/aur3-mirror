# Contributor: Jakub Ruzicka <yaccobb@centrum.cz>
# Contributor: Javier ‘Phrodo_00’ Aravena <phrodo.00@gmail.com>
# Remake for bauerbill: strafer <strafer at ufaley dot su>

pkgname=zsh-bauerbill
pkgver=0.2.3
pkgrel=1
pkgdesc="ZSH functions to tab-complete repo package names for bauerbill (using sources from zsh-yaourt package)."
url="http://www.zsh.org/"
depends=(zsh)
source=(http://aur.archlinux.org/packages/zsh-yaourt/zsh-yaourt/_yaourt)
arch=('i686' 'x86_64')
license=('GPL')

build() {
  cp $srcdir/_yaourt $srcdir/_bauerbill
  sed -i 's/yaourt/bauerbill/g' $srcdir/_bauerbill

  mkdir -p $startdir/pkg/usr/share/zsh/site-functions/

  cd $srcdir
  install -m644 _bauerbill $startdir/pkg/usr/share/zsh/site-functions/_bauerbill
}
md5sums=('59f0f4ef24e736b484d6e4788ef03c39')
