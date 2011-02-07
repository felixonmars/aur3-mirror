# Contributor: alphazo <alphazo@gmail.com>
pkgname=sshuttle-git
pkgver=20110207
pkgrel=1
pkgdesc="Transparent proxy server that works as a poor man's VPN. Forwards all TCP packets over ssh (and even DNS requests when using --dns option). Doesn't require admin privileges on the server side."
arch=('any')
url="https://github.com/apenwarr/sshuttle"
license=('GPL')
groups=()
depends=('python2' 'iptables')
makedepends=('git')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()

source=(arch-install.patch)
md5sums=('04885351d376734ca0502cbf93566d36')


_gitroot="git://github.com/apenwarr/sshuttle.git"
_gitname="sshuttle"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  # As of 2011-02-07, we need to use the autopython branch for ArchLinux (python2 + file relocation), should be merged into master soon.
  git checkout 340223b839b3b9829e2756a769e86fbdcdd1a005

  # Patch launcher with files location (/usr/share/sshuttle)
  patch -p1 -i "${srcdir}/arch-install.patch"

  #
  # BUILD HERE
  #
  install -Dm755 $srcdir/$_gitname-build/sshuttle $pkgdir/usr/bin/sshuttle || return 1
  mkdir -p $pkgdir/usr/share/sshuttle 
  cp -r $srcdir/$_gitname-build/* $pkgdir/usr/share/sshuttle || return 1

} 








 
