# Submitter: helq <linuxero789@gmail.com>

pkgname=lightdm-webkit-y-combinator
pkgver=20130301
pkgrel=1
pkgdesc="LightDM Lambda Greeter"
arch=('i686' 'x86_64')
url="https://github.com/snowmantw/lightdm-webkit-Y-combinator"
license=('GPL')
depends=('lightdm-webkit-greeter')
makedepends=('git')
provides=()
conflicts=()
install=$pkgname.install

_gitroot='git://github.com/snowmantw/lightdm-webkit-Y-combinator.git'
_gitname='lightdm-webkit-y-combinator'

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [[ -d "${_gitname}" ]]; then
    cd "${_gitname}" && git pull origin
    msg "The local files are updated."
  else
    git clone "${_gitroot}" "${_gitname}"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

}

package() {
  cd "${srcdir}/${_gitname}"
  install -dm755 "${pkgdir}/usr/share/lightdm-webkit/themes/${pkgname}/"
  install -m644 index.html index.theme jquery.min.js theme.js underscore-min.js \
      "${pkgdir}/usr/share/lightdm-webkit/themes/${pkgname}/"
}

