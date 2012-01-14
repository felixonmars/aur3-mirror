# Contributor: Cyril Lashkevich <notorca at gmail dot com>

pkgname=split2flac-hg
pkgver=106
pkgrel=1
pkgdesc="An utility to split one big APE/FLAC/WV file to FLAC/OGG/M4A/MP3 tracks with tagging, renaming, changing codeset"
arch=('any')
url="http://code.google.com/p/split2flac/"
license=('MIT')
depends=('flac' 'cuetools' 'shntool')
optdepends=('imagemagick: for resizing cover images'
            'libmp4v2: for setting tags in m4a files'
            'faac: for encoding to m4a'
            'mp3gain: for volume normalize'
            'aacgain: for volume normalize'
            'vorbisgain: for volume normalize'
            'id3lib: for tags manipulation'
            'lame: for spliting to mp3'
            'mutagen: for tags manipulation'
            'vorbis-tools: for spliting into ogg vorbis'
            'flake: for faster flac encoding')
makedepends=('mercurial')
_hgroot=https://split2flac.googlecode.com/hg
_hgrepo=split2flac

build() {
    if [ -d ${_hgrepo} ]; then
        cd ${startdir}/src/${_hgrepo}
        hg pull
        hg up
    else
        hg clone ${_hgroot}${_hgrepo} || return 1
        cd ${startdir}/src/${_hgrepo}
    fi

    msg "Mercurial clone done or server timeout"
    msg "Starting make..."
   
    sed -i "s/VERSION=unknown/VERSION=hg-rev${pkgver}/" ${srcdir}/${_hgrepo}/split2flac.sh
    install -Dm755 ${srcdir}/${_hgrepo}/split2flac.sh ${pkgdir}/usr/bin/split2flac
    cd ${pkgdir}/usr/bin
    ln -s split2flac ${pkgdir}/usr/bin/split2mp3
    ln -s split2flac ${pkgdir}/usr/bin/split2ogg
    ln -s split2flac ${pkgdir}/usr/bin/split2m4a
    ln -s split2flac ${pkgdir}/usr/bin/split2wav
}
