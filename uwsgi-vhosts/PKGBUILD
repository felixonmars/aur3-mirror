# uwsgi PKGBUILD file
# Maintainer Michael Whitford <michael at alwandassociates.com>
pkgname=uwsgi-vhosts
pkgver=0.9.9
pkgrel=2
pkgdesc='A fast, self-healing wsgi server coded in pure C. A sample configuration for virtual hosts is included.'
arch=('i686' 'x86_64')
url='http://projects.unbit.it/uwsgi'
license=('GPL2')
#groups=()
depends=('python2' 'libxml2')
makedepends=('gcc' 'python2')
#optdepends=()
provides=('uwsgi')
conflicts=('python-uwsgi' 'uwsgi')
#replaces=()
#backup=()
#options=()
#install=
#changelog=
source=('http://projects.unbit.it/downloads/uwsgi-0.9.9.tar.gz'
        'uwsgi.confd'
        'uwsgi.rcd'
        'uwsgi.xml'
        'uwsgi.logrotate')
#noextract=()
md5sums=('05bcb6a0425c9a45a3353aaa1da866a8'
         'fb392684a9ddc13dd931696d32bac711'
         '2e3940f5181623ff0511e7df6467a5a8'
         '3019883ea7bf55f07df68d0e13a016e2'
         'bfb67b818311d4103a9f142ce39a096e')

build() {
    cd $srcdir/uwsgi-$pkgver
    CFLAGS='' make -f Makefile.Py27
}

package() {
    cd $srcdir/uwsgi-$pkgver
    # the uwsgi binary
    mkdir -p $pkgdir/usr/bin
    install -D -m755 uwsgi $pkgdir/usr/bin/uwsgi
    # the rc.d init script
    mkdir -p $pkgdir/etc/rc.d
    install -D -m755 $srcdir/uwsgi.rcd $pkgdir/etc/rc.d/uwsgi
    # the conf.d settings
    mkdir -p $pkgdir/etc/conf.d
    install -D -m644 $srcdir/uwsgi.confd $pkgdir/etc/conf.d/uwsgi
    # the sample config
    mkdir -p $pkgdir/etc/uwsgi
    install -D -m644 -gnobody -onobody $srcdir/uwsgi.xml $pkgdir/etc/uwsgi/uwsgi.xml
    # the logrotate config
    mkdir -p $pkgdir/etc/logrotate.d
    install -D -m644 $srcdir/uwsgi.logrotate $pkgdir/etc/logrotate.d/uwsgi
}
