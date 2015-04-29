# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>

pkgname=synapse-git
pkgver=0.8.1.r4.r0.g231498a
pkgrel=1
pkgdesc="Matrix reference homeserver"
license=('Apache')
arch=('any')
url="https://github.com/matrix-org/synapse"
depends=('python2-syutil-git' 'python2-twisted' 'python2-service-identity'
         'python2-pyopenssl' 'python2-yaml' 'python2-pyasn1' 'python2-pynacl'
         'python2-daemonize' 'python2-py-bcrypt' 'python2-frozendict'
		 'python2-pillow' 'python2-pydenticon' 'python2-matrix-angular-sdk-git')
makedepends=('python2-twisted' 'python2-mock' 'python2-setuptools_trial')
source=("git://github.com/matrix-org/synapse.git"
        'syutil-0.0.4-compat.patch'
		'twisted-15.1.0-compat.patch')
md5sums=('SKIP'
         'c55711d2141758990712c7fecb69d2b5'
         'ecdaceac62c7ad8979ecc7e989ff1502')

pkgver() {
	cd synapse
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd synapse
	# backport "adaptation" for typo fix in syutil 0.0.4
	patch -Np1 -i "$srcdir/syutil-0.0.4-compat.patch"
	# be compatible with python2-twisted 15.1.0 in arch repos
	patch -Np1 -i "$srcdir/twisted-15.1.0-compat.patch"
}

build() {
	cd synapse
	python2 setup.py build 
}

package() {
	cd synapse
	python2 setup.py install --root "${pkgdir}" --optimize=1 --skip-build

	for file in "$pkgdir/usr/lib/python2.7/site-packages/synapse"/{app,push}/*.py; do
		sed -re 's|env python$|&2.7|' -i "$file"
	done
}

# vim: set ts=4 sw=4 tw=0 ft=sh :
