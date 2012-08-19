# Maintainer: Jekyll Wu <adapte@gmail.com>

pkgname=soundkonverter-git
pkgver=20120819
pkgrel=1
pkgdesc="A KDE frontend to various audio converters"
arch=('i686' 'x86_64')
url="http://www.kde-apps.org/content/show.php?content=29024"
license=('GPL')
depends=('kdemultimedia-audiocd-kio' 'taglib')
makedepends=('cmake' 'automoc4')
optdepends=('cdrkit: cdda2wav backend'
	    'faac: faac backend'
	    'faad2: faad backend'
	    'ffmpeg: ffmpeg backend'
	    'flac: flac backend'
	    'lame: lame backend'
	    'mplayer: mplayer backend'
	    'vorbis-tools: oggenc, oggdec backends'
	    'speex: speexenc, speexdec backends'
	    'vorbisgain: vorbisgain backend'
	    )
provides=('soundkonverter')
conflicts=('soundkonverter')

_gitroot="git://gitorious.org/soundkonverter/soundkonverter.git"
_gitname="soundkonverter"

build() {

    cd "${srcdir}"
    msg "Connecting to GIT server...."

    if [ -d ${_gitname} ] ; then
        cd ${_gitname} && git pull origin
        msg "The local files are updated."
    else
        git clone ${_gitroot} ${_gitname}
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    rm -rf "${srcdir}/build"

    #mkdir "${srcdir}/build" || { msg "Failed to create building folder"  ; exit 1 ; }
    #cd    "${srcdir}/build" || { msg "Failed to cd into building folder" ; exit 2 ; }

    #cmake -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix) ../${_gitname}/src/ || { msg "cmake failed"; exit 3 ;}

    mkdir "${srcdir}/build"

    cd "${srcdir}/build"

    cmake -DCMAKE_INSTALL_PREFIX=/usr "${srcdir}/${_gitname}/src"

    make

}

package() {

    cd  "${srcdir}/build"
    make DESTDIR="${pkgdir}" install

}
