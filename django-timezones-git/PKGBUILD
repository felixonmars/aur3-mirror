# Contributor: mroztn <mroztn@gmail.com>
pkgname=django-timezones-git
pkgver=20110102
pkgrel=1
pkgdesc="A Django reusable app to deal with timezone localization for users."
arch=('any')
url="https://github.com/brosner/django-timezones"
license=('custom')
groups=()
depends=('python' 'python-distribute' 'django' 'python-pytz')
makedepends=('git')
provides=('django-timezones')
md5sums=()

_gitroot="https://github.com/brosner/django-timezones.git"
_gitname="${pkgname}"

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot $_gitname
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf "$srcdir/$_gitname-build"
	git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd "$srcdir/$_gitname-build"

	#
	# BUILD HERE
	#
    cd ${srcdir}/${_gitname}
    touch LICENSE
    sed 's/setuptools/distutils.core/g' setup.py > setup.py.tmp && \
    mv setup.py.tmp setup.py &&
    python setup.py install --root=$pkgdir && \
    install -D -m0644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}
