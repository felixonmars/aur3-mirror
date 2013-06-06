# Maintainer:  Joost Bremmer <toost dot b at gmail dot com>
# Contributor: Joe Davison <joedavison.davison@gmail.com>

pkgname=adventuregamestudio-git
pkgver=20130605
pkgrel=1
pkgdesc="Native port of the Adventure Game Studio engine to Linux (git version)"
arch=('i686' 'x86_64')
url="http://www.adventuregamestudio.co.uk/"
license=('Custom')
depends=('libogg' 'libvorbis' 'libtheora' 'dumb' 'freetype2' 'allegro4')
makedepends=('git')
install=ags-git.install
source=('git+git://github.com/adventuregamestudio/ags.git'
'ags-git.install')
md5sums=('SKIP'
'fc9706e4e3636d7e789be40480a5fdc0')
provides=('adventuregamestudio')

_gitname="ags"
_gitbranch="main"


build() {

        cd $_gitname
	make --directory=Engine || return 1
}

pkgver() {
    cd "${srcdir}/${_gitname}"
    git log -1 --format="%cd" --date=short | sed 's|-||g'
    }

package() {
	install -D -m 755 $srcdir/$_gitname/Engine/ags \
        $pkgdir/usr/bin/ags
} 
