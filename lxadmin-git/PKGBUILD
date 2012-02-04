pkgname=lxadmin-git
pkgver=20120117
pkgrel=1
pkgdesc="A collection of tools to configure your desktop under LXDE"
arch=('i686' 'x86_64')
url="http://lxde.org"
license=('GPL')
depends=('python')
makedepends=('git' 'intltool' 'pkgconfig' 'python' 'gnome-common')
source=('su-to-root'
	'su-to-rootrc')
groups=('lxde-git')

_gitroot=http://github.com/gilir/LXAdmin.git
_gitname=LXAdmin

build() {
  cd "$srcdir"

  msg "Connecting to $_gitroot..."
  if [[ -d $_gitname ]]; then
    cd $_gitname && git pull origin && cd ..
    msg2 "Local files updated"
  else
    git clone $_gitroot
    msg2 "Git checkout done"
  fi

  rm -rf $_gitname-build
  git clone $_gitname $_gitname-build
  cd $_gitname-build

  msg "Starting make..."
#  sed -i -e 's:AS_AC_EXPAND:#AS_AC_EXPAND:' configure.ac
  ./autogen.sh || return1
#  gnome-autogen.sh || return 1
  ./configure --prefix=/usr --sysconfdir=/etc || return 1
  make || return 1
}

package() {
  cd "$srcdir/$_gitname-build"  
  make DESTDIR="$pkgdir" install || return 1
  touch $pkgdir/usr/lib/python2.7/site-packages/lxadmin/__init__.py
  mkdir $pkgdir/etc/
  install -m 755 $startdir/su-to-root	$pkgdir/usr/bin/
  install -m 644 $startdir/su-to-rootrc	$pkgdir/etc
  for k in $pkgdir/usr/share/locale/* ; 
    do
	cp $k/LC_MESSAGES/lxadmin.mo $k/LC_MESSAGES/lxcc.mo ;
#	cp $k/LC_MESSAGES/lxadmin.mo $k/LC_MESSAGES/lxdmconf.mo
#	cp $k/LC_MESSAGES/lxadmin.mo $k/LC_MESSAGES/lxfontconfig.mo
#	cp $k/LC_MESSAGES/lxadmin.mo $k/LC_MESSAGES/lxkeyboardconf.mo
#	cp $k/LC_MESSAGES/lxadmin.mo $k/LC_MESSAGES/lxscreenshot.mo
#	cp $k/LC_MESSAGES/lxadmin.mo $k/LC_MESSAGES/lxservices.mo
#	cp $k/LC_MESSAGES/lxadmin.mo $k/LC_MESSAGES/openbox-keyconf.mo
    done
  sed -e  's!/usr/bin/python!/usr/bin/python2!' -i  $pkgdir/usr/bin/*
}
md5sums=('a0c9efb3b13723743240cf28cd654e90'
         'f8de61c5fd70720848458facd056ca29')
