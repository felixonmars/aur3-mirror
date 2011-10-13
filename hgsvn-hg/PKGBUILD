# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com>
# $Id$

pkgname=hgsvn-hg
pkgver=272
pkgrel=2
pkgdesc="A set of scripts to work locally on Subversion checkouts using Mercurial"
url="http://cheeseshop.python.org/pypi/hgsvn"
license=('GPL')
depends=('python2>=2.4' 'pysvn-py2' 'setuptools')
arch=(i686 x86_64)
makedepends=('setuptools' 'mercurial')
provides=('hgsvn')
conflicts=('hgsvn')
#source=('setup.patch')
#md5sums=('b3d386f74fdd81ec96fb73402e08adbc')


_hgroot="http://bitbucket.org/andialbrecht/"
_hgrepo=hgsvn

build() {
	cd ${startdir}/src

	if [ -d ${_hgrepo} ]; then
		cd ${_hgrepo}
		hg pull -u || return 1
	else
		hg clone ${_hgroot} ${_hgrepo} || return 1
		cd ${_hgrepo}
	fi

	msg "Mercurial checkout done or server timeout"
	msg "Starting make..."

	cp hgpushsvn.py hgsvn/run/
	#patch -p0 < ../../setup.patch
	python2 setup.py install --root=$startdir/pkg/ || return 1
}


