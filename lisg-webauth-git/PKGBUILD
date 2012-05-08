# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Your Name <youremail@domain.com>
pkgname=lisg-webauth-git
pkgver=20120508
pkgrel=2
pkgdesc="Linux ISG"
arch=('i686' 'x86_64')
url="http://bitbucket.org/sysoleg/lisg/"
license=('GPL')
groups=()
depends=('perl-net-radius' 'perl-net-ipaddress' 'perl-poe' 'iptables' 'iproute2' 'ipset')
makedepends=('git' 'linux-headers')
provides=()
conflicts=()
replaces=()
backup=(usr/local/ISG/etc/config.pl)
options=()
install=lisg.install
source=(http://dl.dropbox.com/u/12495607/web_auth_v8.patch lisg.install lisg.rules fix_recent_kernels_build.patch)
noextract=()
md5sums=('b164a93a5b3ac8e136ae77e4c61f6954'
         '9e5a55e4d1465e5ed53b65b9ecf9f986'
         '29782e38a66f1fdaabdf2a61ed9da98f'
         '9d31762c587ef4b68d867ffcf29bff50')

_gitroot="https://bitbucket.org/sysoleg/lisg.git"
_gitname="lisg"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  msg "Getting iptables source"

  iptver=`iptables -V | sed -n s/iptables.v//p`
  wget http://www.iptables.org/projects/iptables/files/iptables-${iptver}.tar.bz2
  tar xvfj iptables-${iptver}.tar.bz2
  cd iptables-${iptver}

  msg "Configuring iptables..."

  ./configure > /dev/null
  iptsrc=`pwd`

  msg "Starting make..."

#  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  patch -p1 < $srcdir/web_auth_v8.patch
  patch -p1 < $srcdir/fix_recent_kernels_build.patch

  cd kernel
  ./configure --ipt-src=${iptsrc}
  make || return 1
}

package() {
  cd "$srcdir/$_gitname-build/kernel"
  make kinstall INSTALL_MOD_PATH=$pkgdir/
  install -D -m 644 libipt_ISG.so $pkgdir/usr/lib/iptables/libipt_ISG.so
  mkdir -p $pkgdir/usr/local
  cp -r $srcdir/$_gitname-build/ISG $pkgdir/usr/local/
  install -D -m 755 $srcdir/$_gitname-build/ISG/contrib/rc.ISGd $pkgdir/etc/rc.d/lisg
  install -D -m 644 $srcdir/lisg.rules $pkgdir/etc/iptables/lisg.rules
}

# vim:set ts=2 sw=2 et:
