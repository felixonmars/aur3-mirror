# Maintainer: Bruno Adele <bruno.adele#jesuislibre.org>
pkgname=domogik-hg
pkgver=4949
pkgrel=1
pkgdesc="OpenSource home automation software. (core)."
arch=('i686' 'x86_64')
url="http://www.domogik.org"
license=('GPL')
depends=('bash' 'python2' 'mysql-python>=1.2.3' 'python2-pip' 'python2-pyserial>=2.5' 'python2-distutils2' \
         'python2-pyinotify>=0.8.9' 'python2-psutil>=0.1.3' 'python2-httplib2>=0.6.0' 'python2-migrate>=0.7.1' \
         'python2-pyopenssl>=0.1.3' 'python-simplejson>=1.9.2')
makedepends=('mercurial python2-distribute')
optdepends=('mysql: for use with mysql database'
'libmysqlclient: for use with mysql database'
'postgresql: for use with postgresql database')
conflicts=(domogik)
replaces=(domogik)
backup=('etc/domogik/domogik.cfg' 'etc/domogik/sources.list')
source=('requires.patch')
options=()
install=domogik.install
sha256sums=('6338a7032d4fe3f47bfbfa1ac87d82fa2553ffe0e79cee3935f95744e9866511')

_hgroot="http://hg.domogik.org/"
_hgrepo="domogik"

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u || return 1
    msg "The local files are updated."
  else
    hg clone $_hgroot $_hgrepo || return 1
  fi

  # remove old build
  msg "remove oldest sources"
  rm -rf $srcdir/$_hgrepo-build
  mkdir $srcdir/$_hgrepo-build

  # Copy sources from mercurial
  msg "copy sources from repository"
  cd $srcdir/$_hgrepo
  ls -A | grep -v .hg | xargs -d '\n' cp -r -t ../$_hgrepo-build

  cd $srcdir/$_hgrepo-build

  # patch requires
  patch setup.py  < $startdir/requires.patch

  # Patch domogik install
  #cp ../../install.sh .
  #cp ../../setup.py .
  #sed "s!--SRCDIR--!$pkgdir/!" -i install.sh

  # Path for use with python2 .py
  msg "Replace .py header (be patient) 1/2"
  find . -name "*\.py"  -exec sed 's#python$#python2#' -i {} \; || return 1
  msg "Replace .py header (be patient) 2/2"
  find . -name "*\.py"  -exec sed 's#python #python2 #' -i {} \; || return 1

  # Path for use with python2 .sh
  msg "Replace .sh header (be patient) 1/2"
  find . -name "*\.sh"  -exec sed 's#python$#python2#' -i {} \; || return 1
  msg "Replace .sh header (be patient) 2/2"
  find . -name "*\.sh"  -exec sed 's#python #python2 #' -i {} \; || return 1

  # Fix previous replace
  sed 's#MySQL\-python2#MySQL\-python#' -i setup.py

  # Build
  python2 setup.py  build
}

package() {
  cd $srcdir/$_hgrepo-build

  # Install
  python2 setup.py  install  --root=$pkgdir/ 

  # Configuration file
  install -d $pkgdir/etc/$_hgrepo
  install -D -m644 src/domogik/examples/config/domogik.cfg  $pkgdir/etc/$_hgrepo/$_hgrepo.cfg
  install -D -m644 src/domogik/examples/packages/sources.list $pkgdir/etc/$_hgrepo/sources.list

  # install logrotate
  install -D -m644 src/domogik/examples/logrotate/domogik $pkgdir/etc/logrotate.d/domogik
  install -dm755 $pkgdir/var/log/$_hgrepo

  # Create cache directory
  install -dm755  $pkgdir/var/cache/$_hgrepo/pkg-cache
  install -dm755  $pkgdir/var/cache/$_hgrepo/cache
  install -dm755  $pkgdir/var/cache/$_hgrepo/tmp

  # ?
  #install -d $pkgdir/var/lib/$_hgrepo
  #install -d $pkgdir/var/lib/$_hgrepo/domogik_packages 
  install -d $pkgdir/var/lib/$_hgrepo/domogik_packages/plugins 
  install -d $pkgdir/var/lib/$_hgrepo/domogik_packages/externals 
  install -d $pkgdir/var/lib/$_hgrepo/domogik_packages/stats 
  install -d $pkgdir/var/lib/$_hgrepo/domogik_packages/url2xpl 
  install -d $pkgdir/var/lib/$_hgrepo/domogik_packages/design
  install -d $pkgdir/var/lib/$_hgrepo/domogik_packages/data


  # Daemon service
  mv $pkgdir/etc/init.d $pkgdir/etc/rc.d

  # Installer
  install -d $pkgdir/usr/share/doc/domogik
  cp -R install $pkgdir/usr/share/doc/domogik/
}
