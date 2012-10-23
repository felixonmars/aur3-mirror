# Contributor: Daniel Mills <dm@e36freak.com>

pkgname=meat-git
pkgver=20121023
pkgrel=1
pkgdesc="Bash wrapper for Cower"
arch=('i686' 'x86_64')
url="http://github.com/e36freak/meat"
license=('MIT')
depends=('bash>=4.0' 'cower' 'awk')
makedepends=('git')
optdepends=('pacman-color: colorized output'
            'sudo: highly recommended')
_gitroot='http://github.com/e36freak/meat.git'
_gitname='meat'

build() {
  cd "$scrdir"
  msg "Connecting to GIT server...."

  if [[ -d $_gitname ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
    cd "$_gitname"
  fi

  install -m 755 -D meat "$pkgdir/usr/bin/meat"
  install -m 644 -D config "$pkgdir/usr/share/meat/config"
}

# vim: ft=sh syn=sh et
