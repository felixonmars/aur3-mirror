# Maintainer: Ryan Peters <sloshy45 _AT_ sbcglobal _DOT_ net>

pkgname=minty-freshness-theme-git
pkgver=20110319
pkgrel=1
pkgdesc="A revamp of mint-x-theme for LMDE; uses murrine."
arch=('any')
url="https://github.com/SkiesOfAzel/mint-x-theme"
license=('GPL')
depends=('mint-x-icons' 'gtk-engine-murrine-git')

_gitroot=git://github.com/SkiesOfAzel/mint-x-theme.git
_gitname=mint-x-theme

build() {
  cd "$srcdir/"
  msg "Connecting to github.com GIT server..."
  if [ -d $startdir/src/$_gitname ] ; then
    cd $_gitname && git-pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi
  mkdir -p "$pkgdir/usr/share/themes"
  cp -r "mint-x-theme/usr/share/themes/Minty-Freshness" "$pkgdir/usr/share/themes"
}
# vim:syntax=sh
