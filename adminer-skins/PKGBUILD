# Maintainer: Sabart Otto - Seberm <seberm[at]gmail[dot].com

pkgname=adminer-skins
pkgver=20120301
pkgrel=3
pkgdesc='Adminer skins GIT version.'
url='http://www.adminer.org'
arch=('any')
license=('Apache License, Version 2.0')
#install='adminer-skins.install'
source=()
depends=('adminer')
makedepends=('git')


# Uncomment one of these skins
#_skinName='brade'
#_skinName='bueltge'
#_skinName='cvicebni-ubor'
#_skinName='haeckel'
#_skinName='hever'
#_skinName='jukin'
#_skinName='kahi'
#_skinName='konya'
#_skinName='pilot'
#_skinName='paranoiq'
#_skinName='pokorny'


_gitname='adminer'
_gitroot="git://${_gitname}.git.sourceforge.net/gitroot/${_gitname}/${_gitname}"


build() {

  if ! [  $_skinName ]; then
    echo 'You have to edit PKGBULD and uncomment one of skins...'
    exit 1;
  fi


  cd "$srcdir"
  msg "Connecting to GIT (${_gitroot}) ..."

  if [ -d "$_gitname" ]; then
    cd "$_gitname" && git pull origin
    msg "The local files of ${_gitname} were updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi
  
  msg "GIT checkout done or server timeout"

  mkdir -p "${pkgdir}/usr/share/webapps/${_gitname}"
  cp -R "${srcdir}/${_gitname}/designs/${_skinName}/adminer.css" "${pkgdir}/usr/share/webapps/${_gitname}"

 
}
