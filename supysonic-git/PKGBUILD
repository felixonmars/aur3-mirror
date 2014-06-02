# Maintainer: andrenam <andrenam.berger at gmail dot com>

pkgname=supysonic-git
pkgver=r138.c29a228
pkgrel=1
pkgdesc="Supysonic is a Python implementation of the Subsonic server API."
arch=('any')
url="https://github.com/spl0k/supysonic"
license=('AGPL3')
depends=('python2' 'python2-flask' 'python2-sqlalchemy' 'python2-pillow' 'python2-simplejson' 'python2-requests' 'python2-mutagen')
makedepends=('git')
conflicts=('supysonic')
provides=('supysonic')
optdepends=('ffmpeg: for transcoding'
	    'lame: for transcoding'
            'nginx: as http server'
	    'uwsgi: for serving via nginx')
backup=('etc/supysonic')
install='supysonic-git.install'
source=("$pkgname"::git+https://github.com/spl0k/supysonic.git#branch=master
	'supysonic')
md5sums=('SKIP'
         '07cfdce255d0159fd7757e5a5acab66a')


pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  #sed -i 's_#!/usr/bin/python$_#!/usr/bin/env python2_' *.py bin/supysonic-cli supysonic.cgi supysonic.fcgi
}

package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 ${srcdir}/supysonic ${pkgdir}/etc/supysonic
  install -d ${pkgdir}/var/lib/supysonic
  install -Dm644 ${srcdir}/${pkgname}/supysonic.wsgi ${pkgdir}/var/lib/supysonic/supysonic.wsgi
  install -Dm644 ${srcdir}/${pkgname}/supysonic.cgi ${pkgdir}/var/lib/supysonic/supysonic.cgi
  install -Dm644 ${srcdir}/${pkgname}/supysonic.fcgi ${pkgdir}/var/lib/supysonic/supysonic.fcgi
}

