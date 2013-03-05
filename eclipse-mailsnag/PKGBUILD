# Maintainer: David Morgan <dmorgan81[at]gmail[dot]com>
pkgname=eclipse-mailsnag
pkgver=1.3.5
pkgrel=1
pkgdesc="Eclipse plugin that acts as a dummy SMTP server."
arch=('i686' 'x86_64')
url="https://github.com/foosbar/mailsnag"
license=('EPL')
depends=('eclipse>=3.5')
_url="http://foosbar.github.com/update/"

source=(
    "com.foosbar.mailsnag_${pkgver}_feature.jar::${_url}/features/com.foosbar.mailsnag_${pkgver}.jar"
    "com.foosbar.mailsnag_${pkgver}_plugin.jar::${_url}/plugins/com.foosbar.mailsnag_${pkgver}.jar")
noextract=(${source[@]%%::*})

build() {
  _dest=${pkgdir}/usr/share/eclipse/dropins/mailsnag/eclipse
  install -dm755 ${_dest}/plugins

  for url in ${source[@]}
  do 
    _file="${url%%::*}"
    _type="${url%/*}"
    _type="${_type##*/}"

    #install -Dm644 ${_file} ${_dest}/${_type}/${_file} || return 1
    if [ ${_type} == 'features' ]; then
        install -dm755 ${_dest}/features/${_file/.jar} 
        cd ${_dest}/features/${_file/.jar}
        jar xf ${srcdir}/${_file} || return 1
        cd ${_dest}/features
        mv ${_file/.jar} ${_file/_feature.jar}
    else
        install -Dm644 ${srcdir}/${_file} ${_dest}/plugins/${_file/_plugin.jar}.jar
    fi
  done     
}
# vim:set ts=4 sw=4 et:

md5sums=('d11eda8289c3faf1d7e09bfc4c9409e0'
         'fb47d7c9ee7cc6a07c6bab9999ef02cb')
