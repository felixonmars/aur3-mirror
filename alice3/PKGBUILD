# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
pkgname=alice3
pkgver=3.1.37.0.0
pkgrel=1
pkgdesc="An Educational Software that teaches students computer programming in a 3D environment"
arch=('i686' 'x86_64')
url="http://www.alice.org/"
license=('custom')
depends=('java-runtime')
source=("http://alice.org/downloads/installers/Alice3_${pkgver}.zip")
sha512sums=('04b986b1a22d213478c51f7863e83c8904514ea2361f8ab890954d75e0b9fda9c41810a85b85fdbc465f68b7f561a5d66efa1276e649b37044e7eee806b2df1c')

#This won't go in a repository. No need to waste time or CPU cycles
#  compressing the package.
PKGEXT=".pkg.tar"

#Install prefix
PREFIX="/opt/Alice3Beta"

package() {
  cd "${srcdir}/Alice3Beta"

  #Remove stuff not required for Alice on Linux
  #  (created by a diff of: )
  #  find /tmp/Alice3Beta/installed/ | sort
  #  find /tmp/Alice3Beta/extracted/ | sort
    #Windows stuff
    msg "Removing Windows specific files..."
      rm Alice3Icon.ico
      rm Alice.bat
      rm -r application/windows-amd64/
      rm -r application/windows-i586/
      #JRE
        rm -r auxiliary/jre1.6.0_21/
    #Mac OS X stuff
    msg "Removing Mac OS X specific files..."
      rm -r Alice.app/
      rm -r application/macosx-10.4/
      rm -r application/macosx-universal/
      rm auxiliary/auxiliary/MacAuxiliary.txt

  #Other platform specific stuff
    #Windows stuff
    msg "Removing jogl libraries for Windows..."
      rm -r ext/jogl/lib/windows-amd64/
      rm -r ext/jogl/lib/windows-i586/
    #Mac OS X stuff
    msg "Removing jogl libraries for Mac OS X..."
      rm -r ext/jogl/lib/macosx-universal/
    #Solaris stuff
    msg "Removing jogl libraries for Solaris..."
      rm -r ext/jogl/lib/solaris-amd64/
      rm -r ext/jogl/lib/solaris-i586/
      rm -r ext/jogl/lib/solaris-sparc/
      rm -r ext/jogl/lib/solaris-sparcv9/

  #Architecture specific files
  if [ "${CARCH}" == "x86_64" ]; then
    rm -r ext/jogl/lib/linux-i586/
    rm -r application/linux-i586/
    rm alice.sh
    mv alice64bit.sh alice.sh
  fi
  if [ "${CARCH}" == "i586" ]; then
    rm -r ext/jogl/lib/linux-amd64/
    rm -r application/linux-amd64/
    rm alice64bit.sh
  fi

  #Install files
  #Spaces don't work with this method
  #for i in $(find . -type f); do
  #  #Java does not require that the files are executable (644)
  #  install -Dm644 "${i}" "${pkgdir}${i#.}"
  #done
  msg "Copying Alice to package directory..."
  find . -type f -exec install -Dm644 "{}" "${pkgdir}${PREFIX}/{}" \;

  #Make launch script executable
  chmod +x "${pkgdir}${PREFIX}/alice.sh"

  #Install launch script
  msg "Creating launcher script: /usr/bin/alice..."
  install -dm755 "${pkgdir}/usr/bin/"
  echo '#!/bin/bash' > "${pkgdir}/usr/bin/alice"
  echo "cd \"${PREFIX}\"" >> "${pkgdir}/usr/bin/alice"
  echo "./alice.sh" >> "${pkgdir}/usr/bin/alice"
  chmod +x "${pkgdir}/usr/bin/alice"
}

# vim:set ts=2 sw=2 et:
