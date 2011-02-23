# Contributor: N30N <archlinux@alunamation.com>

pkgname="synapse-svn"
pkgver=772
pkgrel=1
pkgdesc="A node based compositor."
url="https://code.google.com/p/vexx/"
license=("GPL3")
arch=("i686" "x86_64")
depends=("qt" "openexr")
makedepends=("subversion")
source=("synapse.desktop" "synapse.sh")
md5sums=("48dcb31dc3b33675aac3bffffd275e5f" "ae085d8419016603ee7c7ba517f32906")

# _svntrunk="https://vexx.googlecode.com/svn/trunk/"
_svntrunk="https://vexx.googlecode.com/svn/branches/Synapse_1x"
_svnmod="synapse"

build() {
	msg "Connecting to SVN server..."
	if [ -d "${_svnmod}/.svn" ]; then
		(cd "${_svnmod}" && svn cleanup && svn update -r ${pkgver})
		rm -rf "${_svnmod}-build"
	else
		svn co "${_svntrunk}" "${_svnmod}" --config-dir ./ -r ${pkgver}
	fi

	cp -rf "${_svnmod}" "${_svnmod}-build"
	cd "${_svnmod}-build"
	qmake
	make

	install -d ${pkgdir}/opt/synapse/{plugins,synapseNodes}
	install -m755 bin/alter  ${pkgdir}/opt/synapse
	install -m755 bin/*.so.1  ${pkgdir}/opt/synapse
	install -m755 bin/plugins/*.so.1  ${pkgdir}/opt/synapse/plugins
	install -m755 bin/synapseNodes/*.so.1  ${pkgdir}/opt/synapse/synapseNodes
	install -m644 bin/synapseNodes/*.{svg,xml}  \
		${pkgdir}/opt/synapse/synapseNodes
	install -D -m755 "${srcdir}/synapse.sh" \
		"${pkgdir}/usr/bin/synapse"
	install -D -m644 "${srcdir}/synapse.desktop" \
		"${pkgdir}/usr/share/applications/synapse.desktop"
}

# vim: set noet ff=unix:
