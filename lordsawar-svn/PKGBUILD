# Maintainer: Dmitrij D. Czarkoff <czarkoff@gmail.com>
# Contributor: zoulnix <http://goo.gl/HQaP>

pkgname=lordsawar-svn
pkgver=2618
pkgrel=1
pkgdesc="A free, turn-based strategy game in spirit of Warlords II"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/lordsawar/"
license=('GPL3')
depends=('gtkmm' 'sdl_mixer' 'libxml2' 'libxslt')
makedepends=('intltool' 'libtar' 'boost' 'subversion')
conflicts=('lordsawar')
changelog="ChangeLog"
install="lordsawar-svn.install"
source=("configure.ac.patch"
	"lordsawar-editor-32.png"
	"lordsawar-editor-64.png"
	"lordsawar-editor.desktop")
md5sums=('ad54b221c58bdb3450cdb7d80a843949'
         '063de7530fe208f22037371f5a103b86'
         '8c4baee495aa55e5e250dd735ff0b8ba'
         '0927bb356c8c184cad13761012f6ad92')

_svnmod="lordsawar"
_svntrunk="svn://svn.sv.gnu.org/${_svnmod}/${_svnmod}/trunk"

build() {
  cd "$srcdir"

  msg "Checking if previous sources are saved"
  if [ -f $SRCDEST/${pkgname}.tar.gz ]
  then
    msg "Unpacking previous sources"
    tar xzf $SRCDEST/${pkgname}.tar.gz
  fi

  msg "Getting latest revision from SVN..."
  if [ -d ${pkgname}/.svn ]
  then
    cd ${pkgname}
    svn up || return 1
    cd ..
  else
    svn co ${_svntrunk} --config-dir ./ ${pkgname} || return 1
  fi
  msg "SVN checkout done"

  msg "Backing up source tree"
  tar czf $SRCDEST/${pkgname}.tar.gz ${pkgname}

  cd ${pkgname}
  msg "Starting make..."

  patch -up0 -i ${srcdir}/configure.ac.patch

# Workaround to make gettextize non-interactive
  PATH="./:$PATH"
  sed -e 's:read dummy < /dev/tty::' `which gettextize` > gettextize
  chmod +x gettextize
  ./autogen.sh	# this is what You have to keep
  msg "We pressed Return for You, now running \"aclocal -I m4\" and \"autoconf\"."
  rm gettextize
  aclocal -I m4
  autoconf
# End  of workaround

# You may want to append to "./configure":
# don't compile editor
#    --disable-editor \
# don't compile play-by-mail
#    --disable-pbm \
# don't compile game list server
#    --disable-gls \
# don't compile game host server
#    --disable-ghs \
# zip save files (experimental)
#    --enable-zipping \
  ./configure \
    --prefix=/usr \
    --disable-static \
    --disable-sdltest || return 1
  make || return 1
}

package() {
  install -m 644 -D "${srcdir}/lordsawar-editor.desktop" "${pkgdir}/usr/share/applications/lordsawar-editor.desktop"
  install -m 644 -D "${srcdir}/lordsawar-editor-32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/lordsawar-editor.png"
  install -m 644 -D "${srcdir}/lordsawar-editor-64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/lordsawar-editor.png"
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}/" install || return 1
}
