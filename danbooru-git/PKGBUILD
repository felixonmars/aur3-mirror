# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=danbooru-git
pkgver=20121229
pkgrel=1
pkgdesc="Application to access Danbooru-based image boards."
url="http://www.dennogumi.org/projects/danbooru-client"
arch=('any')
license=('GPL2')
depends=('kdebase-lib' 'kdebindings-python2' 'python2')
makedepends=('git')
conflicts=('danbooru-client')

_gitroot="git://gitorious.org/danbooru-client/danbooru-client.git"
_gitname="danbooru-client"


build() {
   cd $srcdir
   msg "Connecting to GIT server...."

   if [ -d $srcdir/$_gitname ] ; then
  	cd $_gitname && git pull origin
  	msg "The local files are updated."
   else
  	git clone $_gitroot
   fi

   msg "GIT checkout done or server timeout"
   msg "Starting make..."

   cp -r ${srcdir}/$_gitname ${srcdir}/$_gitname-build

   cd ./$_gitname-build

   # Desktop file fix
   sed -i 's|danbooru_client|python2 /usr/bin/danbooru_client|' danbooru_client.desktop

   cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
	 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
	 -DPYTHON_EXECUTABLE=/usr/bin/python2 \
	 -DPYTHON_SITE_PACKAGES_DIR=/usr/lib/python2.7/site-packages
   make
   make DESTDIR=$pkgdir install
}