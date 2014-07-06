# Maintainer: Guillaume Cocatre-Zilgien <gcocatre at gmail dot com>

pkgname='caudec'
pkgver='1.7.5'
pkgrel='1'
pkgdesc="A multiprocess audio converter that supports many formats (FLAC, MP3, Ogg Vorbis, Windows codecs and many more)"
arch='any'
url='http://caudec.net/'
license=('GPL3')
depends=('bash' 'procps-ng' 'grep' 'bc' 'which' 'coreutils' 'sox' 'sed' 'findutils' )
optdepends=(
	'wget: checking for new versions'
	'flac: FLAC encoding and decoding'
	'flake: alternative FLAC encoder'
	'wavpack: WavPack encoding and decoding'
	"mac: Monkey's Audio encoding and decoding"
	"ffmpeg: Apple Lossless (ALAC), Monkey's Audio and AAC support"
	'lame: MP3 encoding'
	'vorbis-tools: Ogg Vorbis encoding'
	'neroaacenc: Nero AAC encoding'
	'neroaactag: Nero AAC tagging'
	'neroaacdec: Nero AAC decoding (and Replaygain)'
	'musepack-tools: Musepack encoding'
	'opus-tools: Opus encoding'
	'wine: Windows codecs support (TAK, lossyWAV, qaac, etc)'
	'cksfv: CRC32 hashing'
	"wavegain: Replaygain for Monkey's Audio, TAK, ALAC"
	'vorbisgain: Replaygain for Ogg Vorbis'
	'mp3gain: Replaygain for MP3'
	'aacgain-cvs: Replaygain for AAC'
	'gawk: required for SoundCheck support'
	'python2-eyed3: for MP3 artwork and Replaygain support'
)
backup=('etc/caudecrc')
source=("http://caudec.net/downloads/${pkgname}-${pkgver}.tar.gz")
sha1sums=('e3b8ccdb976e02f82be07041a624d1f0cdd005d4')

package ()
{
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -D -m 0755 'caudec' "${pkgdir}/usr/bin/caudec"
	ln -s 'caudec' "${pkgdir}/usr/bin/decaude"
	install -D -m 0755 'APEv2' "${pkgdir}/usr/bin/APEv2"
	install -D -m 0644 'caudecrc' "${pkgdir}/etc/caudecrc"
}
