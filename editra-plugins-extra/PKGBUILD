# Contributor: wido <widomaker2k7@gmail.com>
# Maintainer: Barton Cline <barton@bcdesignswell.com>

pkgname=editra-plugins-extra
pkgver=2
pkgrel=0
pkgdesc="plugins and extra for editra"
arch=('any')
url="http://editra.org/"
license=('wxWindows Licence')
depends=('wxpython')
install="editra.install"
source=(
    editra.desktop
    editra.png
     http://editra.org/uploads/plugins/27/calculator/Calculator-0.6-py2.7.egg
     http://editra.org/uploads/plugins/27/commentbrowser/CommentBrowser-0.4-py2.7.egg
     http://editra.org/uploads/plugins/26/codetemplater/CodeTemplater-0.3-py2.6.egg
     http://editra.org/uploads/plugins/27/cssoptimizer/CssOptimizer-0.4-py2.7.egg
     http://editra.org/uploads/plugins/27/ftpedit/FtpEdit-0.3-py2.7.egg
     http://editra.org/uploads/plugins/27/macrolauncher/MacroLauncher-0.1-py2.7.egg
     http://editra.org/uploads/plugins/27/projects/Projects-1.7-py2.7.egg
     http://editra.org/uploads/plugins/27/pystudio/PyStudio-0.6-py2.7.egg
     http://editra.org/uploads/plugins/27/crystal/Crystal-0.2-py2.7.egg
     http://editra.org/uploads/plugins/27/humility/Humility-0.2-py2.7.egg
     http://editra.org/uploads/plugins/27/oxygen/Oxygen-0.4-py2.7.egg
     http://editra.org/uploads/plugins/27/nuovo/Nuovo-0.2-py2.7.egg
     http://editra.org/uploads/plugins/27/ubuntoon/Ubuntoon-0.1-py2.7.egg
     http://editra.org/uploads/stylesheets/Fios.ess
     http://editra.org/uploads/stylesheets/IDLE.ess
     http://editra.org/uploads/stylesheets/Scintilla.ess
     http://editra.org/uploads/stylesheets/Zenburnish.ess)
md5sums=('8f63a5d1990d90bb3877bd49680db9ce'
         '41a3c056a76e8b39395abaa718bf701f'
         '33b492ef2f71512f3512e8fe34ff4d6d'
         '60c5881acb45440b0f22583be2bb93a3'
         'c9634cc91f6beb39c3769aaa503fc722'
         '3a83cdd256e997ba2e2d97428414ed5f'
         'c6a48cbb8623f29bcc4e4c188120914f'
         'd1f718ddc0e5ede9b828c2f053668fba'
         'bd0222888173f8b3e53ae2db48973e1b'
         '5149cc669849eefc870d53bb660393fc'
         '761d33fd0307f4e412ef4268f65ef424'
         'ffc75ccbfebc5597b668f2cd8e332779'
         'b30b2e884e3626788f954d00bd366902'
         'b7cf4dd2c4728cb3c269b99825069432'
         'b2d47980e2f8702826e48541193e65dc'
         '7a4a2f6c4ad6450c3a0e6015901a34d5'
         '32878e67c2544de7bebca81f0448897a'
         '38473eb4f3efb86b7ff717756d7b827c'
         'ca3a31753b9ab74f029e0d8946cb130f')
     
    
package() {
  # Desktop
  
  install -D -m644 editra.desktop ${pkgdir}/usr/share/applications/editra.desktop
  install -D -m644 editra.png ${pkgdir}/usr/share/icons/editra.png

  # Plugins
  
  install -D -m644 Calculator-0.6-py2.7.egg "$pkgdir"/usr/lib/python2.7/site-packages/Editra/plugins/Calculator-0.6-py2.7.egg
  install -D -m644 CodeTemplater-0.3-py2.6.egg "$pkgdir"/usr/lib/python2.7/site-packages/Editra/plugins/CodeTemplater-0.3-py2.6.egg
  install -D -m644 CommentBrowser-0.4-py2.7.egg "$pkgdir"/usr/lib/python2.7/site-packages/Editra/plugins/CommentBrowser-0.4-py2.7.egg
  install -D -m644 CssOptimizer-0.4-py2.7.egg "$pkgdir"/usr/lib/python2.7/site-packages/Editra/plugins/CssOptimizer-0.4-py2.7.egg
  install -D -m644 FtpEdit-0.3-py2.7.egg "$pkgdir"/usr/lib/python2.7/site-packages/Editra/plugins/FtpEdit-0.3-py2.7.egg
  install -D -m644 MacroLauncher-0.1-py2.7.egg "$pkgdir"/usr/lib/python2.7/site-packages/Editra/plugins/MacroLauncher-0.1-py2.7.egg
  install -D -m644 Projects-1.7-py2.7.egg "$pkgdir"/usr/lib/python2.7/site-packages/Editra/plugins/Projects-1.3-py2.7.egg
  install -D -m644 PyStudio-0.6-py2.7.egg "$pkgdir"/usr/lib/python2.7/site-packages/Editra/plugins/PyStudio-0.6-py2.7.egg
  
  # Icon Themes
  
  install -D -m644 Crystal-0.2-py2.7.egg "$pkgdir"/usr/lib/python2.7/site-packages/Editra/plugins/Crystal-0.2-py2.7.egg
  install -D -m644 Humility-0.2-py2.7.egg "$pkgdir"/usr/lib/python2.7/site-packages/Editra/plugins/Humility-0.2-py2.7.egg
  install -D -m644 Oxygen-0.4-py2.7.egg "$pkgdir"/usr/lib/python2.7/site-packages/Editra/plugins/Oxygen-0.4-py2.7.egg
  install -D -m644 Nuovo-0.2-py2.7.egg "$pkgdir"/usr/lib/python2.7/site-packages/Editra/plugins/Nuovo-0.2-py2.7.egg
  install -D -m644 Ubuntoon-0.1-py2.7.egg "$pkgdir"/usr/lib/python2.7/site-packages/Editra/plugins/Ubuntoon-0.1-py2.7.egg
  
  # Syntax Style Sheets
  
  install -D -m644 Fios.ess "$pkgdir"/usr/lib/python2.7/site-packages/Editra/styles/Fios.ess
  install -D -m644 IDLE.ess "$pkgdir"/usr/lib/python2.7/site-packages/Editra/styles/IDLE.ess
  install -D -m644 Scintilla.ess "$pkgdir"/usr/lib/python2.7/site-packages/Editra/styles/Scintilla.ess
  install -D -m644 Zenburnish.ess "$pkgdir"/usr/lib/python2.7/site-packages/Editra/styles/Zenburnish.ess
}

# vim: set ts=2 sw=2 ft=sh noet:
