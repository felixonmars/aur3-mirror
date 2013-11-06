# Contributor: Vojtech Horky <vojta . horky at-symbol seznam . cz>
pkgname=python2-pylot
pkgver=1.26
pkgrel=1
pkgdesc="Tool for testing performance and scalability of web services"
arch=('any')
url="http://pylot.org/"
license=('GPL3')
depends=("python2")
source=("http://pylt.googlecode.com/files/pylot_${pkgver}.zip")
md5sums=('6fe1604b7ca654b16be1675cc64e9bcb')

package() {
	sitedir=`python2 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"`

	cd "${srcdir}/pylot_${pkgver}"

	# Install Python sources
	install -d "${pkgdir}/${sitedir}/pylot"
	find -name '*.py' -exec install -D -m 0644  {} "${pkgdir}/${sitedir}/pylot/{}" \;

	# Force launching with Python 2
	# (notice the \r as pylot has CRLF line endings)
	sed '1s/python[ \t\r]*$/python2/' -i "${pkgdir}/${sitedir}/pylot/run.py"
	chmod 0755 "${pkgdir}/${sitedir}/pylot/run.py"

	# Create a launcher
	install -d "${pkgdir}/usr/bin"
	cat >"${pkgdir}/usr/bin/pylot" <<EOF_LAUNCHER
#!/bin/sh

python2 ${sitedir}/pylot/run.py "\$@"

EOF_LAUNCHER
	chmod 0755 "${pkgdir}/usr/bin/pylot"

}

