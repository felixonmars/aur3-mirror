# Maintainer: Kristof Jozsa <kjozsa@fsdev.hu>

pkgname=eclipse-scala-ide-juno-nightly
pkgver=2.1.M1
pkgrel=1
pkgdesc="Scala IDE for Eclipse - nightly version with Juno support"
arch=('i686' 'x86_64')
url="http://www.scala-ide.org/"
license=('custom')
depends=('eclipse>=4.2')
optdepends=('eclipse-ajdt: aspect weaving support')

source=(\
LICENSE)

md5sums=('58b225f304aaf42c8b8738894a10cb96')

package() {
  # Fetch nightly
  wget -N --accept=jar -r -np http://download.scala-ide.org/nightly-update-juno-master-29x/
  install -D -m0644 $startdir/LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE

  _dest=${pkgdir}/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse
  _fetch=download.scala-ide.org/nightly-update-juno-master-29x
  cd ${srcdir}/${_fetch}

  # Features
  find features -type f | while read _feature ; do
    if [[ ${_feature} =~ (.*\.jar$) ]] ; then
      install -dm755 ${_dest}/${_feature%*.jar}
      cd ${_dest}/${_feature/.jar}
      jar xf ${srcdir}/${_fetch}/${_feature} || return 1
    else
      install -Dm644 ${_feature} ${_dest}/${_feature}
    fi
  done

  # Plugins
  find plugins -type f | while read _plugin ; do
    install -Dm644 ${_plugin} ${_dest}/${_plugin}
  done
}
