#Maintainer: Reuben Castelino <projectdelph[at]gmail[dot]com>
pkgname=tfo
pkgver=20120826
pkgrel=1
pkgdesc="A ruby comic book renamer"
url='https://github.com/projectdelphai/tfo'
arch=('any')
license=('GPL')
depends=('ruby' 'ruby-highline')

_gitroot='git://github.com/projectdelphai/tfo.git'
_gitname='tfo'

build() {
  cd "${srcdir}"
  msg 'Connecting to GIT server....'

  if [ -d "${_gitname}" ] ; then
    cd "${_gitname}" && git pull origin
    msg 'The local files are updated.'
  else
    git clone "${_gitroot}" "${_gitname}"
  fi

  msg 'GIT checkout done or server timeout.'
}

package() {
  cd "${srcdir}/tfo"
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm755 --owner=$USER tfo.yml ${pkgdir}$HOME/.tfo/tfo.yml
}
