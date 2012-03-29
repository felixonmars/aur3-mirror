# Contributor: Matthew Bauer <mjbauer95@gmail.com>
# Maintainer: Steven Allen <steven@stebalien.com>

_pkgname='pithos'
pkgname="$_pkgname-bzr"
pkgver=189
pkgrel=2
pkgdesc='A Pandora Radio (pandora.com) player for the GNOME Desktop using the libpiano library (also used by pianobar).'
arch=('any')
url="http://launchpad.net/$_pkgname"
license=('GPL')
depends=('python2' 'pygtk' 'python-notify' 'dbus-python' 'gstreamer0.10-python' 'gstreamer0.10-good-plugins' 'gstreamer0.10-bad-plugins' 'gstreamer0.10-base-plugins' 'pyxdg' 'hicolor-icon-theme')
makedepends=('bzr' 'python2-distribute' 'python-distutils-extra')
optdepends=('python-keybinder')
provides=("$_pkgname")
source=("$pkgname.install")
install="$pkgname.install"
md5sums=('c9db50a1fd3d86efe4d6f8a7b044e718')

_bzrmod="$_pkgname"
_bzrtrunk="https://code.launchpad.net/$_pkgname/trunk"

build() {
	cd "${srcdir}"

	msg "Connecting to the server...."

    if [[ -d "$_bzrmod" ]]; then
         cd "$_bzrmod" && bzr --no-plugins pull "$_bzrtrunk" -r "$pkgver"
         msg "The local files are updated."
    else
         bzr --no-plugins branch "$_bzrtrunk" "$_bzrmod" -q -r "$pkgver"
    fi

	msg "BZR checkout done or server timeout"

	[ -d ./${_bzrmod}-build ] && rm -rf ./${_bzrmod}-build
	cp -r ./${_bzrmod} ./${_bzrmod}-build
}

package() {
	cd "${srcdir}/${_bzrmod}-build"
	python2 setup.py install --optimize=1 --prefix=/usr --root="${pkgdir}/"
}
