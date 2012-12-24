pkgname=pypam-bzr
pkgver=21
pkgrel=1
arch=('any')
license=('GPL')
makedepends=('bzr')
depends=('pam' 'python')
url="https://launchpad.net/ubuntu/quantal/+source/python-pam"
pkgdesc="A Python interface to the PAM library (configured to build for python3)"
conflicts=('pypam')
provides=('pypam')
source=('fix_module_name.patch')

_urel="quantal"
_bzrtrunk="http://bazaar.launchpad.net/~ubuntu-branches/ubuntu/${_urel}/python-pam/${_urel}"
_bzrmod=python-pam

build()
{
	cd "${srcdir}"
	if [[ -d "$_bzrmod" ]]; then
		cd "$_bzrmod" && bzr --no-plugins pull "$_bzrtrunk" -r "$pkgver"
		msg "The local files are updated."
	else
		bzr --no-plugins branch "$_bzrtrunk" "$_bzrmod" -q -r "$pkgver"
		cd python-pam
	fi
	patch -Np1 -i "$srcdir/fix_module_name.patch"
	python setup.py build 
}

package()
{
	cd "${srcdir}/python-pam"
	python setup.py install --root="${pkgdir}"
}
md5sums=('193142de57a72f4464e4c63173524ee6')
