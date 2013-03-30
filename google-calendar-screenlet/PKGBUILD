# Maintainer: tormbipeti <trombipeti@gmail.com>
# Contributor: twa022 <twa022@gmail.com>

pkgname=google-calendar-screenlet
pkgver=0.4.9
pkgrel=1
pkgdesc="Screenlet showing Google calendar events"
arch=('any')
url="http://gnome-look.org/content/show.php/Google+Calendar+Screenlet?content=125346"
license=('GPL')
depends=('screenlets' 'python2-gdata>=2.0.10')
source=(http://gnome-look.org/CONTENT/content-files/125346-GoogleCalendarScreenlet-${pkgver}.tar.gz
        int_fix.patch)

build() {
  cd ${srcdir}/GoogleCalendar
  sed -i -e "s:#!/usr/bin/env python:#!/usr/bin/env python2:g" GoogleCalendarScreenlet.py
  patch -Np1 -i ../int_fix.patch
  mkdir -p $pkgdir/usr/share/screenlets
  cp -r $srcdir/GoogleCalendar $pkgdir/usr/share/screenlets/
}

md5sums=('bac75a3356f99fdcbdc206b025c2414c'
         '61404a943eb5fa8a184a4a4af95180c2')

