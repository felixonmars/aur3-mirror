# Maintainer: Joel Pedraza <joel@joelpedraza.com>
pkgname=eclipse-m2e-android
pkgver=0.4.2
pkgrel=1
pkgdesc="Android Connector for M2E Maven Integration for Eclipse"
arch=('i686' 'x86_64')
url="http://rgladwell.github.com/m2e-android/"
license=('EPL')
depends=('eclipse-m2e')
_url="https://github.com/rgladwell/m2e-android/raw/gh-pages/updates/m2e-android"

source=(
    "${_url}/features/me.gladwell.eclipse.m2e.android.feature_${pkgver}.jar"
    "${_url}/plugins/me.gladwell.eclipse.m2e.android_${pkgver}.jar")
sha1sums=('e9728c6008df8a9e2c308c42bcb738f6fb3d42c5'
          '5cabc9837229c82dc1b4ae78785a8f7efca67b2a')
noextract=(
    "me.gladwell.eclipse.m2e.android.feature_${pkgver}.jar"
    "me.gladwell.eclipse.m2e.android_${pkgver}.jar")
build() {
  _dest=${pkgdir}/usr/share/eclipse/dropins/m2e-android/eclipse
  install -dm755 ${_dest}/plugins

  for url in ${source[@]}
  do 
    _file="${url##*/}"
    _type="${url%/*}"
    _type="${_type##*/}"

    if [ ${_type} == 'features' ]; then
        #install -m644 ${srcdir}/${_file} ${_dest}/features # w/ extract
        install -dm755 ${_dest}/features/${_file/.jar} 
        cd ${_dest}/features/${_file/.jar}
        jar xf ${srcdir}/${_file} # || return 1
    else
        install -m644 ${srcdir}/${_file} ${_dest}/plugins
    fi
  done     
}
