# Contributor: Philipp Giebel <arch@ambience-design.net>
# Maintainer : Justin Davis   <jrcd83@gmail.com>
pkgname='mp3c'
pkgver='0.31'
pkgrel='1'
pkgdesc='CD ripping/encoding frontend with curses UI'
arch=('i686' 'x86_64')
license=('GPL')
options=('!emptydirs')
depends=('ncurses')
optdepends=('lame: default mp3 encoder'
            'vorbis-tools: contains oggenc, the default ogg encoder'
            'cdda2wav: default CD ripper')
url='http://www.wspse.de/WSPse/Linux-MP3c.php3'
source=('ftp://ftp.wspse.de/pub/linux/wspse/mp3c-0.31.tar.bz2')
md5sums=('c1adabc9cbd90a57f273cf53e2ea9531')

build() {
    (   cd "${srcdir}/${pkgname}-${pkgver}"	&&
        ./configure --prefix="/usr"         &&
        make                                &&
	    make DESTDIR="${pkgdir}/" install
    ) || return 1;
}
