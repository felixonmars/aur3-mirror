# Maintainer: Gordin <9ordin @t gmail dot com>
# Contributor: dryes <joswiseman@gmail>

pkgname='sabnzbd-develop-git'
pkgver=20110930
pkgrel=1
pkgdesc='A web-interface based binary newsgrabber with NZB file support. develop branch'
arch=('any')
url='http://www.sabnzbd.org/'
license=('GPL')
depends=('par2cmdline' 'python2' 'python-cheetah' 'python2-feedparser' 'python2-yenc' 'python2-pyopenssl' 'python2-gntp' 'unrar' 'unzip' 'zip' 'sqlite3' 'curl')
makedepends=('git')
backup=('etc/conf.d/sabnzbd')
install=('sabnzbd.install')
conflicts=('sabnzbd' 'sabnzbd-bzr' 'sabnzbd-git')
provides=('sabnzbd')
replaces=('sabnzbd-bzr')
source=('sabnzbd.sh' 'sabnzbd.init' 'sabnzbd.confd')
md5sums=('0e90eab9ea5d80de91e2af41e84eb4cc' '7bd776f2c369026bb47e3d95982a0501' 'bc1723a2dd17d792785e1f6009b35751')

_gitroot="https://github.com/sabnzbd/sabnzbd.git"
_gitname="sabnzbd"
_branch="develop"

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname} -b ${_branch} --depth=1
  fi

  msg "GIT checkout done or server timeout"

  cd sabnzbd
  sed -i "s/system('python /system('python2 /" package.py
  sed -i "/win\//d"  package.py
  python2 ./package.py source
}

package() {
  mkdir -p "${pkgdir}/opt"
  cp -r "${srcdir}/sabnzbd/srcdist" "${pkgdir}/opt"
  mv "${pkgdir}/opt/srcdist" "${pkgdir}/opt/sabnzbd"

  install -D -m755 "${srcdir}/sabnzbd.sh" "${pkgdir}/usr/bin/sabnzbd"
  install -D -m755 "${srcdir}/sabnzbd.init" "${pkgdir}/etc/rc.d/sabnzbd"
  install -D -m644 "${srcdir}/sabnzbd.confd" "${pkgdir}/etc/conf.d/sabnzbd"
}


