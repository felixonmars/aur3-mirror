# Contributor: Flamelab <panosfilip@gmail.com>

# Compiz PKGBUILDs are based on "some-guy"'s previous PKGBUILDs

# Put the desired install prefix HERE
_iprefix=/opt/unity


pkgname=ccsm-unity-git
pkgver=20110210
pkgrel=1
pkgdesc="Compizconfig Settings Manager in Python. Package meant for use with Unity."
arch=('any')
url="http://opencompositing.org"
license=('GPL')
depends=('compiz-core-unity-git' 'compizconfig-python-unity-git' 'pygtk')
makedepends=('git')
source=()
install="ccsm-unity-git.install"
_gitroot="git://anongit.compiz.org/compiz/compizconfig/ccsm"
_gitname="ccsm"
provides=('ccsm++')


# trick re-determining the build revision and, or entertain the hidden
# makepkg option --forcever, huh
if [ -z "${FORCE_VER}" ]; then
    msg "Determining latest build revision..."
    FORCE_VER=$(date +%Y%m%d)
fi

build()
{
	cd "${srcdir}"
	msg "Connecting to GIT server...."

	if [ -d ${_gitname} ] ; then
		cd "${_gitname}" && git pull origin
		msg "The local files are updated."
	else
		git clone ${_gitroot} ${_gitname}
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."
	cd "${srcdir}/${_gitname}"
	python2 setup.py build --prefix=${_iprefix}
	python2 setup.py install --prefix=${_iprefix} --root=${pkgdir}
	cat <<EOF > ccsm-git
#!/bin/bash
PREFIX=${_iprefix}
exec env LD_LIBRARY_PATH=\$PREFIX/lib/ PYTHONPATH=\$PREFIX/lib/python2.7/site-packages \$PREFIX/bin/ccsm
EOF
	install -m755 ccsm-git ${pkgdir}${_iprefix}/bin/
	mkdir -p "$pkgdir/usr/bin"
	ln -s "${_iprefix}/bin/ccsm-git" "$pkgdir/usr/bin/ccsm-git"
	sed -i "s|@prefix@|${_iprefix}|g" "${startdir}/${install}"
}
