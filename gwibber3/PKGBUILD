# Maintainer: calmacdo <calum.asu@gmail.com>

pkgname=gwibber3
_pkgmainname=gwibber
pkgver=3.1.0
pkgrel=3.2                              
pkgdesc="an open source microblogging client for GNOME"
url="https://launchpad.net/gwibber"
license=('GPL')
arch=('any')
depends=('python2' 'dbus-python' 'pygtk' 'python-gnomekeyring' 'python2-gconf' 'python-imaging' 'gnome-python-desktop' 'gnome-python' 'python2-oauth' 'python-notify' 'pywebkitgtk' 'python-simplejson' 'python-egenix-mx-base' 'python-distutils-extra' 'python-feedparser' 'pyxdg' 'python-mako' 'python-pycurl')
options=('!libtool')
source=("http://launchpad.net/${_pkgmainname}/${pkgrel}/${pkgver}/+download/${_pkgmainname}-${pkgver}.tar.gz")
md5sums=('e022ad230bd7ef0c735069ba6407df0d')

build() {
        cd $srcdir/${_pkgmainname}-${pkgver}
        python2 setup.py install --root=${pkgdir} || return 1
}
