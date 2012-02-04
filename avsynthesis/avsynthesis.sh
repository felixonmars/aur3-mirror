#!/bin/sh
avdir=/usr/share/avsynthesis
libdir=$avdir/lib
jogldir=/usr/share/java/jogl
pushd $avdir
java -Xmx512m -Djogl.GLContext.nofree=true -Dsun.java2d.d3d=false -Dsun.java2d.noddraw=true -cp AVSynthesis.jar:$libdir/javaosc.jar:$jogldir/jogl.jar:$jogldir/gluegen-rt.jar:/usr/lib/csound/java/csnd.jar org.avs.AVSynthesis
popd
