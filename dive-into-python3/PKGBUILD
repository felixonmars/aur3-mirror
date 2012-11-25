# Maintainer: Tianjiao Yin <ytj000@gmail.com>
pkgname=dive-into-python3
pkgver=20111011
pkgrel=2
pkgdesc="A Python book for experienced programmers. Include Chinese, Czech, English and Italian versions."
arch=('any')
url="http://diveintopython3.org/"
license=('CCPL:cc-by-sa')
source=("http://gpiancastelli.altervista.org/dip3-it/d/diveintopython3-it-html-latest.zip"
"http://diveintopython3.py.cz/PonormeSeDoPythonu3-html.zip")
noextract=(PonormeSeDoPythonu3-html.zip)

# Chinese request svn
makedepends=(subversion)

build() {
  cd $srcdir

  # Czech
  mkdir -p python/cs
  cd python/cs
  bsdtar -xf ../../PonormeSeDoPythonu3-html.zip
  cd $srcdir
  rm *.zip

  # Italian
  mv *-it-* python/it

  # English
  curl https://github.com/diveintomark/diveintopython3/zipball/master -o en.zip
  bsdtar -xf en.zip
  mv diveintomark-diveintopython3-* python/en

  # Chinese
  cd python
  svn checkout http://openbookproject.googlecode.com/svn/trunk/DIP3_zh/ zh
  cd $srcdir

  ## Spanish (Something is really wrong)
  ## makedepends=(mercurial latex2html)
  #mkdir tmp
  #cd tmp
  #hg clone https://code.google.com/p/inmersionenpython3/ es
  #cd es
  #mkdir output_html
  #latex2html -dir=./output_html -html_version 4.0,latin,unicode inmersionEnPython.tex
  #mv output_html $srcdir/python/es
  #cd $srcdir

  # No Russian
}

package() {
  cd ${pkgdir}
  mkdir -p usr/share/doc
  mv ${srcdir}/python usr/share/doc/dive-into-python3
}

md5sums=('3980326304219a4719c454edfee5326e'
         'c8e2e3e06602678ba78473325c9b69e6')
# vim:set ts=2 sw=2 et:
