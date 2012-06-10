# Maintainer: Bruno Adele <bruno.adele@jesuislibre.org>
pkgname=domoweb-hg
pkgver=358
pkgrel=2
pkgdesc="OpenSource home automation software web interface."
arch=('i686' 'x86_64')
url="http://www.domogik.org"
license=('GPL')
depends=('bash' 'python2' 'django>=1.3.1' 'django-tastypie' 'python2-distutils2' 'python2-httplib2>=0.6.0' \
         'python-simplejson>=1.9.2' 'python2-cherrypy')
makedepends=('mercurial')
conflicts=(domoweb)
replaces=(domoweb)
backup=('etc/default/domoweb' 'etc/domoweb/domoweb.cfg')
options=()
install=domoweb.install

_hgroot="http://hg.domogik.org/"
_hgrepo="domoweb"

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u || return 1
    msg "The local files are updated."
  else
    hg clone $_hgroot $_hgrepo || return 1
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  cd $srcdir/$_hgrepo

  # Path for use with python2
  msg "Replace python header (be patient) 1/2"
  find "$srcdir/$_hgrepo" -type f  -exec sed 's#python$#python2#' -i {} \; || return 1
  msg "Replace python header (be patient) 2/2"
  find "$srcdir/$_hgrepo" -type f  -exec sed 's#python #python2 #' -i {} \; || return 1

  # patch setup.py 
  sed 's#init\.d#rc\.d#' -i setup.py

  # Patch generate revision
  sed "s#/var/lib/domoweb/domoweb.dat#$pkgdir/var/lib/domoweb/domoweb.dat#" -i generate_revision.py
}

package() {
  cd "$srcdir/$_hgrepo"

  # Install
  python2 setup.py  install  --root=$pkgdir/ 

  install -d $pkgdir/var/lib/domoweb
  python2 ./generate_revision.py

  mkdir -p $pkgdir/etc/$_hgrepo
  install -D src/examples/config/domoweb.cfg $pkgdir/etc/$_hgrepo/$_hgrepo.cfg
  #install -D src/examples/default/domoweb $pkgdir/etc/default/domoweb

  #install -D src/examples/init/domoweb $pkgdir/etc/rc.d/domoweb

  install -d -m 644 $pkgdir/etc/logrotate.d/$_hgrepo

  mkdir -p $pkgdir/var/lib/$_hgrepo
}
