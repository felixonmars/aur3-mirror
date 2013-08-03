# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Aliaksandr Stelmachonak <mail.avatar@gmail.com>

pkgname=zoiper-communicator
pkgver=1.18.6898
pkgrel=2
pkgdesc="An IAX and SIP VoIP softphone - with video calls support"
arch=("i686" "x86_64")
depends=("wxgtk" "ffmpeg" "openssl")
url="http://www.zoiper.com/softphone/communicator"
license=("custom")
source=(http://www.zoiper.com/downloads/free/linux/communicator/karmic/${pkgname}-free-alsa_1.0-1ubuntu16_i386.deb "LICENSE")
[ "$CARCH" = "x86_64" ] && source=(http://www.zoiper.com/downloads/free/linux/communicator/karmic/${pkgname}-free-alsa_1.0-1ubuntu12_amd64.deb "LICENSE")

try_symlink() {
    if [ -L /usr/lib/$1 ]; then
        ln -s $(readlink /usr/lib/$1) ${pkgdir}/usr/lib/$2 || return $?
    elif [ -r /usr/lib/$1 ]; then
        ln -s $1 ${pkgdir}/usr/lib/$2 || return $?
    else
        printf "ln: file or symlink not found -- /usr/lib/%s\n" "$1" && return 1
    fi
}

package() {
	cd "${srcdir}"

	# Extract
	bsdtar -xf ${pkgname}-free-alsa*.deb && bsdtar -xf data.tar.gz
	mv ./usr "${pkgdir}"

	# Workarounds
	install -d "${pkgdir}"/usr/lib
	try_symlink libavutil.so libavutil.so.49
	try_symlink libavcodec.so libavcodec.so.52
	try_symlink libssl.so libssl.so.0.9.8
	try_symlink libcrypto.so libcrypto.so.0.9.8

	# Removals
	rm -rf "${pkgdir}"/usr/share/{doc,menu}

	# License
	install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

sha1sums=('45a1ca8733b3fc5254aaa775734fa67906c47bf4' '74e9f2d5dc6ec7174923e824b3db64b47b6d3b3c')
[ "$CARCH" = "x86_64" ] && sha1sums=('66a0e7ffe2186db3a243d8d5bfac9b34b11c2ec9' '74e9f2d5dc6ec7174923e824b3db64b47b6d3b3c')
