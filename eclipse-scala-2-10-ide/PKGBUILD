# Maintainer: Aaron Kimmig <aaron.kimmig@student.hpi.uni-potsdam.de>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Kristof Jozsa <kjozsa@fsdev.hu>

pkgname=eclipse-scala-2-10-ide
pkgver=3.0.3
pkgrel=1
pkgdesc="Scala 2.10 IDE for Eclipse"
arch=('any')
url="http://www.scala-ide.org/"
license=('custom')
depends=('eclipse>=3.8')
conflicts=('eclipse-scala-ide')

source=(
  $pkgname-$pkgver.zip::"http://download.scala-ide.org/sdk/helium/e38/scala210/stable/update-site.zip"
	"LICENSE"
  "scala-2-10-ide.desktop"
  "scala.png"
)

sha256sums=(
  '878c7135cc0aabca11e0cd500b63505e909927e347f0beccab3d52951cbbfae7'
  'ad1050ecc02ebd2b5d125a37612901ce2209f0bfa5a2aab90a5f271a8d36c5d1'
  '169d6ad49b0e951eaf15a4755929d671a774d8f50935012a9ea5be29a585261d'
  '67f7f29a8323b0a37dbba2e2ec3cb6e45ffa8b8dc85bb2a0c36aee9b1e0a41cf'
)

package() {
  install -D -m0644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
  install -D -m0644 "$srcdir"/scala-2-10-ide.desktop "$pkgdir"/usr/share/applications/scala-2-10-ide.desktop
  install -D -m0644 "$srcdir"/scala.png "$pkgdir"/usr/share/eclipse/dropins/scala-2-10-ide/icon.png

  _dest="${pkgdir}"/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse
  cd "${srcdir}"/site

  # Features
  find features -type f | while read _feature ; do
    if [[ ${_feature} =~ (.*\.jar$) ]] ; then
      install -dm755 ${_dest}/${_feature%*.jar}
      cd ${_dest}/${_feature/.jar}
      jar xf ${srcdir}/site/${_feature}
    else
      install -Dm644 ${_feature} "${_dest}"/${_feature}
    fi
  done

  # Plugins
  find plugins -type f | while read _plugin ; do
    install -Dm644 ${_plugin} "${_dest}"/${_plugin}
  done
}
