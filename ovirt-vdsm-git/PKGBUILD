# Submitter: Jacek Burghardt <jacek@hebe.us>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>

# reference http://www.dreyou.org/ovirt/ovirt-engine/Packages/
# http://resources.ovirt.org/releases/stable/rpm/Fedora/19/x86_64/

pkgname=ovirt-vdsm-git
_gitname='vdsm'
pkgver=v4.14.1.143.g7e49fb2
pkgrel=1
pkgdesc="Plugin for Management server for Open Virtualization"
arch=(any)
url="http://ovirt.org"
license=('apache2')
makedepends=('git' 'maven3' 'flake8' 'libnl1' 'libvirt-git' 'sanlock' 'python2-libvirt' 'python2-pyinotify' 'python2-cpopen' 'python2-pyflakes' 'python2-ethtool' 'python2-pthreading' 'python2-netaddr' 'python2-nose' 'libselinux')
depends=('python2-m2crypto' 'libnl' 'pyparted' 'multipath-tools' 'python2-pip' 'jboss-as' 'python2-libvirt' 'python2-pyinotify' 'python2-cpopen' 'python2-pyflakes' 'python2-ethtool' 'python2-pthreading' 'python2-netaddr' 'python2-nose' 'libselinux' )
options=(!strip !buildflags)
install=ovirt-vdsm.install
source=("$_gitname::git+http://gerrit.ovirt.org/p/vdsm.git"
	supervdsmd.service
	vdsm-restore-net-config.service
	vdsmd.service
	vdsm-sysctl.conf
	vdsm-tmpfiles.d.conf	
	)
md5sums=('SKIP'
	 'c0368bc47176d17bb6c8b4189b5b2d25'
         '2697d03fc2019ab383ba2618733d2bf8'
         'b0a87a04085418373ed051b988441769'
         'f3fb772a67c045d09f0f08d82570f65d'
         '5799f7f86b6197d02ae399f60a347c1d')

prepare() {
  cd "$srcdir"
  if [ -d $srcdir/$_gitname ] ; then
    msg "Git checkout:  Updating existing tree"
    cd $_gitname && git pull origin
    msg "Git checkout:  Tree has been updated"
  else
    msg "Git checkout:  Retrieving sources"
    git clone $_gitroot
  fi
  rm -rf "$srcdir/${_gitname}-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
}
pkgver() {
  cd "$srcdir/$_gitname"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$srcdir/$_gitname-build"
  export PYTHON=python2.7 
  ./autogen.sh --system 
  ./configure --prefix=/usr --sbin=/usr/bin --sysconfdir=/etc --localstatedir=/var 
  make all
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR=$pkgdir install
  mkdir -p $pkgdir/usr/lib/systemd/system
  mkdir -p $pkgdir/var/run/vdsm/
  install -D -m 644 $srcdir/supervdsmd.service $pkgdir/usr/lib/systemd/system
  install -D -m 644 $srcdir/vdsm-restore-net-config.service $pkgdir/usr/lib/systemd/system
  install -D -m 644 $srcdir/vdsmd.service $pkgdir/usr/lib/systemd/system
  mkdir -p $pkgdir/usr/lib/tmpfiles.d/
  install -D -m 644 $srcdir/vdsm-tmpfiles.d.conf $pkgdir/usr/lib/tmpfiles.d/	
}
