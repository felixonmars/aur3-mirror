# Maintainer: Gabriel Pickl <gabriel@syntax-austria.org>
pkgname=restauth-server-git
pkgver=20120428
pkgrel=1
pkgdesc="A webservice providing shared authorization, authentication and preferences."
url="http://server.restauth.net"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('django' 'python-mimeparse' 'restauth-common-git')
optdepends=()
makedepends=('git' 'python2')
provides=('restauth-server')
conflicts=()
replaces=()
backup=()
#install=''

_gitroot="http://git.fsinf.at/restauth/server.git"
_gitname="restauth"
 
build() {
	cd "$srcdir"
	msg "Connecting to GIT Server..."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files have been updated"
	else
		git clone $_gitroot $_gitname
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make"

	rm -rf "$srcdir/$_gitname-build"
	git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd "$srcdir/$_gitname-build"
	python2 setup.py build
	msg "Starting test"
	#python2 setup.py test
}
 
package() {
  cd "${srcdir}/$_gitname-build"
  python2 setup.py install --prefix "${pkgdir}/usr"
  for i in $(ls bin/*.py);
  do 
  	mv $i $(echo $i|sed "s/\.py//");
  done
  mkdir -p ${pkgdir}/usr/bin
  if [ ! -e /usr/bin/python ]; then
  	ln -s /usr/bin/python2 ${pkgdir}/usr/bin/python
  fi
  install -Dm655 bin/* "${pkgdir}/usr/bin"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 RestAuth/fixtures/testserver.json "$pkgdir/usr/share/restauth/testserver.json"
  ln -s /usr/lib/python2.7/site-packages/RestAuth/manage.py "${pkgdir}/usr/bin/restauth-manage"
  chmod 755 ${pkgdir}/usr/lib/python2.7/site-packages/RestAuth/manage.py
}
