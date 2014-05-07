# Maintainer: Miodrag Tokić <miki@loonies.io>
# Contributor: Michael Manley <mmanley@nasutek.com>
# Contributor: Shanto <shanto@hotmail.com>

# Find current download link at:
# http://download.aptana.com/studio3/plugin/update/index.html

pkgname="eclipse-aptana"
pkgver="3.4.2"
_pkgdate="201308081736"
_pkgtag="7W7I57boG98RAi489ctbvKi7VXbq"
pkgrel="1"
pkgdesc="Aptana Studio plugin for Eclipse (HTML5/CSS3/JavaScript/Ruby/Rails/PHP/Pydev/Django)"
arch=("any")
url="http://www.aptana.com/products/studio3"
license=("GPL3")
depends=("eclipse" "libjpeg-turbo" "libpng12")
makedepends=("unzip")
provides=("eclipse-pydev")
conflicts=("eclipse-pydev")
options=("!strip")
changelog="ChangeLog"
source=(
	".AURINFO"
	"https://d1iwq2e2xrohf.cloudfront.net/tools/studio/plugin/update/studio3/${pkgver}.${_pkgdate}/com.aptana.feature.studio-${pkgver}.${_pkgdate}-${_pkgtag}.zip"
)
sha512sums=(
	"SKIP"
	"9699a97fcf9b3498b96791cb18936cc18caa0d2172d999ec2e9ef48918847e3a62c1cdbf573fc3205e4911b090b8c4c90536ad463db0d770c81abbe1206afe16"
)

package() {
	local _dest="${pkgdir}/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse"

	cd ${srcdir}

	# Features
	find features -type f | while read _feature; do
		if [[ "$_feature" =~ (.*\.jar$) ]] ; then
			install -d -m 755 ${_dest}/${_feature%*.jar}
			cd ${_dest}/${_feature/.jar}
			jar xf ${srcdir}/${_feature}
		else
			install -D -m 644 ${srcdir}/${_feature} ${_dest}/${_feature}
		fi
	done

	# Plugins
	find plugins -name "*win32*" -delete
	find plugins -name "*macosx*" -delete
	find plugins -name "org.eclipse*" -delete

	if [[ "$CARCH" = "x86_64" ]] ; then
		find plugins -name "*x86*" ! -name "*x86_64*" -delete
	else
		find plugins -name "*x86_64*" -delete
	fi

	_keep_as_jar=".+/com\.aptana\.(editor|scripting_|studio).+"

	find plugins -type f | while read _plugin ; do
		if [[ ${_plugin} =~ (.*\.jar$) && ! ${_plugin} =~ $_keep_as_jar ]] ; then
			install -d -m 755 ${_dest}/${_plugin%*.jar}
			cd ${_dest}/${_plugin/.jar}
			jar xf ${srcdir}/${_plugin}
		else
			install -D -m 644 ${srcdir}/${_plugin} ${_dest}/${_plugin}
		fi
	done

	find $_dest/plugins -name 'redtty' -exec chmod 0755 {} \;
}

