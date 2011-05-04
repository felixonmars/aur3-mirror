# Contributor: twa022 <twa022@gmail.com>
# Based on gnome-agenda-svn PKGBUILD by Maxime de Roucy

pkgname=agenda
pkgver=0.3.1.4
pkgrel=1
pkgdesc="Display calendars on the GNOME desktop tray. Supports Google Calendar, Novell Groupwise, Evolution and iCalendar"
arch=('i686' 'x86_64')
url="http://code.google.com/p/gnome-agenda/"
license=('GPL2')
provides=('gnome-agenda')
replaces=('gnome-agenda')
depends=('python-pysqlite>=2.4.0' 'python-vobject>=0.5' 'python-configobj>=4.4.0.2' 
         'python-lxml>=2.1' 'dbus-python' 'python-dateutil' 'python-sexy' 'gnome-icon-theme')
optdepends=('python-evolution: Evolution plugin'
            'python-gdata: Google calendar plugin')
makedepends=('python2-distribute')
source=(http://gnome-agenda.googlecode.com/svn/tags/${pkgname}-${pkgver}.tar.gz)

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	find "${srcdir}" -name "*.py" -print | xargs sed -i 's:/usr/bin/env python:&2:g'
	find "${srcdir}" -name "*.py" -print | xargs sed -i 's:/usr/bin/python:&2:g'
	sed -i 's:/usr/bin/python:&2:g' ${srcdir}/${pkgname}-${pkgver}/agenda-gtk
	sed -i 's:/usr/bin/env python:&2:g' ${srcdir}/${pkgname}-${pkgver}/agenda-gtk
	python2 setup.py install --root=${pkgdir} || return 1
}

md5sums=('61ed73f52c35773eee5273dc2672479a')
