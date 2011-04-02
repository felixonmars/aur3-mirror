# Maintainer: Soomsoom <doron@archlinux.org.il>

pkgname=gwibber-dev-updated
_pkgname=gwibber
pkgver=2.91.93
pkgrel=1
pkgdesc="an open source microblogging client for GNOME, 3.0 alpha."
url="https://launchpad.net/gwibber"
license=('GPL')
arch=('any')
depends=('gnome-python-desktop' 'dbus-python' 'gnome-python' 'python-notify' 'python-simplejson' 'python-egenix-mx-base' 'pywebkitgtk' 'python-distutils-extra' 'python-imaging' 'pyxdg' 'python-feedparser' 'python2-oauth' 'python-mako' 'python-pycurl' 'libwnck' 'python2')
conflicts=('gwibber<=1.0RC1' 'gwibber-bzr' 'gwibber-microsoft-bzr' 'gwibber-sweston-bzr' 'gwibber-trunk-bzr' 'gwibber2.0' 'gwibber')
replaces=('gwibber<=1.0RC1' 'gwibber-bzr' 'gwibber-microsoft-bzr' 'gwibber-sweston-bzr' 'gwibber-trunk-bzr' 'gwibber2.0' 'gwibber' 'gwibber-new')
provides=('gwibber=2.92.92')
options=('!libtool')
source=("http://launchpad.net/${_pkgname}/trunk/${pkgver}/+download/${_pkgname}-${pkgver}.tar.gz")
md5sums=('b9923f2b9860862ea559e430678957ff')

build() {
 	cd $srcdir/${_pkgname}-${pkgver} 
	python2 setup.py install --root=${pkgdir} || return 1
}
