# Contributor: Flamelab <panosfilip@gmail.com>

# Compiz PKGBUILDs are based on "some-guy"'s previous PKGBUILDs

# Put the desired install prefix HERE
_iprefix=/opt/unity

pkgname=compizconfig-python-unity-git
pkgver=20110210
pkgrel=1
pkgdesc="Compizconfig bindings for python. Package meant for use with Unity."
arch=('i686' 'x86_64')
url="http://opencompositing.org"
license=('GPL')
depends=('compiz-core-unity-git' 'libcompizconfig-unity-git' 'glib2' 'python2')
makedepends=('intltool' 'pkgconfig' 'git' 'cython-old')
source=()
_gitroot="git://anongit.compiz.org/compiz/compizconfig/compizconfig-python"
_gitname="compizconfig-python"
provides=("compizconfig-python++")


# trick re-determining the build revision and, or entertain the hidden
# makepkg option --forcever, huh
if [ -z "${FORCE_VER}" ]; then
    msg "Determining latest build revision..."
    FORCE_VER=$(date +%Y%m%d)
fi

build()
{
	msg 'Connecting to GIT server....'

	if [[ -d $_gitname ]] ; then
		cd "$_gitname" && git pull origin
		msg 'The local files are updated.'
	else
		git clone "$_gitroot" "$_gitname"
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."
	cd "${srcdir}/${_gitname}"
	env PKG_CONFIG_PATH="$_iprefix/lib/pkgconfig:$PKG_CONFIG_PATH" \
		python2 setup.py build
	env PKG_CONFIG_PATH="$_iprefix/lib/pkgconfig:$PKG_CONFIG_PATH" \
		python2 setup.py install --prefix="$_iprefix" --root="$pkgdir"
}
