# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
pkgname=alice3
pkgver=3.0.3.2.0
pkgrel=1
pkgdesc="An Educational Software that teaches students computer programming in a 3D environment"
arch=('i686' 'x86_64')
url="http://www.alice.org/"
license=('custom')
depends=('java-runtime')
source=("http://alice.org/downloads/installers/Alice3Beta_3.0.3.2.0.zip")
sha512sums=('4a655e5e41f4496744e34e0f6380b30ef2f6fb63b5aa01f4e4ff519f97374505b11907586741d8b37679b53b705bc1fb72952eaacfb4fe73914a7543f601e20a')

#This won't go in a repository. No need to waste time or CPU cycles
#  compressing the package.
PKGEXT=".pkg.tar"

#Install prefix
PREFIX="/opt/Alice3Beta"

build() {
  msg "Nothing to build."
}

check() {
  msg "Nothing to check."
}

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
