# Maintainer: dryes <joswiseman@gmail>
# Contributor: <kontakt.zuf@gmail.com>
pkgname='redcar-git'
pkgver=20120709
pkgrel=1
pkgdesc="A cross-platform programmer's editor written in Ruby."
arch=('i686' 'x86_64')
url='http://redcareditor.com/'
license=('GPL2')
depends=('java-runtime' 'rubygems')
makedepends=('git')
conflicts=('redcar')
provides=('redcar')

_gitroot='git://github.com/redcar/redcar.git'
_gitname='redcar'

build() {
  cd "${srcdir}"
  msg 'Connecting to GIT server....'

  if [ -d "${_gitname}" ] ; then
    cd "${_gitname}" && git pull origin
    msg 'The local files are updated.'
  else
    git clone "${_gitroot}" "${_gitname}"
  fi

  msg 'GIT checkout done or server timeout'  

  cp -r "${srcdir}/${_gitname}/" "${srcdir}/${_gitname}-build/"

  cd "${srcdir}/${_gitname}-build/"

  rake init
}

package() {
  cd "${srcdir}/${_gitname}-build/"

  mkdir -p "${pkgdir}"/{opt/redcar/,usr/bin/,usr/share/doc/redcar/}

  rm -f 'Rakefile'
  for _d in $(find -type d -name '.git'); do
    [ -d "${_d}" ] && rm -rf "${_d}"
  done

  mv 'README.md' 'CHANGES' "${pkgdir}/usr/share/doc/redcar/"
  mv "${PWD}/"* "${pkgdir}/opt/redcar/"

  ln -s "/opt/redcar/bin/redcar" "${pkgdir}/usr/bin/redcar"

  rm -rf "${srcdir}/${_gitname}-build/"
}
