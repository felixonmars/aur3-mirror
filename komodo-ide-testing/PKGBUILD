# Maintainer: Jamie Paton <jamie.paton@googlemail.com>
# Contributor: max-k <max-k@post.com>

if [ $(uname -m) = "x86_64" ] ; then
_arch="x86_64"
else
_arch="x86"
fi

_major="7.0.0c2"
_majoralt="7.0.0-rc2"
_minor=68504


pkgname="komodo-ide-testing"
pkgver="${_major}_${_minor}"
pkgrel=1
pkgdesc="ActiveState Komodo IDE"
arch=(i686 x86_64)
url="http://www.activestate.com/komodo-ide"
license=('MPL')
depends=('glibc>=2.4' 'libjpeg>=6.2' 'gcc-libs' 'gtk2')
optdepends=('php: PHP debugging'
	    'ruby: Ruby debugging'
	    'python2: Python 2.x debugging'
	    'python: Python 3.x debugging'
            'git: Git SCC integration'
            'subversion: SVN SCC integration'
            'nodejs: Node.js debugging'
)

conflicts=()
options=(!strip)
source=("http://downloads.activestate.com/Komodo/releases/${_major}/Komodo-IDE-${_majoralt}-${_minor}-linux-${_arch}.tar.gz")

if [ $_arch = "x86_64" ] 
then
  md5sums=('061f26e7f040dfc0d048a684e0af50c0')
else
  md5sums=('aba78863a1c7e9afb8690409a427b88d')
fi

build() {
cd ${startdir}/src/Komodo-IDE-${_majoralt}-${_minor}-linux-${_arch}
./install.sh -s -I ${startdir}/pkg/opt/${pkgname}
sed -i 's/Komodo\ IDE-7.desktop/Komodo\ Edit\ 7/' ${startdir}/pkg/opt/${pkgname}/share/desktop/komodo-ide-7.desktop
grep -v ${startdir} ${startdir}/pkg/opt/${pkgname}/share/desktop/komodo-ide-7.desktop > ${startdir}/${pkgname}.desktop
echo "Exec=/opt/${pkgname}/bin/komodo %F" >> ${startdir}/${pkgname}.desktop
echo "Icon=/opt/${pkgname}/share/icons/komodo48.png" >> ${startdir}/${pkgname}.desktop
install -D -m 644 ${startdir}/${pkgname}.desktop ${startdir}/pkg/usr/share/applications/${pkgname}.desktop
}
