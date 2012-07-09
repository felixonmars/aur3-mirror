# Maintainer: Fred Morcos <fred.morcos@gmail.com>
# Development: https://github.com/fredmorcos/sysconf

pkgname=sysconf-git
pkgver=20120709
pkgrel=1
pkgdesc="A shell script to handle power management and other things on Linux systems."
url="https://github.com/fredmorcos/sysconf"
arch=('any')
license=('WTFPL2')
depends=('linux' 'bash' 'kmod' 'procps-ng' 'psmisc' 'coreutils' 'sysvinit')
optdepends=(
  'ethtool: Support for disabling Wake-on-LAN and down-throttling network adapters'
  'net-tools: Support for disabling network adapters'
  'wireless_tools: Support for wifi power management'
  'bluez: Support for disabling bluetooth radio')
makedepends=('git')
provides=('sysconf')
conflicts=('sysconf')
install=$pkgname.install

_gitroot="git://github.com/fredmorcos/sysconf.git"
_gitname="sysconf"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server..."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" && cd "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  # ./autogen.sh
  # ./configure --prefix=/usr
  # make
}

package() {
  cd "$srcdir/$_gitname-build"
  make prefix="$pkgdir/usr" install
}
