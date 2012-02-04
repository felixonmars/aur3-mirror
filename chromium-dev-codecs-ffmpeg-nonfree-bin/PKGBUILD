# $Id:$
# Original: Balwinder S "bsd" Dheeman (bdheeman AT gmail.com)
# Contributor: spiderschwoin (eikemail-arch AT yahoo.de)
# Maintainer: spiderschwoin (eikemail-arch AT yahoo.de)

pkgname=chromium-dev-codecs-ffmpeg-nonfree-bin
_pkgname=chromium-codecs-ffmpeg-extra
_pkgver=svn20101227r70200+70112
_pkgpre=0.6+
_pkgsuf=0ubuntu1~ucd1~maverick
pkgver=${_pkgpre%+*}.${_pkgver##svn*+}
pkgrel=1.03
pkgdesc="Extra ffmpeg codecs for 'chromium-dev' (View/Watch HTML5 videos)"
arch=('i686' 'x86_64')
url=https://launchpad.net/chromium-browser/
license=('GPL' 'LGPL' 'custom')
depends=('chromium-dev' 'libvpx')
replaces=('chromium-codecs-ffmpeg-extra-ppa')
install=${pkgname}.install

_tgtdir=/usr/lib/
_gogdir=chromium-dev
_gogdir2=chromium-browser
case "$CARCH" in
    i686|i[3-5]86)
	_bldarch='i386'
    md5sums=('f7ea394dfebaebc9707b933489755484');;    
    x86_64|amd64)
	_bldarch='amd64'
    md5sums=('9202de5c24705d550da0d3cae81df7d7');;
    # The following should not happen; provided you're using 'makepkg' ;)
    *) error "Unknown or invalid CARCH=$CARCH"; exit 1
esac

_pkgname=chromium-codecs-ffmpeg-extra
_url=http://ppa.launchpad.net/chromium-daily/ppa/ubuntu/pool/main/c/chromium-codecs-ffmpeg
source=(${_url}/${_pkgname}_${_pkgpre}${_pkgver}-${_pkgsuf}_${_bldarch}.deb)

build() {
    msg2 "Extracting files..."
    cd "$srcdir"
    ar x ${_pkgname}_${_pkgpre}${_pkgver}-${_pkgsuf}_${_bldarch}.deb
    tar xf data.tar.gz
    mkdir -p $pkgdir/${_tgtdir}/${_gogdir}
    cp -d $srcdir/usr/lib/${_gogdir2}/lib* $pkgdir/${_tgtdir}/${_gogdir}
    touch mv $pkgdir/${_tgtdir}/${_gogdir}/libffmpegsumo.so $pkgdir/${_tgtdir}/${_gogdir}/libffmpegsumo.so.NONFREE    

    msg2 "Making it nice..."
    install -Dm644 $srcdir/usr/share/doc/${_pkgname}/copyright \
	$pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt
    cat >>$pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt <<-EOT
On ArchLinux machines, a complete text of the GNU General Public
License can be found in '/usr/share/licenses/common/GPL' and a text of the
GNU Lesser General Public License is in '/usr/share/licenses/common/LGPL' ;)
EOT
}

# vim:set ts=4 sw=4 et:
