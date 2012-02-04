# Maintainer:  Matthew Bauer <mjbauer95@gmail.com>

pkgname=pytivo-wmcbrine-git
pkgver=20090925
pkgrel=1
pkgdesc="pyTivo is both an HMO and GoBack server. Similar to TiVo Desktop pyTivo loads many standard video compression codecs and outputs mpeg2 video to the TiVo. However, pyTivo is able to load MANY more file types than TiVo Desktop."
arch=(i686 x86_64)
url="http://pytivo.sourceforge.net/"
license=('GPL')
depends=('ffmpeg' 'python>=2.4')
optdepends=('pil: for photo plugin' 'dnspython: XMPP' 'pydns: XMPP')
makedepends=('git')
provides=('pytivo')
source=(rc.d)
md5sums=('e757e9a66d374c457ff16007404a41d0')


_gitroot="git://repo.or.cz/pyTivo/wmcbrine.git"
_gitname="wmcbrine"

build() {
  cd ${srcdir}

  msg "Connecting to repo.or.cz GIT server...."

  if [ -d ${srcdir}/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done"
  msg "Starting install..."

  cd ${srcdir}/$_gitname

  mkdir ${pkgdir}/etc
  cp pyTivo.conf.dist ${pkgdir}/etc

  mkdir -p ${pkgdir}/usr/share/pyTivo
  cp -r * ${pkgdir}/usr/share/pyTivo
  chmod +x ${pkgdir}/usr/share/pyTivo/pyTivo.py

  msg "Adding rc.d script"
  cd ${srcdir}/
  mkdir -p ${pkgdir}/etc/rc.d
  cp rc.d ${pkgdir}/etc/rc.d/pytivo
  chmod +x ${pkgdir}/etc/rc.d/pytivo
}
