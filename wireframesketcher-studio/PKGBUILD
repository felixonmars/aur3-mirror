# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>

pkgname=wireframesketcher-studio
pkgver=4.2.3
pkgrel=1
pkgdesc="WireframeSketcher is a wireframing tool for mockups and prototypes (trail version)"
arch=('i686' 'x86_64')
url="http://wireframesketcher.com"
_watch=('http://wireframesketcher.com/updates/','Current version is ([\d.]*)\s')
license=('nonfree')
if [ "${CARCH}" = "x86_64" ]; then
    _arch="amd64"
    sha512sums=('8cffcc237d06ea66b35cba2d0b6b2e6181f83805ca1350b0c1117aeffa6beebf04b2e558476f10c182cd9a43bca825a9cf3960a39bd5dd35c73addd94e5239c5')
else
    _arch="i386"
    sha512sums=('c75665bd861414dad8b017b1cae61d0d9bb23fc50dc103de60e66c6c2a78af71890586def953db0d60ac1a8f71cf17b5386f5e9f761640f81a388269f7c9f6bd')
fi 

source=("http://cdn.wireframesketcher.com/studio/dist/WireframeSketcherStudio-${pkgver}_${_arch}.deb")

package () {
    cd $srcdir
    ar x WireframeSketcherStudio-${pkgver}_${_arch}.deb
    mkdir -p "$pkgdir/opt/"
    tar -C $pkgdir/ -xvf data.tar.gz
    mkdir -p $pkgdir/usr/bin
    echo -e "#!/bin/bash\n/opt/WireframeSketcherStudio/sketcher \$@" > $pkgdir/usr/bin/${pkgname}
    chmod a+x $pkgdir/usr/bin/${pkgname}
}

# vim:set ts=4 sw=4 et:
