# Maintainer: crass00 <crass00 @t hotmail dot com>

pkgname='picopt'
pkgver=1.2.0
pkgrel=1
pkgdesc='A multi-format, recursive, multiprocessor aware, command line image optimizer utility that uses external tools to do the optimizing.'
arch=('any')
url='http://github.com/ajslater/picopt'
license=('GPL')
depends=('python2' 'python2-pillow' 'python2-dateutil' 'python2-rarfile')
optdepends=('jpegrescan-kud-git: for better jpeg optimization'
            'unrar: for cbr support'
	    'unzip: for cbz support'
	    'gifsicle: for gif file  optimization'
            'optipng: for png file optimization' 
	    'pngout: for png file optimization'
            'advancecomp: for png file optimization'
            'mozjpeg-opt: for better jpeg optimization - faster than jpegrescan')
makedepends=('git')
provides=('picopt')
source=("https://raw.githubusercontent.com/ajslater/picopt/master/picopt.py"
        "https://raw.githubusercontent.com/ajslater/picopt/master/README.md")
md5sums=('SKIP'
         'SKIP')

package() {
    cd "${srcdir}"
    sed -i 's/python/python2/g' picopt.py
    install -Dm775 "${pkgname}.py" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644  README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
