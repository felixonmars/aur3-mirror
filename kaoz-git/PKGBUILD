# Maintainer: Arthur Darcet <arthur.darcet@m4x.org>

pkgname=kaoz-git
pkgver=20130314
pkgrel=2
pkgdesc="IRC notifier in python by Binet Réseau"
arch=('any')
url="https://github.com/BinetReseau/kaoz"
license=('MIT')
depends=('python' 'python-irc')
makedepends=('git')
optdepends=('python-openssl: To use SSL between server and clients' 'kaoz-clients-git: Client script to interface with pam, nagios, …')
source=('kaoz.service')
md5sums=('8a1c7986f1efd741285523e0bda61843')
backup=('etc/kaoz.conf')
conflicts=('kaoz')
provides=('kaoz')

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
    cd "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."
  python setup.py install --prefix=/usr --root="$pkgdir" || return 1
}

package() {
  install -Dm640 "${srcdir}/${_gitname}/kaoz.example.conf" "${pkgdir}/etc/kaoz.conf"
  install -Dm644 ../kaoz.service "${pkgdir}/usr/lib/systemd/system/kaoz.service"
}
