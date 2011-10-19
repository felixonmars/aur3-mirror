# Maintainer: Samuel Hanot <smlhnt@gmail.com>

pkgname=scribes-bzr
_pkgname=scribes
pkgver=20111019
pkgrel=1
pkgdesc='A simple PyGTK+ text editor'
arch=('i686' 'x86_64')
url='http://scribes.sourceforge.net'
license=('GPL')
depends=('dbus-python' 'pygtksourceview2' 'gnome-doc-utils' 'xdg-utils' 'gtkspell' 'yelp' 'pyxdg')
makedepends=('bzr' 'intltool')
conflicts=('scribes')
install=scribes-bzr.install
_bzrbranch='lp:scribes'

build() {
	msg 'Connecting to the server....'
	bzr branch ${_bzrbranch}
	msg 'Starting make...'

	cd ${_pkgname}
	pwd
  sed -i 's/python depcheck.py/python2 depcheck.py/' configure
  sed -i 's/python removepyc.py/python2 removepyc.py/' Makefile.in
  sed -i 's/python -OO compile.py/python2 -OO compile.py/' Makefile.in
  sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' LanguagePlugins/Sparkup/sparkup.py
  sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' LanguagePlugins/zencoding/filters/{haml.py,comment.py,escape.py,format.py,format-css.py,html.py,xsl.py}
  sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' LanguagePlugins/zencoding/{zen_actions.py,zen_core.py,html_matcher.py}
  sed -i 's|#! */usr/bin/env python|#!/usr/bin/env python2|' GenericPlugins/{RecentOpen/ExternalProcess/ScribesRecentFilesIndexer.py,WordCompletion/SuggestionProcess/ScribesWordCompletionSuggestionGenerator.py} SCRIBES/SaveSystem/ExternalProcess/ScribesSaveProcess.py
  sed -i 's|#! */usr/bin/env python|#!/usr/bin/env python2|' scribesmodule scribesplugin
  sed -i 's|#! /usr/bin/python|#! /usr/bin/python2|' scribes.in 
  sed -i 's|return join(prefix, "bin", "python")|return join(prefix, "bin", "python2")|' SCRIBES/SaveProcessInitializer/Initializer.py

  PYTHON=python2 ./configure --prefix=/usr
  make
}

package() {
	cd ${_pkgname}
	make DESTDIR="${pkgdir}" install
}
