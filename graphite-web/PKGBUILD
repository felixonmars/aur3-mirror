# Maintainer: Luke Turner <contact[at]luketurner[dot]org>
pkgname=graphite-web
pkgver=0.9.10
pkgrel=3
pkgdesc="Graphite provides real-time graphing for monitoring purposes."
url="http://www.graphite.wikidot.com"
arch=('x86_64' 'i686')
license=('Apache 2.0')
depends=('python2-cairo' 'python2-django' 'django-tagging' 'python2-simplejson' 'twisted')
optdepends=('statsd-git: feed data to Graphite' 'uwsgi: run Graphite server')
makedepends=()
conflicts=()
replaces=()
backup=()
install='graphite.install'
source=("http://pypi.python.org/packages/source/w/whisper/whisper-0.9.10.tar.gz"
        "http://pypi.python.org/packages/source/c/carbon/carbon-0.9.10.tar.gz"
        "http://pypi.python.org/packages/source/g/graphite-web/graphite-web-0.9.10.tar.gz"
        "uwsgi-graphite.ini"
        "carbon.conf"
        "storage-schemas.conf"
        "local_settings.py"
        "carbon.rc")
md5sums=('218aadafcc0a606f269b1b91b42bde3f'
         '1d85d91fe220ec69c0db3037359b691a'
         'b6d743a254d208874ceeff0a53e825c1'
         'f8ef934481c8b98a54fb426542d75f46'
         'd7fdde32aa572642439824b3716fb2b5'
         '5718857b020c83a11d2f515b30a43f44'
         '4217ca7f5f4e76fc0de266d81d20b5b1'
         '2bf01bf3322b5ed964f1277ba01420f7')

build() {
    cd $srcdir/carbon-$pkgver
    python2 setup.py install --root $pkgdir
    cd $srcdir/whisper-$pkgver
    python2 setup.py install --root $pkgdir
    cd $srcdir/graphite-web-$pkgver
    python2 setup.py install --root $pkgdir
    install -D $srcdir/uwsgi-graphite.ini $pkgdir/opt/graphite/conf/uwsgi-graphite.ini
    install -D $srcdir/carbon.conf $pkgdir/opt/graphite/conf/carbon.conf
    install -D $srcdir/storage-schemas.conf $pkgdir/opt/graphite/conf/storage-schemas.conf
    install -D $srcdir/local_settings.py $pkgdir/opt/graphite/webapp/graphite/local_settings.py
    install -D $srcdir/carbon.rc $pkgdir/etc/rc.d/carbon
}

# vim:set ts=4 sw=2 et:
