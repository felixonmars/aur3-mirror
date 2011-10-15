pkgname=roar
pkgver=0.1.2
pkgrel=1
pkgdesc='Static website generator based on Growl'
url='http://pypi.python.org/pypi/roar'
arch=('any')
license=GPL

depends=('python2'
         'python-markdown'
         'python2-jinja'
         'python2-distribute')

source=("http://pypi.python.org/packages/source/r/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('68ff035204232129d83495d2156ce2e0')

build () {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python2 setup.py install --root="${pkgdir}" --optimize=1

	echo "I'm in $(pwd)"
	local docdir="${pkgdir}/usr/share/doc/${pkgname}-${pkgver}"

	# Copy README...
	install -m 755 -d "${docdir}"
	install -m 644 README.* "${docdir}"

	# ...and example hooks.
	install -m 755 -d "${docdir}/example-hooks"
	install -m 644 _hooks/*.py "${docdir}/example-hooks"
}
