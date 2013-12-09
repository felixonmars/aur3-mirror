# Maintainer: Robert Štětka <robert dot stetka at gmail dot com>
pkgname=perspectives-server-git
pkgver=20131208
pkgrel=1
url='http://perspectives-project.org/'
pkgdesc='Perspectives notary server'
arch=('i686' 'x86_64')
license=('GPL')
depends=('openssl' 'python2>=2.7' 'python2-m2crypto' 'python2-cherrypy' 'python2-pysqlite' 'python2-sqlalchemy')
makedepends=('git')
_gitroot='https://github.com/danwent/Perspectives-Server.git'
_gitname='perspectives'
_realname='perspectives'
source=('perspectives.service')
sha256sums=('68bbe22b306fe65ef043ea4c472f17dd5c30affb30e978452cbc4b1f695a3cb1')
install='perspectives.install'

package() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  
  mkdir -p ${pkgdir}/opt/${_realname}
  cp -a ${srcdir}/${_realname} ${pkgdir}/opt/

  # unit file
  install -D -m 644 ${srcdir}/perspectives.service ${pkgdir}/usr/lib/systemd/perspectives.service

  # license
  install -d -m 755 ${pkgdir}/usr/share/licenses/${_realname}
  install -m 644 ${srcdir}/${_gitname}/COPYING ${pkgdir}/usr/share/licenses/${_realname}
}


# vim:set ts=2 sw=2 et:
