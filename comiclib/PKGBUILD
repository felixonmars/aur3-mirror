# Maintainer: Reuben Castelino <projectdelph[at]gmail[dot]com>
pkgname=comiclib
pkgver=20121101
pkgrel=1
pkgdesc="A ruby comic book library manager combining tfo and tfr"
url='https://github.com/projectdelphai/comiclib'
arch=('any')
license=('GPL')
depends=('ruby' 'ruby-highline' 'ruby-mysql2' 'mysql' 'atool' 'sxiv' 'ruby-green_shoes' 'ruby-httparty')

_gitroot='git://github.com/projectdelphai/comiclib.git'
_gitname='comiclib'

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
  cd "${srcdir}/comiclib"
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm755 rc ${pkgdir}/usr/bin/rc
}
