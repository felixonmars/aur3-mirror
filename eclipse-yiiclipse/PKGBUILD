# Maintainer: Jesús Jerez <jerezmoreno@gmail.com>
# Contributor: Jesús Jerez <jerezmoreno@gmail.com>
pkgname=eclipse-yiiclipse
pkgver=1.1.0.201111132221
pkgrel=2
pkgdesc="Eclipse PDT extension for Yii framework"
url="http://yiiclipse.maziarz.org/"
license=("EPL/1.0")
arch=('any')
depends=('eclipse-pdt')
noextract=("org.maziarz.yiiclipse_${pkgver}.jar" "org.maziarz.yiiclipse.feature_${pkgver}.jar")
source=("http://yiiclipse.maziarz.org/updatesite/STABLE/plugins/org.maziarz.yiiclipse_${pkgver}.jar"
		"http://yiiclipse.maziarz.org/updatesite/STABLE/features/org.maziarz.yiiclipse.feature_${pkgver}.jar")
md5sums=('b214e4bbf68500faa9618a1e9409091c'
         'dc89bbff1f46d5c91e9b321a703566c5')

package() {
	_dest="${pkgdir}"/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse

	mkdir {plugins,features}
	cp org.maziarz.yiiclipse_${pkgver}.jar plugins/
	cp org.maziarz.yiiclipse.feature_${pkgver}.jar features/

	# Features
	find features -type f | while read _feature ; do
		if [[ ${_feature} =~ (.*\.jar$) ]] ; then
			install -dm755 "${_dest}"/${_feature%*.jar}
			cd "${_dest}"/${_feature/.jar}
			jar xf "${srcdir}/${_feature}" || return 1
		else
			install -Dm644 ${_feature} "${_dest}/${_feature}"
		fi
	done

	# Plugins
	find plugins -type f | while read _plugin ; do
		install -Dm644 ${_plugin} "${_dest}/${_plugin}"
	done
}
