# Contributor: Jan Stępień <jstepien@users.sourceforge.net>

pkgname=topaz-nightly
pkgver=0
pkgrel=1
pkgdesc="High performance implementation of Ruby on top of RPython"
url="http://www.topazruby.com/"
arch=('x86_64')
depends=()
makedepends=('curl')
license=('BSD3')
source=('topaz.sh')
sha1sums=('bb88cbd36e3b76278bab33c5396d4917f8992dba')

build() {
  hash=$(curl -s http://www.topazruby.com/builds/linux64/ \
    | egrep -i '[a-e0-9]{40}' \
    | head -1 \
    | sed 's,.*/commit/,,; s,">.*,,')
  rm -f "topaz-linux64-$hash.tar.bz2"
  wget "http://builds.topazruby.com/topaz-linux64-$hash.tar.bz2"
  mkdir -p $pkgdir/opt/
  tar -xf topaz-linux64-$hash.tar.bz2 -C $pkgdir/opt/
  mkdir -p $pkgdir/usr/bin/
  install -m 755 topaz.sh $pkgdir/usr/bin/topaz
  mkdir -p $pkgdir/usr/share/licenses/$pkgname/
  ln -s /opt/topaz/LICENSE $pkgdir/usr/share/licenses/$pkgname
}
