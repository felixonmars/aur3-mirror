# Contributor: twa022 <twa022@gmail.com>

pkgname=sonata-notify-bzr
pkgver=0.0.1
pkgrel=3
pkgdesc="Use libnotify to report info from Sonata."
arch=('any')
url="http://en.leoiannacone.com/2009/05/a-simple-plugin-for-sonata/"
license=('GPL')
depends=('sonata-git' 'python2-notify' 'python2>=2.7')
makedepends=('bzr')
source=()
md5sums=()
_bzrbranch=lp:~l3on/sonata
_bzrmod=sonata-plugins

build() {
  cd $srcdir
  msg "Connecting to the server...."
    
  bzr branch $_bzrbranch/$_bzrmod -q

  msg "BZR checkout done or server timeout"
  msg "Starting make..."

  [ -d ./${_bzrmod}-build ] && rm -rf ./${_bzrmod}-build
  cp -r ./${_bzrmod} ./${_bzrmod}-build
  cd ./${_bzrmod}-build

    install -D -m644 $srcdir/${_bzrmod}-build/notify.py $pkgdir/usr/lib/python2.7/site-packages/sonata/plugins/notify.py
}
