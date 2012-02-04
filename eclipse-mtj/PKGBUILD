# Contributor: codestation <cesarg9 at gmail dot com>

pkgname=eclipse-mtj
pkgver=1.1.1
pkgrel=1
pkgdesc="A plugin for the Eclipse frameworks to support mobile device Java application development."
arch=('any')
url="http://www.eclipse.org/dsdp/mtj/"
depends=('eclipse')
license="EPL"
source=(http://mirrors.ibiblio.org/pub/mirrors/eclipse/dsdp/mtj/downloads/drops/S-1.1.1RC1-201009031435/dsdp-mtj-runtime-1.1.1RC1.zip)
md5sums=('a1633bb2617ff3ab6a860e436e4f4263')

build() {
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
