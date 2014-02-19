# Maintainer: Allen Zhong <moeallenz@gmail.com>

pkgname=eaccelerator-git
pkgver=r373.42067ac
pkgrel=1
pkgdesc="A free open-source PHP accelerator, optimizer, and dynamic content cache."
arch=('i686' 'x86_64')
url="http://eaccelerator.net/"
license=('GPL')
depends=('php')
makedepends=('git')
conflicts=('xcache' 'turck-mmcache' 'phpexpress' 'eaccelerator' 'eaccelerator-svn')
source=($pkgname::git+https://github.com/eaccelerator/eaccelerator.git
	php55.patch)
md5sums=('SKIP'
	 '92252bee98df6cbc468231f6f0a3184c')

pkgver() {
  cd $srcdir/$pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/$pkgname
  msg "Patching for PHP 5.5..."
    patch -s -p0 -i ../php55.patch eaccelerator.c
  msg "Patch finished."
}

build() {
  cd $srcdir/$pkgname

  phpize
  ./configure --prefix=/usr --with-eaccelerator-userid=http
  make
  make INSTALL_ROOT=$pkgdir install
  mkdir -p $pkgdir/etc/php/conf.d/
  mkdir -p $pkgdir/var/cache/eaccelerator
  chmod 777 $pkgdir/var/cache/eaccelerator
  cat $srcdir/$pkgname/eaccelerator.ini | gawk 'gsub("eaccelerator.cache_dir = \"/tmp/eaccelerator\"","eaccelerator.cache_dir = \"/var/cache/eaccelerator\"")1' > $pkgdir/etc/php/conf.d/eaccelerator.ini
}
