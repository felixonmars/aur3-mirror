# Contributor: Nuno Araujo <nuno.araujo at russo79.com>
# Contributor: Charles Lindsay <charles@chaoslizard.org>
# Maintainer: Alexsandr Pavlov <kidoz at mail dot ru>
pkgname=gcdemu-fixed
_pkgname=gcdemu
pkgver=1.5.0
pkgrel=0
pkgdesc="GNOME panel applet controlling cdemu-daemon"
arch=('i686' 'x86_64')
url="http://cdemu.sourceforge.net/"
license=('GPL2')
depends=('cdemu-daemon' 'dbus-python' 'python2' 'python2-gconf' 'python2-gobject2' 'pygtk' 'python-notify' 'python-rsvg')
makedepends=('intltool')
install=gcdemu.install
provides=('gcdemu')
replaces=('gcdemu')
conflicts=('gcdemu')
source=(http://downloads.sourceforge.net/cdemu/$_pkgname-$pkgver.tar.bz2)
md5sums=('6092d775602f4cc55020dcafc052eda4')


build() {
  cd "$srcdir/$_pkgname-$pkgver"
 ./configure --prefix=/usr || return 1
 make || return 1
 make check || return 1
}

package() {
 cd "$srcdir/$_pkgname-$pkgver"
 make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${pkgdir} install || return 1
 sed -i 's/python/python2/' ${pkgdir}/usr/bin/gcdemu
 sed -i 's/<default>false<\/default>/<default>true<\/default>/' ${pkgdir}/usr/share/glib-2.0/schemas/apps.gcdemu.gschema.xml 
 #What the hell $foo% of the users install this anyway without looking at this (or they are looking and don't understand it ... yes I mean you)
 #anyway I have a problem with the schema files they aren really recognized I think they need to be put (converted) in /usr/share/gconf/schemas/gcdemu.schemas but wth
 #I fix a lil problem through fucking with the source code if you know a better solution plz PLZ just tell me I'm fed up
 sed -i 's/self.settings.get_boolean("use-system-bus")/True/' ${pkgdir}/usr/bin/gcdemu # yes I AM a bad person
}
