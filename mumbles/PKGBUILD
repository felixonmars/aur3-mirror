# Contributor: Oleg Dashevskii <olegdashevskii@gmail.com>
pkgname=mumbles
pkgver=0.4
pkgrel=2
pkgdesc="Plugin-driven, DBus based notification system written for Gnome"
arch=(i686 x86_64)
url="http://mumbles-project.org"
license=('GPL')
groups=()
depends=('dbus-python' 'pygtk' 'pycairo' 'setuptools')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://downloads.sourceforge.net/mumbles/${pkgname}_$pkgver-1.tar.gz paths.patch)
noextract=()
md5sums=('a6b24223dc23e5022332586ffc454e84' '6e13a9633548240becc966d84b977b95')


build() {
  cd "$srcdir/$pkgname-$pkgver"
  
#  for _plugin in src/plugins/eggs/*; do
#    _init=$_plugin/src/__init__.py
#    mv $_init ${_init}.old
#	echo "from mumbles import MumblesPlugin" > $_init
#	cat ${_init}.old >> $_init
#	rm ${_init}.old
#
#	_savedir=`pwd`
#	cd $_plugin
#	python setup.py bdist_egg
#	cd $_savedir
#  done

  patch -Np1 -i ../paths.patch || return 1
  python setup.py install --root="$pkgdir" || return 1
  mv $pkgdir/usr/lib/python2.5/site-packages/src $pkgdir/usr/lib/python2.5/site-packages/mumbles
  rm $pkgdir/usr/lib/python2.5/site-packages/mumbles-${pkgver}-py2.5.egg-info
}
