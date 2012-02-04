# Contributor: meh. <meh.ffff@gmail.com>
pkgname=lolastfm
pkgver=0.4.4.1
pkgrel=1
pkgdesc="last.fm scrobbler for everything."
arch=(any)
url="http://github.com/meh/LOLastfm"
license=('GPL3')
depends=('perl' 'perl-xml-simple' 'perl-net-lastfm-submission')
optdepends=('perl-music-tag: support other players'
            'perl-music-tag-mp3: support MP3 with other players'
            'perl-music-tag-ogg: support OGG with other players'
            'perl-music-tag-m4a: support M4A with other players'
            'perl-music-tag-flac: support FLAC with other players')
options=('!emptydirs')
source=(http://github.com/meh/LOLastfm/tarball/LOLastfm-$pkgver)
noextract=(http://github.com/meh/LOLastfm/tarball/LOLastfm-$pkgver)
md5sums=('fbcf5d0edc90160dc6ecbf9a6c277bfb')

build() {
    cd "$startdir/src"
    tar xfv *
    cd meh-*

    mkdir -p $startdir/pkg/usr/bin
    mkdir -p $startdir/pkg/etc
    mkdir -p $startdir/pkg/etc/rc.d
    mkdir -p $startdir/pkg/var/lib/LOLastfm

    cp bin/LOLastfm.pl $startdir/pkg/usr/bin/LOLastfm
    chmod o+rx $startdir/pkg/usr/bin/LOLastfm

    cp bin/LOLastfm-set.pl $startdir/pkg/usr/bin/LOLastfm-set
    chmod o+rx $startdir/pkg/usr/bin/LOLastfm-set

    cp etc/rc.d/LOLastfm $startdir/pkg/etc/rc.d/LOLastfm
    chmod +x $startdir/pkg/etc/rc.d/LOLastfm

    cp etc/LOLastfm.xml $startdir/pkg/etc/LOLastfm.xml
}
