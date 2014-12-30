# Maintained by Sven-Hendrik Haase <sh@lutzhaase.com>
_pkgname=zgen
pkgname=$_pkgname-git
pkgver=r37.56a072d
pkgrel=1
pkgdesc="A lightweight plugin manager for ZSH inspired by Antigen"
arch=('any')
url="https://github.com/tarjoilija/zgen"
source=("git://github.com/tarjoilija/zgen.git")
md5sums=('SKIP')
license=('MIT')
depends=('zsh')
makedepends=('git')
install='zgen.install'

pkgver() {
  cd $srcdir/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd $srcdir/$_pkgname
    mkdir -p $pkgdir/usr/share/zsh/scripts/zgen
    cp -R ./ $pkgdir/usr/share/zsh/scripts/zgen
    cd $pkgdir/usr/share/zsh/scripts/zgen
    rm -R .git
}
