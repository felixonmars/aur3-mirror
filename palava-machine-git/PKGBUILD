# Maintainer: Andrwe Lord Weber <lord-weber-andrwe at andrwe dot org>
pkgname=palava-machine-git
_gitname="palava-machine"
_gitroot="https://github.com/palavatv/${_gitname}.git"
pkgver=20140125
pkgrel=6
pkgdesc="WebRTC Signaling done in Ruby for palava"
arch=('i686' 'x86_64' 'armv6h')
url="https://palava.tv/"
license=('MIT')
groups=('pavala-git')
depends=('ruby>=2.0.0' 'redis' 'ruby-em-hiredis' 'ruby-logger-colors' 'ruby-em-websocket' 'ruby-mongo' 'ruby-http_parser.rb-0.5' 'ruby-local_port' 'ruby-daemons' 'ruby-synchronize')
makedepends=('git' 'ruby-bundler')
provides=("${_gitname}")
conflicts=("${_gitname}")
source=("${_gitname}.config" "${_gitname}.service" "${_gitname}.tmpfiles.d" "${_gitname}.logrotate")
install="${_gitname}".install
md5sums=('f144b1f3e0651f905b66721ce4e31956'
         '6bf7ab19221138c87e70e4a5827484d0'
         'a1a368c10f3b9e24221ef4903366958c'
         '5695f2b4c1514cf91b13fc7a8b54e834')

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

  sed -i "s/^ruby.*/ruby '$(ruby -v | sed 's/^[^[0-9]*\s\([0-9][^p ]*\).*/\1/g')'/g" Gemfile

  bundle install --without development:test --deployment --path ./ || return 1

  sed -i 's#^\(\s\s*monitor:.*\)$#\1\n  dir_mode: :normal,\n  dir: "/run/palava-machine/",#g' "bin/palava-machine-daemon"
}

package() {
  cd "${srcdir}/${_gitname}-build"
  # create structure like the one used by e.g. roundcubemail although it does not match https://wiki.archlinux.org/index.php/Fhs
  install -m755 -d "${pkgdir}/usr/share/doc/${_gitname}"
  install -m644 -t "${pkgdir}/usr/share/doc/${_gitname}" LICENSE.txt README.md ChangeLog.md
  install -Dm644 "${srcdir}/${_gitname}.config" "${pkgdir}/etc/conf.d/${_gitname}"
  cp -r bin lib "${pkgdir}/usr/"
  install -Dm755 "${srcdir}/${_gitname}.service" "${pkgdir}/usr/lib/systemd/system/${_gitname}.service"
  install -Dm644 "${srcdir}/${_gitname}.tmpfiles.d" "$pkgdir/usr/lib/tmpfiles.d/${_gitname}.conf"
  install -Dm644 "${srcdir}/${_gitname}.logrotate" "${pkgdir}/etc/logrotate.d/${_gitname}"
}

# vim:ts=2:et
