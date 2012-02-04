# Contributor: Edgar Merino <donvodka@gmail.com>
pkgname=exaile-icastplugin
pkgver=0.5.1
pkgrel=1
pkgdesc="Stream music to an icecast/shoutcast server"
arch=('i686' 'x86_64')
url="http://devpower.blogsite.org:8080"
license=('GPL')
depends=('exaile' 'libshout' 'python-shout')
install='icast.install'
source=(http://devpower.blogsite.org:8080/archivos/icastplugin.py)
md5sums=c692bea1c1b40165f7041e5f184d65ba

build() {
  cd $startdir/src
  mkdir -p $startdir/pkg/usr/share/exaile/plugins
  cp icastplugin.py $startdir/pkg/usr/share/exaile/plugins/
}
