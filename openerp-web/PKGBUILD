# Contributor: apkawa <apkawa@gmail.com>

pkgname=openerp-web
pkgver=6.0.3
pkgrel=2
pkgdesc="OpenERP web (python2)"
url="http://openerp.com/"
arch=('i686' 'x86_64')
license=(GPL3)
depends=('python2' 'python2-pytz'
'python-formencode' 'python-babel' 'python-dateutil'
'python2-mako' 'python2-cherrypy<=3.1.2' 'python-simplejson')
source=(
http://www.openerp.com/download/stable/source/$pkgname-$pkgver.tar.gz
openerp-web.rc
)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir ${pkgdir}/etc/{rc.d,openerp} -p
  mkdir ${pkgdir}/usr/doc/openerp-web/ -p
  #TODO fixed daemonize =_=. RUN AS SCREEN?
  install -Dm 755 ${srcdir}/openerp-web.rc ${pkgdir}/etc/rc.d/openerp-web

  python2 setup.py install --root=$pkgdir
  mv ${pkgdir}/usr/addons ${pkgdir}/usr/lib/python2.*/site-packages/
  cp ${pkgdir}/usr/openobject ${pkgdir}/usr/lib/python2.*/site-packages/ -r
  rm -rf ${pkgdir}/usr/openobject
  cp ${pkgdir}/usr/doc/openerp-web.cfg ${pkgdir}/etc/openerp/

  cp ${pkgdir}/usr/doc/{LICENSE.txt,ChangeLog,openerp-web.cfg,packaging.txt} ${pkgdir}/usr/doc/openerp-web/
  rm ${pkgdir}/usr/doc/{LICENSE.txt,ChangeLog,openerp-web.cfg,packaging.txt}

}

# vim:set ts=4 sw=4 et:

md5sums=('eaa564874a29993ce9d9d82247103fe5'
         'b517fa19d0263ee18edd2ad1c8c7de90')
