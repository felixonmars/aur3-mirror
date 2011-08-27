# Maintainer: ubunblox <ubunblox@gmail.com>
# Contributor : fredbezies <fredbezies@gmail.com>


pkgname=gwibber-new
pkgrealname=gwibber
pkgver=3.1.0
pkgrel=1
pkgdesc="an open source microblogging client for GNOME"
arch=('any')
url="https://launchpad.net/gwibber/3.0"
license=('GPL')
depends=('python2' 'dbus-python' 'pygtk' 'python2-gconf' 
'python-imaging' 'pywebkitgtk' 'python-simplejson' 
'python-egenix-mx-base' 'python-distutils-extra' 'python-feedparser' 'pyxdg' 'python-mako' 'python-pycurl' 'python-wnck' 'python2-gtkspell' 'python2-oauth' 'python-gnomekeyring' 'gnome-keyring' 'hspell')
source=(http://launchpad.net/gwibber/3.2/3.1.0/+download/$pkgrealname-$pkgver.tar.gz)
md5sums=('e022ad230bd7ef0c735069ba6407df0d')

 
 
build() {
 	cd $srcdir/${pkgrealname}-${pkgver} 
	python2 setup.py install --root=${pkgdir} || return 1
}
