# Maintainer: N30N <archlinux@alunamation.com>

pkgname="topmod-svn"
pkgver=253
pkgrel=1
pkgdesc="A topological mesh modeling system that allows users to create high genus 2-manifold meshes"
url="http://sites.google.com/site/topmod3d/"
license=("GPL")
arch=("i686" "x86_64")
depends=("qt>=4.3" "mesa") # "python2"
makedepends=("subversion")
source=("topmod.sh" "topmod.desktop" "64bit.patch")
md5sums=("a29716ec74c56b21b50d1a9b4fa0019e" \
	"bffc574730f7dd3df567eb7e690277c5" \
	"60946bd7a383c9b226b7f9676277cfdf")

_svntrunk="http://topmod.googlecode.com/svn/trunk"
_svnmod="topmodx"

build() {
	msg "Connecting to topmod SVN server......."
	if [ -d "${_svnmod}/.svn" ]; then
		(cd "${_svnmod}" && svn update -r ${pkgver})
	else
		svn co "${_svntrunk}/${_svnmod}" --config-dir ./ -r ${pkgver}
	fi

	[ -d "${_svnmod}-build" ] && rm -rf "${_svnmod}-build"
	cp -r ${_svnmod} ${_svnmod}-build
	cd ${_svnmod}-build

	if [ "${CARCH}" = "x86_64" ]; then
		patch -p1 < ../64bit.patch
	fi

	# Change path to videos.
	sed -i "s/fromLocalFile(\"video/fromLocalFile(\"\/usr\/share\/topmod\/video/" MainWindow.cc

	# Update python version.
	sed -i "s/2\.5/2\.7/g" topmod.pro

	# Disable python, crurrently causes topmod to freeze.
	sed "/^CONFIG += WITH_PYTHON /d" -i topmod.pro

	msg "Starting build process."
	export SUBLIBS="-lGLU"

	cd include
	qmake && make

	cd pydlfl
	# python2 dlfl_setup.py build
	# python2 dlfl_setup.py install --root="${pkgdir}"

	cd ../../
	lupdate topmod.pro
	lrelease topmod.pro
	qmake && make
}

package() {
	install -Dm755 topmod.sh "${pkgdir}/usr/bin/topmod"
	install -Dm644 topmod.desktop \
		"${pkgdir}/usr/share/applications/topmod.desktop"

	cd "${_svnmod}-build"
	install -Dm644 images/topmod.png "${pkgdir}/usr/share/pixmaps/topmod.png"
	install -Dm755 TopMod "${pkgdir}/opt/topmod/TopMod"
	install -Dm644 video/tutorial_navigation.mov \
		"${pkgdir}/opt/topmod/video/tutorial_navigation.mov"
}
