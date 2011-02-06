# Contributor: Max Garmash <max.garmash@gmail.com>

pkgname=jets3t-hg
pkgver=0.8.1
pkgrel=1
pkgdesc="Java library and front-end (cockpit) for accessing Amazon Simple Storage Service (Amazon S3)"
arch=('i686' 'x86_64')
url="http://bitbucket.org/jmurty/jets3t/wiki/Home"
license=('Apache 2')
depends=('java-runtime' 'mercurial' 'apache-ant')
conflicts=('jets3t')
optdepends=('java-jce_policy: enables stronger encryption')
source=(jets3t.sh)
md5sums=('030cdcfb38ea5fb68262fba543aae75b')

build() {
  cd $srcdir
  hg clone https://bitbucket.org/jmurty/jets3t
  cd jets3t
  ant
  mkdir -p $pkgdir/usr/share/java/$pkgname
  rm $srcdir/jets3t/dist/jets3t-$pkgver-dev/bin/*.bat
  chmod 755 $srcdir/jets3t/dist/jets3t-$pkgver-dev/bin/*.sh
  cp -a $srcdir/jets3t/dist/jets3t-$pkgver-dev/* $pkgdir/usr/share/java/$pkgname/

  install -D -m 755 $srcdir/jets3t/dist/jets3t-$pkgver-dev/bin/cockpit.sh $pkgdir/usr/bin/cockpit
  install -D -m 755 $srcdir/jets3t/dist/jets3t-$pkgver-dev/bin/cockpitlite.sh $pkgdir/usr/bin/cockpitlite
  install -D -m 755 $srcdir/jets3t.sh $pkgdir/etc/profile.d/jets3t.sh
}

