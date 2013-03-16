# Maintainer: Maxim Chervonny <fiskus@chervonny.ru>

pkgname=rndy-git
pkgver=20130316
pkgrel=1
pkgdesc="Utility for managing passwords"
arch=('any')
url="https://github.com/fiskus/rndy"
license=('MIT')
depends=('git' 'xclip')
optdepends=('zsh' 'python2-flask' 'gnupg')
provides=('rndy')
conflicts=('rndy')

_gitroot="git://github.com/fiskus/rndy.git"
_gitname="rndy"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
    cd $_gitname
  fi

  msg "GIT checkout done or server timeout"

  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/rndy
  mkdir -p ${pkgdir}/usr/share/webapps/rndy
  mkdir -p ${pkgdir}/usr/share/zsh/functions/Completion/Linux
  mkdir -p ${pkgdir}/usr/share/man/man1

  cp core/rndy ${pkgdir}/usr/bin/
  cp core/_rndy ${pkgdir}/usr/share/zsh/functions/Completion/Linux/
  cp -r cgi/* ${pkgdir}/usr/share/webapps/rndy/
  cp doc/rndy.1.gz ${pkgdir}/usr/share/man/man1/
}
