# Contributor: Baptiste Grenier <baptiste@bapt.name>
pkgname=svninfo
pkgver=0.7.3
pkgrel=2
pkgdesc='Extract revision and file information from a Subversion-ned LaTeX file'
arch=('i686' 'x86_64')
url='http://www.ctan.org/tex-archive/macros/latex/contrib/svninfo/'
license=('custom:LPPL')
depends=('texlive-bin')
install='svninfo.install'
source=("ftp://tug.ctan.org/pub/tex-archive/macros/latex/contrib/${pkgname}.zip"
        'ftp://tug.ctan.org/pub/tex-archive/macros/latex/base/lppl.txt')
md5sums=('208624458d29ee9de5f0a2dcd164423c'
         '9f4337828d782bdea41f03dd2ad1b808')

build() {
    cd ${srcdir}/${pkgname}
    make sty || return 1
    install -d ${pkgdir}/usr/share/texmf/tex/latex/${pkgname}
    install -m644 svninfo.sty svninfo.cfg ${pkgdir}/usr/share/texmf/tex/latex/${pkgname}
    install -D -m644 ${srcdir}/lppl.txt ${pkgdir}/usr/share/licenses/${pkgname}/lppl.txt
}
