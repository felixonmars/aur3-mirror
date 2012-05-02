# Contributer: Zach Thibeau <zachthibeau@pchat-irc.com>

pkgname='pchat'
pkgver=1
pkgrel=5
pkgdesc="PChat is an IRC Client that is designed to run on most major operating systems, forked from the code XChat, but with changes to the core to be less dependent on gtk and a new interface for better cross platform capabilities, as well as striving to be more functional than XChat. Latest hg pull."
url="http://bitbucket.org/ZachThibeau/pchat-dev/"
license='GPL'
arch=('i686' 'x86_64')
groups=('pchat-hg')
depends=('gtk2' 'openssl')
makedepends=('mercurial')

_hgroot='http://bitbucket.org/ZachThibeau'
_hgrepo='pchat-irc'

build() {

  cd "${srcdir}"

  if [ -d $_hgrepo ]; then
    cd $_hgrepo && hg pull -u
  else
    hg clone "${_hgroot}/${_hgrepo}"
    cd $_hgrepo
  fi

  make
  make install DESTDIR="${pkgdir}" prefix=/usr
  

}
