# Maintainer: Luke Turner <contact[at]luketurner[dot]org>
pkgname=graphite-web
pkgver=0.9.10
pkgrel=2
pkgdesc="Graphite provides real-time graphing for monitoring purposes."
url="http://www.graphite.wikidot.com"
arch=('x86_64' 'i686')
license=('Apache 2.0')
depends=('python2-cairo' 'django' 'django-tagging' 'python-simplejson' 'twisted')
optdepends=('statsd-git: feed data to Graphite' 'uwsgi: run Graphite server')
makedepends=()
conflicts=()
replaces=()
backup=()
install='graphite.install'
source=("http://pypi.python.org/packages/source/w/whisper/whisper-0.9.8.tar.gz"     "http://pypi.python.org/packages/source/c/carbon/carbon-0.9.6.tar.gz"
    "http://pypi.python.org/packages/source/g/graphite-web/graphite-web-0.9.10.tar.gz" 
    "uwsgi-graphite.yaml" "carbon.conf" "storage-schemas.conf" "local_settings.py")
md5sums=('c5f291bfd2d7da96b524b8423ffbdc68' 'e0959f15d151ee4476d8e433fcdcc734' 'b6d743a254d208874ceeff0a53e825c1' 'a01de5aa34898902657476f57b8782fa' 'd7fdde32aa572642439824b3716fb2b5' '5718857b020c83a11d2f515b30a43f44' '4217ca7f5f4e76fc0de266d81d20b5b1')

build() {
    cd $srcdir/carbon-0.9.6
    python2 setup.py install --root $pkgdir
    cd $srcdir/whisper-0.9.8
    python2 setup.py install --root $pkgdir
    cd $srcdir/graphite-web-0.9.10
    python2 setup.py install --root $pkgdir
    install -D $srcdir/uwsgi-graphite.yaml $pkgdir/opt/graphite/conf/uwsgi-graphite.yaml
    install -D $srcdir/carbon.conf $pkgdir/opt/graphite/conf/carbon.conf
    install -D $srcdir/storage-schemas.conf $pkgdir/opt/graphite/conf/storage-schemas.conf
    install -D $srcdir/local_settings.py $pkgdir/opt/graphite/webapp/graphite/local_settings.py
}

# vim:set ts=4 sw=2 et:
