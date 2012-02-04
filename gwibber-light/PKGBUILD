# Maintainer: polslinux <garrett16@hotmail.it> 

pkgname=gwibber-light
pkgrealname=gwibber
pkgver=2.32.2
_pkgmainver=2.32
pkgrel=5
pkgdesc="an open source microblogging client for GNOME (minimal dependencies)"
url="https://launchpad.net/gwibber"
license=('GPL')
arch=('any')
depends=('dbus-python' 'python-notify' 'python-simplejson' 'python-egenix-mx-base' 'pywebkitgtk' 'python-distutils-extra' 'python-imaging' 'pyxdg' 'python-feedparser' 'python2-oauth' 'python-mako' 'python-pycurl' 'libwnck' 'python2' 'python2-gconf' 'python-wnck')
conflicts=('gwibber<=1.0RC1' 'gwibber-bzr' 'gwibber-microsoft-bzr' 'gwibber-sweston-bzr' 'gwibber-trunk-bzr' 'gwibber2.0' 'gwibber')
replaces=('gwibber<=1.0RC1' 'gwibber-bzr' 'gwibber-microsoft-bzr' 'gwibber-sweston-bzr' 'gwibber-trunk-bzr' 'gwibber2.0' 'gwibber' 'gwibber-new')
provides=('gwibber')
options=('!libtool')
source=("http://launchpad.net/${pkgrealname}/${_pkgmainver}/${pkgver}/+download/${pkgrealname}-${pkgver}.tar.gz"
	"do_not_prepend_is.patch")
md5sums=('361c77d9980c2a69f1d4446a006a7916'
	 '7257cff7ce20bd3dad25e49de985e6c8')

build() {
 	cd $srcdir/${pkgrealname}-${pkgver} 
	patch -p1 < $srcdir/do_not_prepend_is.patch
	python2 setup.py install --root=${pkgdir} || return 1
}
