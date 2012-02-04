# Contributor: Vadym Abramchuk <abramm@gmail.com>
pkgname=lisg-webauth-hg
pkgver=39
pkgrel=1
pkgdesc="Linux ISG"
arch=('i686' 'x86_64')
url="http://bitbucket.org/sysoleg/lisg/"
license=('GPL')
groups=()
depends=('perl-net-radius' 'perl-net-ipaddress' 'iptables' 'iproute2' 'ipset')
makedepends=('mercurial' 'kernel26-headers')
provides=()
conflicts=()
replaces=()
backup=(usr/local/ISG/etc/config.pl)
options=()
install=lisg.install
source=(http://dl.dropbox.com/u/12495607/web_auth_v7.patch lisg.install lisg.rules)
noextract=()
md5sums=('907e780902180810df7f18f61fd758ea'
         '9e5a55e4d1465e5ed53b65b9ecf9f986'
         '29782e38a66f1fdaabdf2a61ed9da98f')

_hgroot="http://bitbucket.org/sysoleg"
_hgrepo="lisg"

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

  msg "Mercurial checkout done or server timeout"

  msg "Getting iptables source"

  iptver=`iptables -V | sed -n s/iptables.v//p`
  wget http://www.iptables.org/projects/iptables/files/iptables-${iptver}.tar.bz2
  tar xvfj iptables-${iptver}.tar.bz2
  cd iptables-${iptver}

  msg "Configuring iptables..."

  ./configure > /dev/null
  iptsrc=`pwd`

  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  patch -p1 < $srcdir/web_auth_v7.patch

  cd kernel
  ./configure --ipt-src=${iptsrc}
  make || return 1
#  make DESTDIR="$pkgdir/" install || return 1
  make kinstall INSTALL_MOD_PATH=$pkgdir/
  install -D -m 644 libipt_ISG.so $pkgdir/usr/lib/iptables/libipt_ISG.so
  mkdir -p $pkgdir/usr/local
  cp -r $srcdir/$_hgrepo-build/ISG $pkgdir/usr/local/
  install -D -m 755 $srcdir/$_hgrepo-build/ISG/contrib/rc.ISGd $pkgdir/etc/rc.d/lisg
  install -D -m 644 $srcdir/lisg.rules $pkgdir/etc/iptables/lisg.rules
} 
