# From xdebug-svn : Contributor: totoloco <totoloco en gmail>
# Contributor: numkem <numkem@gmail.com
pkgname=xdebug-git
pkgver=20130725
pkgrel=1
pkgdesc="PHP debugging extension, git version"
arch=('i686' 'x86_64')
url="http://www.xdebug.org"
license=('GPL')
depends=('php')
makedepends=('subversion' 'php')
provides=('xdebug')
conflicts=('xdebug')
replaces=('xdebug')
source=('git://github.com/derickr/xdebug.git' 'xdebug.ini')
backup=('etc/php/conf.d/xdebug.ini')
md5sums=('SKIP'
         'e1e4958f0f50dc12e8204933719ea972')
install="xdebug.install"

_gitname=xdebug

build() {
  cd ${srcdir}/${_gitname}

  phpize || return 1
  ./configure --prefix=/usr --enable-xdebug || return 1
  make || return 1

  #cd ${srcdir}/${_gitname}/debugclient || return 1
  #./buildconf
  #./configure --prefix=/usr || return 1
  #make || return 1
  
  install -D -m 744 modules/xdebug.so ${pkgdir}/usr/lib/php/modules/xdebug.so || return 1
  install -D -m 644 $startdir/xdebug.ini ${pkgdir}/etc/php/conf.d/xdebug.ini || return 1
}
