# Maintainer: Andrwe Lord Weber <lord-weber-andrwe at andrwe dot org>
pkgname=palava-portal-git
_gitname="palava-portal"
_gitroot="https://github.com/palavatv/${_gitname}.git"
pkgver=20140125
pkgrel=2
pkgdesc="Webinterface for palava"
arch=('i686' 'x86_64' 'armv6h')
url="https://palava.tv/"
license=('MIT')
groups=('pavala')
optdepends=("nginx: webserver for providing the webinterface (example config in /usr/share/doc/${_gitname}/)")
makedepends=('git' 'ruby' 'ruby-bundler' 'python' 'python2' )
provides=("${_gitname}")
install="${_gitname}".install
source=('nginx.example.conf' 'set-palava-url.sh')
md5sums=('41ef6999f9ff10251ef6d1c7b790fd76'
         '6e8f45f549bcbeedfc8afd4fc6d3cc7c')

build() {
  cd "${srcdir}"
  msg "Getting sources of ${_gitname} ..."

  if [[ -d "${_gitname}" ]] ; then
    cd "${_gitname}" && git pull origin
    msg "The local files are updated."
  else
    git clone "${_gitroot}" "${_gitname}"
    cd $_gitname
    git submodule init
    git submodule update
  fi
  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "${srcdir}/${_gitname}-build"
  # --recursive is used to clone submodules too
  git clone --recursive "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  cd "${srcdir}/${_gitname}-build"

  bundle install --without development:test --deployment --path ./ || return 1
  msg "build static palava-portal, this can take some time..."
  export PALAVA_BASE_ADDRESS="https://CH4NGEMEBASE"
  export PALAVA_RTC_ADDRESS="wss://CH4NGEMERTC/info/machine"
  export PALAVA_STUN_ADDRESS="stun:CH4NGEMESTUN"
  bundle exec middleman build

}

package() {
  cd "${srcdir}/${_gitname}-build"
  # create structure like the one used by e.g. roundcubemail although it does not match https://wiki.archlinux.org/index.php/Fhs
  install -m755 -d "${pkgdir}/usr/share/doc/${_gitname}"
  install -m644 -t "${pkgdir}/usr/share/doc/${_gitname}" "${srcdir}"/nginx.example.conf "${srcdir}/set-palava-url.sh" LICENSE README.md
  install -m755 -d "${pkgdir}/usr/share/webapps/${_gitname}"
  cp -r build/* "${pkgdir}/usr/share/webapps/${_gitname}/"
}

# vim:ts=2:et
