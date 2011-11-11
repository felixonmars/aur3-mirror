# Maintainer: Kristof Jozsa <kjozsa@fsdev.hu>

pkgname=eclipse-scala-ide
pkgver=2.0.0rc0
pkgrel=1
pkgdesc="Scala IDE for Eclipse"
arch=('i686' 'x86_64')
url="http://www.scala-ide.org/"
license=('custom')
depends=('eclipse>=3.7')
optdepends=('eclipse-ajdt: aspect weaving support')

source=(\
http://download.scala-ide.org/releases-29/stable/org.scala-ide.sdt.update-site.zip
LICENSE)

md5sums=('57a4d4c1ce59e16e796207a2976b4325' '58b225f304aaf42c8b8738894a10cb96')

build() {
  install -D -m0644 $startdir/LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE

  _dest=${pkgdir}/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse
  cd ${srcdir}
  # Features
  find features -type f | while read _feature ; do
    if [[ ${_feature} =~ (.*\.jar$) ]] ; then
      install -dm755 ${_dest}/${_feature%*.jar}
      cd ${_dest}/${_feature/.jar}
      jar xf ${srcdir}/${_feature} || return 1
    else
      install -Dm644 ${_feature} ${_dest}/${_feature}
    fi
  done

  # Plugins
  find plugins -type f | while read _plugin ; do
    install -Dm644 ${_plugin} ${_dest}/${_plugin}
  done
}
