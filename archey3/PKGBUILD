# Maintainer: Laurie Clark-Michalek <bluepeppers@archlinux.us>

pkgname=archey3
pkgver=20110904
pkgrel=1
pkgdesc="Python script to display system infomation alongside the Arch Linux logo"
arch=('any')
url="http://bluepeppers.github.com/archey3"
license=('GPL')
depends=('python')
makedepends=('git' 'python-distribute')
optdepends=(
	'python3-mpd-git: python mpd libary for mpd protocol (optional, mpc can be used instead)'
	'python-logbook-git: for logging'
	'imagemagick: for default screenshot command'
)
conflicts=('archey')
provides=('archey')
md5sums=()

_gitroot="git://github.com/bluepeppers/archey3.git"
_gitname="archey3"

build() {
        cd ${srcdir}
        msg "Connecting to GIT server...."

        if [ -d archey3 ] ; then
                cd archey3 && git pull origin
                msg "The local files are updated."
        else
                git clone ${_gitroot}
        fi

        msg "GIT checkout done or server timeout"
        msg "Starting make..."

        cd ${srcdir}/${_gitname}

	python setup.py install --root=${pkgdir}
        # Comment line below to install side by side with standard archey
        ln -s /usr/bin/archey3 ${pkgdir}/usr/bin/archey || return 1
        install -D -m644 COPYING ${pkgdir}/usr/share/licenses/archey/COPYING
} 
