# Maintainer: mosra <mosra@centrum.cz>

pkgname=opengl4-man-pages-svn
pkgver=19312
pkgrel=1
pkgdesc="OpenGL 4 Man Pages"
arch=('any')
url="http://www.opengl.org/wiki/Getting_started/XML_Toolchain_and_Man_Pages"
license=('custom')
makedepends=('subversion' 'libxslt' 'docbook-xsl' 'w3c-mathml2' 'docbook-mathml')
conflicts=('opengl-man-pages')
source=('LICENSE')
md5sums=('cb856abe5968300057e650096ba25b2f')

_svntrunk=https://cvs.khronos.org/svn/repos/ogl/trunk/ecosystem/public/sdk/docs/man4/
_svnmod=man

build() {
    cd "$srcdir"
    msg "Connecting to SVN server..."

    if [[ -d "$_svnmod/.svn" ]]; then
        cd "$_svnmod"
        svn revert -R .
        svn up -r "$pkgver"
    else
        svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
    fi

    msg "SVN checkout done"
    msg "Starting build..."

    cd "$srcdir/$_svnmod"

    export ROOT="${srcdir}/man"
    make
    for file in *.xml; do
        xsltproc --noout --nonet /usr/share/xml/docbook/xsl-stylesheets-*/manpages/docbook.xsl ${file}
    done
}

package() {
    cd "${srcdir}/man"
    install -d "${pkgdir}/usr/share/man/man3"
    install -m644 *.3G "${pkgdir}/usr/share/man/man3/"
    install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
