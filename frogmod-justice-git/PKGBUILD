# Maintainer: Ricky Thomson <punkrockunix at gmail dot com>

pkgname=frogmod-justice-git
pkgver=20111025
pkgrel=1
pkgdesc="A modified Sauerbraten server for the 2010 'Justice' edition of the game."
url="http://www.mappinghell.net/frogmod/"

arch=('i686' 'x86_64')
license=('ZLIB')
depends=('zlib' 'geoip')
makedepends=('git')

source=('frogserv.sh')    
md5sums=('62735888c07dd0e5cd1511e3aa9af4a9')

_gitname="frogmod-justice"
_gitroot="git://github.com/vampirefrog/${_gitname}.git"


build() {
  cd $srcdir
  msg "Connecting to GIT (${_gitroot}) ..."

  if [ -d ${_gitname} ]; then
    cd ${_gitname} && git pull origin
    msg "The local files of ${_gitname} were updated."
  else
    git clone ${_gitroot} ${_gitname}
  fi

  msg "GIT checkout done or server timeout"

  cd "${srcdir}/${_gitname}"

  # Reset LDFLAGS, for some reason it fails at linking with arch defaults
  LDFLAGS=""

  ./config.sh || return 1
  make || return 1


}

package() {
  cd "${srcdir}/${_gitname}"

  mkdir -p ${pkgdir}{/usr/sbin/,/opt/frogmod-justice/{doc,bin,web}}

  #invocation script
  install -Dm755 ../frogserv.sh ${pkgdir}/usr/sbin/frogserv

  #bins
  install -Dm755 frogserv ${pkgdir}/opt/frogmod-justice/bin/frogserv

  #confs
  install -Dm644 server-init-example.cfg ${pkgdir}/opt/frogmod-justice/server-init-example.cfg
  install -Dm644 stdlib.cfg ${pkgdir}/opt/frogmod-justice/stdlib.cfg

  #docs
  install -Dm644 readme_source.txt ${pkgdir}/opt/frogmod-justice/doc/readme_source.txt
  install -Dm644 README ${pkgdir}/opt/frogmod-justice/doc/README

  #web panel
  install -Dm644 web/* ${pkgdir}/opt/frogmod-justice/web/

}
