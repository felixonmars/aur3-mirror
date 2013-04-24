# Contributor: Vojtech Horky <vojta . horky at-symbol seznam . cz>
pkgname=python2-trollop-hg
pkgver=dev
pkgrel=1
pkgdesc="Python library for working with Trello API"
arch=('any')
url="https://bitbucket.org/btubbs/trollop"
license=('MIT')
depends=("python2" "python2-requests" "python2-isodate")
makedepends=("mercurial")
source=()
md5sums=()
provides=('python2-trollop')
_hgroot="https://bitbucket.org/btubbs/trollop"
_hgname="trollop"

build() {
	cd "${srcdir}"
	msg "Connecting to Mercurial server (bitbucket.org)..."
	if [ -d $_hgname ] ; then
		cd "$_hgname" && hg pull
		msg "Local files are updated"
	else
		hg clone "$_hgroot" "$_hgname"
		msg "Mercurial checkout done or server timeout"
	fi
	
	cd "${_hgname}"
	python2 setup.py build
}

package() {
	cd "${srcdir}/${_hgname}"
	python2 ./setup.py install --prefix=/usr --root "${pkgdir}"
}

