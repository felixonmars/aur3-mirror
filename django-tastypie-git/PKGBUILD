# Maintainer: Alper KANAT <alperkanat@raptiye.org>

pkgname=django-tastypie-git
pkgver=20120314
pkgrel=1
pkgdesc="Creating delicious APIs for Django apps since 2010."
url="https://github.com/toastdriven/django-tastypie"
arch=('any')
license=('BSD')
makedepends=("python2-distribute")
depends=("python2" "django" "python-mimeparse" "python2-dateutil")
optdepends=('lxml: if using the XML serializer'
            'pyyaml: if using the YAML serializer'
            'uuid: (present in python >= 2.5) if using the ApiKey authentication')
conflicts=("django-tastypie")
provides=("django-tastypie")

_gitroot="git://github.com/toastdriven/django-tastypie.git"
_gitname="django-tastypie"

build() {
	cd $srcdir
	msg "Connecting to django-tastypie git server..."

	if [ -d $srcdir/$_gitname ]; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	cd $srcdir/$_gitname
	python2 setup.py build || return 1
	python2 setup.py install --root=$pkgdir || return 1
}

package() {
    cd $srcdir/$_gitname

	msg "Installing license..."
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

    msg "Installing docs..."
    mkdir -p $pkgdir/usr/share/doc/$pkgname
    cp -r docs/ $pkgdir/usr/share/doc/$pkgname/
    install -Dm644 AUTHORS $pkgdir/usr/share/doc/$pkgname/AUTHORS
    install -Dm644 README.rst $pkgdir/usr/share/doc/$pkgname/README.rst
    install -Dm644 requirements.txt $pkgdir/usr/share/doc/$pkgname/requirements.txt
    install -Dm644 TODO $pkgdir/usr/share/doc/$pkgname/TODO
    install -Dm644 tox.ini $pkgdir/usr/share/doc/$pkgname/tox.ini
}
