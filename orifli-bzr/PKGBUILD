# Maintainer: J. W. Birdsong  <jwbirdsong AT gmail DOT com>

pkgname=orifli-bzr
_realname=orifli
pkgver=9
pkgrel=2
pkgdesc="A simple Flickr uploader"
arch=('any')
url="https://launchpad.net/orifli/"
license=('GPL')
depends=('python2' 'gtk2')
makedepends=('bzr')
provides=(orifli)
conflicts=(orifli)
source=($_realname.launcher)
md5sums=('38a130547363c3746103b7e4316b21cf')

_bzrtrunk=lp:orifli  
_bzrmod=orifli

  cd ${srcdir}

  msg "Connecting to the server...."

  if [ ! -d ./${_bzrmod} ]; then
    bzr co ${_bzrtrunk} ${_bzrmod} -r ${pkgver}
      else
    bzr up ${_bzrmod}
  fi

msg "BZR checkout done or server timeout"
msg "Starting make..."

[ -d ./${_bzrmod}-build ] && rm -rf ./${_bzrmod}-build
cp -r ./${_bzrmod} ./${_bzrmod}-build
cd ./${_bzrmod}-build

package() {
  cd "$srcdir/$_realname-build"
  sed -i "s|env python|env python2|" ${_realname}.py
  install -d $pkgdir/{usr/bin/,usr/share/$_realname/}
  mv $srcdir/$_realname-build/*  $pkgdir/usr/share/$_realname/

  #Install the Launcher
  install -D -m755 $srcdir/$_realname.launcher \
    $pkgdir/usr/bin/$_realname
}

# vim:set ts=2 sw=2 et:

