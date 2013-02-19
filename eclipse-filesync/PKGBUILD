# Maintainer: David Morgan <dmorgan81[at]gmail[dot]com>
pkgname=eclipse-filesync
pkgver=1.3.8
_pkgver=${pkgver}.201104160944
pkgrel=1
pkgdesc="Eclipse file synchronization plugin."
arch=('i686' 'x86_64')
url="http://andrei.gmxhome.de/filesync/index.html"
license=('EPL')
depends=('eclipse>=3.5')

source=(
    "http://andrei.gmxhome.de/eclipse/features/FileSync_${_pkgver}.jar"
    "http://filesync4eclipse.eclipselabs.org.codespot.com/files/de.loskutov.FileSync_${_pkgver}.jar")
noextract=(${source[@]##*/})

build() {
  _dest=${pkgdir}/usr/share/eclipse/dropins/filesync/eclipse
  install -dm755 ${_dest}/plugins

  for url in ${source[@]}
  do 
    _file="${url##*/}"
    _type="${url%/*}"
    _type="${_type##*/}"

    #install -Dm644 ${_file} ${_dest}/${_type}/${_file} || return 1
    if [ ${_type} == 'features' ]; then
        install -dm755 ${_dest}/features/${_file/.jar} 
        cd ${_dest}/features/${_file/.jar}
        jar xf ${srcdir}/${_file} || return 1
    else
        install -Dm644 ${srcdir}/${_file} ${_dest}/plugins
    fi
  done     
}
# vim:set ts=4 sw=4 et:

md5sums=('0881411ee33ee7ce03104cec23ff70db'
         'a545eb21e857bc94ac8f9f4493c71287')
