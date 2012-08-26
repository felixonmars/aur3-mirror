#Maintainer: Reuben Castelino <projectdelph[at]gmail[dot]com>
pkgname=tfr
pkgver=20120826
pkgrel=1
pkgdesc="A ruby comic book reader and organizer"
url='https://github.com/projectdelphai/tfr'
arch=('any')
license=('GPL')
depends=('ruby' 'ruby-highline' 'ruby-mysql2' 'mysql' 'atool' 'sxiv')

_gitroot='git://github.com/projectdelphai/tfr.git'
_gitname='tfr'

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
  cd "${srcdir}/tfr"
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm755 --owner=$USER tfr.sh ${pkgdir}$HOME/.tfr/tfr.sh
  install -Dm755 --owner=$USER tfr.yml ${pkgdir}$HOME/.tfr/tfr.yml
}
