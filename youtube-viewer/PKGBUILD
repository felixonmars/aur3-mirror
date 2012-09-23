# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=youtube-viewer
pkgver=20120924
pkgrel=1
pkgdesc="A command line utility for viewing youtube-videos in MPlayer."
arch=('any')
url="https://github.com/trizen/youtube-viewer"
license=('GPLv3')
makedepends=('git')

depends=('perl>=5.10.0' 'mplayer' 'perl-data-dump' 'perl-libwww' 'perl-xml-fast')
optdepends=('perl-term-readkey: to get the terminal width size'
            'perl-term-readline-gnu: for a better STDIN support'
            'perl-lwp-protocol-https: for login and https support'
            'gcap: for retrieving Youtube closed captions. [in AUR]')

_gitroot="git://github.com/trizen/youtube-viewer.git"
_gitname="youtube-viewer"

build() {
    msg "Connecting to github GIT server..."

    if [ -d $_gitname ]; then
        cd $_gitname && git pull origin
    else
        git clone "$_gitroot"
    fi
}

package() {
    cd "youtube-viewer/WWW-YoutubeViewer"
    perl Build.PL --destdir "$pkgdir"   # --gtk-youtube-viewer
    ./Build
    ./Build test
    ./Build install --install_path script=/usr/bin
}
