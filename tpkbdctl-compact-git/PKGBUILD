# Maintainer: Florian Jacob <projects PLUS arch ÄT florianjacob DÖT de>
pkgname=tpkbdctl-compact-git
pkgver=20141129
pkgrel=1
pkgdesc="A tool that can be used to control features of the \"Lenovo ThinkPad Compact USB Keyboard with TrackPoint\"
(Fork to support the compact version)"
arch=('i686' 'x86_64')
url="https://github.com/bseibold/tpkbdctl"
license=('GPL2')
depends=('linux>=3.0' 'python')
conflicts=('tpkbdctl-git')
makedepends=('git')
backup=('etc/default/tpkbdctl')
install=tpkbdctl.install
source=(10-tpkbdctl.rules
	tpkbdctl.default
        tpkbdctl_runner)
md5sums=('8b04ed533dfc1ee3b1e1c3fa19fff2ce'
         'cc40b7b7c32ed713aafabc0af385a168'
         '69fd4aafd2a21798f86d98a9eb2d6ecd')

_gitroot=https://github.com/hiikezoe/tpkbdctl.git
_gitname=tpkbdctl

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
  mkdir "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname" && ls -A | grep -v .git | xargs -d '\n' cp -r -t ../$_gitname-build # do not copy over the .git folder
  cd "$srcdir/$_gitname-build"
}

package() {
  cd "$srcdir/$_gitname-build"
  python setup.py install --root=$pkgdir --optimize=1

#install udev rule
  install -D -m644 $srcdir/10-tpkbdctl.rules $pkgdir/etc/udev/rules.d/10-tpkbdctl.rules

#install default configuration file
  install -D -m644 $srcdir/tpkbdctl.default $pkgdir/etc/default/tpkbdctl

#install runner
  install -D -m744 $srcdir/tpkbdctl_runner $pkgdir/usr/bin/tpkbdctl_runner
}
