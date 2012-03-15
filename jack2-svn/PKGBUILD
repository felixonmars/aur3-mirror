#Maintainer: Loren Copeland <thisisquitealongname at gm--l> 

pkgname=jack2-svn
_realname=${pkgname%-svn}
pkgver=4778
pkgrel=1
pkgdesc="Outdated subversion build of the popular multiprocessor-aware low-latency audio server. Development has moved to Git."
arch=('i686' 'x86_64')
url="http://www.grame.fr/~letz/jackdmp.html"
license=('GPL2')
depends=('python2' 'libsamplerate') 
makedepends=('subversion')
optdepends=('celt-0.7' 'dbus-core' 'libffado' 'libfreebob' 'python2')
provides=('jack2' 'jack' 'jack-audio-connection-kit')
conflicts=('jack2-svn' 'jack2' 'jackmp' 'tschack' 'tschack-git' 'jack' 'jackd' 'jack-audio-connection-kit')

_svntrunk=http://subversion.jackaudio.org/jack/jack2/trunk/jackmp
_svnmod=${_realname}

build() {
  cd "${srcdir}"

  if [ -d "${_svnmod}/.svn" ]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "${srcdir}/${_svnmod}-build"
  cp -r "${srcdir}/${_svnmod}" "${srcdir}/${_svnmod}-build"
  cd "${srcdir}/${_svnmod}-build"

  python2 ./waf configure \
    --prefix=/usr \
    --alsa

  python2 ./waf build
}

package() {
  cd "${srcdir}/${_svnmod}-build"

  python2 ./waf --destdir="${pkgdir}" install
}
