# Maintainer: Arthur Darcet <arthur.darcet@m4x.org>

pkgname=kaoz-clients-git
pkgver=20130316
pkgrel=2
pkgdesc="Client scripts for kaoz (IRC notifier in python by Binet Réseau)"
arch=('any')
url="https://github.com/arthurdarcet/kaoz-clients.git"
license=('MIT')
depends=('socat')
makedepends=('git')
optdepends=('kaoz-git: Needs to be installed somewhere in your network')
install='kaoz-clients.install'
backup=('usr/share/kaoz-clients/config.sh')
conflicts=('kaoz-clients')
provides=('kaoz-clients')

_gitroot=${url}
_gitname=${pkgname}

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi
}

package() {
  mkdir -p "${pkgdir}/usr/share"
  cp -r "${srcdir}/$_gitname" "${pkgdir}/usr/share/kaoz-clients"
  rm -r "${pkgdir}/usr/share/kaoz-clients/.git"
}
